<?php

namespace Application\userBundle\Security\User\Provider;

use HWI\Bundle\OAuthBundle\OAuth\Response\UserResponseInterface;
use HWI\Bundle\OAuthBundle\Security\Core\User\FOSUBUserProvider as BaseClass;

class FOSUBUserProvider extends BaseClass {

    /**
     * {@inheritDoc}
     */
    public function connect($user, UserResponseInterface $response) {
        $property = $this->getProperty($response);
        $username = $response->getUsername();

        //on connect - get the access token and the user ID
        $service = $response->getResourceOwner()->getName();

        $setter = 'set' . ucfirst($service);
        $setter_id = $setter . 'Id';
        $setter_token = $setter . 'AccessToken';

        //we "disconnect" previously connected users
        if (null !== $previousUser = $this->userManager->findUserBy(array($property => $username))) {
            $previousUser->$setter_id(null);
            $previousUser->$setter_token(null);
            $this->userManager->updateUser($previousUser);
        }

        //we connect current user
        $user->$setter_id($username);
        $user->$setter_token($response->getAccessToken());

        $this->userManager->updateUser($user);
    }

    /**
     * {@inheritdoc}
     */
    public function loadUserByOAuthUserResponse(UserResponseInterface $response) {
        var_dump($response);exit;
        $username = $response->getUsername();
        $responseArray = $response->getResponse();
        //echo $this->getProperty($response);
        //echo $username;exit;
        $user = $this->userManager->findUserByEmail($responseArray['email']);
        //$user = $this->userManager->findUserBy(array($this->getProperty($response) => $username));
        //when the user is registrating
        if (null === $user) {

            $service = $response->getResourceOwner()->getName();
            $setter = 'set' . ucfirst($service);
            $setter_id = $setter . 'Id';
            $setter_token = $setter . 'AccessToken';
            // create new user here
            $user = $this->userManager->createUser();
            $user->$setter_id($username);
            $user->$setter_token($response->getAccessToken());
            //I have set all requested data with the user's username
            //modify here with relevant data
            switch ($service) {
                case 'facebook':
                    $user->setUsername($responseArray['email']);
                    $user->setEmail($responseArray['email']);
                    $user->setUserfirstname($responseArray['first_name']);
                    $user->setUserlastname($responseArray['last_name']);
                    $user->setUserdob(new \DateTime($responseArray['birthday']));
                    $user->setUsergender($responseArray['gender']);
                    $user->setPassword($username);
                    $user->setPlainPassword($username);
                    $user->setRoles(array('ROLE_FACEBOOK'));
                    break;
                case 'google':
                    $user->setUsername($responseArray['email']);
                    $user->setEmail($responseArray['email']);
                    $user->setUserfirstname($responseArray['given_name']);
                    $user->setUserlastname($responseArray['family_name']);
                    $user->setPlainPassword($username);
                    $user->setRoles(array('ROLE_GOOGLE'));
                    break;
                default :
                    $user->setUsername($username);
                    $user->setEmail($username);
                    $user->setPassword($username);
            }

            $user->setEnabled(true);
            $this->userManager->updateUser($user);
            return $user;
        } else {
            $oAuthuser = $this->userManager->findUserBy(array($this->getProperty($response) => $username));
            if (null === $oAuthuser) {
                
                $service = $response->getResourceOwner()->getName();
                $setter = 'set' . ucfirst($service);
                $setter_id = $setter . 'Id';
                $setter_token = $setter . 'AccessToken';
                $user->$setter_id($username);
                $user->$setter_token($response->getAccessToken());
                $user->addRole('ROLE_'.\strtoupper($setter));
                $this->userManager->updateUser($user);
            }
        }
        //if user exists - go with the HWIOAuth way
        $user = parent::loadUserByOAuthUserResponse($response);

        $serviceName = $response->getResourceOwner()->getName();
        $setter = 'set' . ucfirst($serviceName) . 'AccessToken';

        //update access token
        $user->$setter($response->getAccessToken());

        return $user;
    }

}
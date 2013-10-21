<?php

namespace Application\UserBundle\Listener;

use Symfony\Component\EventDispatcher\Event;
use Symfony\Component\Security\Core\SecurityContext;
use Doctrine\Bundle\DoctrineBundle\Registry as Doctrine; // for Symfony 2.1.x
use Symfony\Component\HttpKernel\Event\FilterResponseEvent;
use Symfony\Component\HttpFoundation\RedirectResponse;

//use Symfony\Component\HttpKernel\Event\FilterResponseEvent;
// use Symfony\Bundle\DoctrineBundle\Registry as Doctrine; // for Symfony 2.0.x

/**
 * Custom login listener.
 */
class LoginListener {

    /** @var \Symfony\Component\Security\Core\SecurityContext */
    private $context;

    /** @var \Doctrine\ORM\EntityManager */
    private $em;
    private $router;
    private $redirectToAdmin = false;
    private $redirectRouteName = NULL;
    private $redirectRoutes = array();

    /**
     * Constructor
     *
     * @param SecurityContext $context
     * @param Doctrine $doctrine
     */
    public function __construct(SecurityContext $context, Doctrine $doctrine, \Symfony\Component\Routing\Router $router) {
        $this->context = $context;
        $this->router = $router;
        $this->em = $doctrine->getEntityManager();
        $this->redirectRoutes = array(
            'ROLE_ADMIN' => 'admin_dashboard',
        );
    }

    /**
     * Logic After Success Login.
     *
     * @param Event $event
     */
    public function onSecurityInteractiveLogin(Event $event) {
        $user = $this->context->getToken()->getUser();
        if ($user instanceof UserInterface) {
            $user->setLastLogin(new \DateTime());
            $this->userManager->updateUser($user);
        }

        if ($this->context->isGranted('ROLE_ADMIN')) {
            $this->redirectRouteName = $this->redirectRoutes['ROLE_ADMIN'];
            $this->redirectToAdmin = true;
            if ($this->redirectToAdmin) {             
            }
        } else {
            $this->redirectToAdmin = true;
            //$this->redirectRouteName='homepage';
        }
    }

    public function onKernelResponse(FilterResponseEvent $event) {
        if ($this->redirectToAdmin) {
            $event->setResponse(new RedirectResponse($this->router->generate($this->redirectRouteName)));
        }
        
    }

}

?>

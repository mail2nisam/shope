<?php

namespace Application\userBundle\Form\Type;

use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;
use FOS\UserBundle\Form\Type\RegistrationFormType as BaseType;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\Form\Event\DataEvent;

class RegistrationFormType extends BaseType {

    public function buildForm(FormBuilderInterface $builder, array $options) {
        parent::buildForm($builder, $options);
        //$factory = $builder->getFormFactory();
        // add your custom field

        $builder->add('userfirstname');
        $builder->add('userlastname');
        $builder->add('userphone');
        $builder->add('useradress1');
        $builder->add('useradress2');
        $builder->add('usercity');
        $builder->add('countryid');
        $builder->add('stateid');
        $builder->add('userprovince');
        $builder->add('userzip');
        $builder->add('userreferralid');
        $builder->add('userprofilepicture', 'file');
        $builder->add('userdob', 'date', array(
            'years' => range(date('Y') - 50, date('Y')), //'widget' => 'single_text', --------for jaquery UI DatePicker---------
            'format' => 'dd-MM-yyyy',
            'widget' => 'single_text',
            'empty_value' => array('year' => 'Year', 'month' => 'Month', 'day' => 'Day'),
        ));
        $builder->add('usergender', 'choice', array(
            'choices' => array(
                'male' => 'Male',
                'female' => 'Female',
            ),
            'multiple' => false, 'expanded' => true));
    }

    public function getName() {
        return 'app_user_registration';
    }

}

?>

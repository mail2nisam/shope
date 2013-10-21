<?php

namespace Application\AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class DealsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('istaxable')
            ->add('taxclassid')
            ->add('taxrate')
            ->add('dealkey')
            ->add('dealtitle')
            ->add('dealcertificatetitle')
            ->add('dealfineprint')
            ->add('dealhighlights')
            ->add('dealdescription')
            ->add('dealreviews')
            ->add('certificateinstructions')
            ->add('dealmetatitle')
            ->add('dealmetadescription')
            ->add('dealmetakeywords')
            ->add('dealbusinesslocations')
            ->add('dealtimezone')
            ->add('dealstarttime')
            ->add('dealendtime')
            ->add('dealminbuylimit')
            ->add('dealmaxgiftbuy')
            ->add('dealmaxbuylimit')
            ->add('dealminqntyreqtotipp')
            ->add('dealexpirydate')
            ->add('dealcommissionrate')
            ->add('dealuseglobalcommision')
            ->add('dealcommissiontype')
            ->add('dealservicefee')
            ->add('dealshownosbought')
            ->add('dealshowdealtipped')
            ->add('dealonlineredemption')
            ->add('dealimage')
            ->add('dealpriority')
            ->add('dealstatus')
            ->add('inventorytracklevel')
            ->add('dealcreateddate')
            ->add('dealtippeddate')
            ->add('shippingstatus')
            ->add('dealtypeid')
            ->add('businessid')
        ;
    }

    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Application\AppBundle\Entity\Deals'
        ));
    }

    public function getName()
    {
        return 'application_appbundle_dealstype';
    }
}

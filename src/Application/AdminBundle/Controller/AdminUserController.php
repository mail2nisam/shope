<?php

namespace Application\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class AdminUserController extends Controller
{
    public function indexAction()
    {
        return $this->render('AdminBundle:Dashboard:index.html.twig', array('name' => 'hhj'));
    }
}

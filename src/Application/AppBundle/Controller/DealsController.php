<?php

namespace Application\AppBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Application\AppBundle\Entity\Deals;
use Application\AppBundle\Form\DealsType;

/**
 * Deals controller.
 *
 */
class DealsController extends Controller
{
    /**
     * Lists all Deals entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('AppBundle:Deals')->findAll();

        return $this->render('AppBundle:Deals:index.html.twig', array(
            'entities' => $entities,
        ));
    }

    /**
     * Finds and displays a Deals entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('AppBundle:Deals')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Deals entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('AppBundle:Deals:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),        ));
    }

    /**
     * Displays a form to create a new Deals entity.
     *
     */
    public function newAction()
    {
        $entity = new Deals();
        $form   = $this->createForm(new DealsType(), $entity);

        return $this->render('AppBundle:Deals:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Creates a new Deals entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity  = new Deals();
        $form = $this->createForm(new DealsType(), $entity);
        $form->bind($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('product_show', array('id' => $entity->getId())));
        }

        return $this->render('AppBundle:Deals:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Deals entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('AppBundle:Deals')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Deals entity.');
        }

        $editForm = $this->createForm(new DealsType(), $entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('AppBundle:Deals:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Edits an existing Deals entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('AppBundle:Deals')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Deals entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createForm(new DealsType(), $entity);
        $editForm->bind($request);

        if ($editForm->isValid()) {
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('product_edit', array('id' => $id)));
        }

        return $this->render('AppBundle:Deals:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a Deals entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->bind($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('AppBundle:Deals')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Deals entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('product'));
    }

    private function createDeleteForm($id)
    {
        return $this->createFormBuilder(array('id' => $id))
            ->add('id', 'hidden')
            ->getForm()
        ;
    }
}

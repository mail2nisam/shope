<?php

namespace Application\AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Application\AppBundle\Entity\States
 */
class States
{
    /**
     * @var integer $id
     */
    private $id;

    /**
     * @var integer $countryid
     */
    private $countryid;

    /**
     * @var string $statename
     */
    private $statename;

    /**
     * @var string $stateshortname
     */
    private $stateshortname;

    /**
     * @var string $statestatus
     */
    private $statestatus;


    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set countryid
     *
     * @param integer $countryid
     * @return States
     */
    public function setCountryid($countryid)
    {
        $this->countryid = $countryid;
    
        return $this;
    }

    /**
     * Get countryid
     *
     * @return integer 
     */
    public function getCountryid()
    {
        return $this->countryid;
    }

    /**
     * Set statename
     *
     * @param string $statename
     * @return States
     */
    public function setStatename($statename)
    {
        $this->statename = $statename;
    
        return $this;
    }

    /**
     * Get statename
     *
     * @return string 
     */
    public function getStatename()
    {
        return $this->statename;
    }

    /**
     * Set stateshortname
     *
     * @param string $stateshortname
     * @return States
     */
    public function setStateshortname($stateshortname)
    {
        $this->stateshortname = $stateshortname;
    
        return $this;
    }

    /**
     * Get stateshortname
     *
     * @return string 
     */
    public function getStateshortname()
    {
        return $this->stateshortname;
    }

    /**
     * Set statestatus
     *
     * @param string $statestatus
     * @return States
     */
    public function setStatestatus($statestatus)
    {
        $this->statestatus = $statestatus;
    
        return $this;
    }

    /**
     * Get statestatus
     *
     * @return string 
     */
    public function getStatestatus()
    {
        return $this->statestatus;
    }
    public function __toString() {
        return $this->getStatename();
    }

}
<?php

namespace Application\AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Application\AppBundle\Entity\Countries
 */
class Countries
{
    /**
     * @var integer $id
     */
    private $id;

    /**
     * @var string $countryname
     */
    private $countryname;

    /**
     * @var string $countryavailable
     */
    private $countryavailable;

    /**
     * @var string $countryisoa2
     */
    private $countryisoa2;

    /**
     * @var string $countryisoa3
     */
    private $countryisoa3;

    /**
     * @var string $countryisonumber
     */
    private $countryisonumber;

    /**
     * @var integer $countrypriority
     */
    private $countrypriority;

    /**
     * @var integer $addressformatid
     */
    private $addressformatid;


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
     * Set countryname
     *
     * @param string $countryname
     * @return Countries
     */
    public function setCountryname($countryname)
    {
        $this->countryname = $countryname;
    
        return $this;
    }

    /**
     * Get countryname
     *
     * @return string 
     */
    public function getCountryname()
    {
        return $this->countryname;
    }

    /**
     * Set countryavailable
     *
     * @param string $countryavailable
     * @return Countries
     */
    public function setCountryavailable($countryavailable)
    {
        $this->countryavailable = $countryavailable;
    
        return $this;
    }

    /**
     * Get countryavailable
     *
     * @return string 
     */
    public function getCountryavailable()
    {
        return $this->countryavailable;
    }

    /**
     * Set countryisoa2
     *
     * @param string $countryisoa2
     * @return Countries
     */
    public function setCountryisoa2($countryisoa2)
    {
        $this->countryisoa2 = $countryisoa2;
    
        return $this;
    }

    /**
     * Get countryisoa2
     *
     * @return string 
     */
    public function getCountryisoa2()
    {
        return $this->countryisoa2;
    }

    /**
     * Set countryisoa3
     *
     * @param string $countryisoa3
     * @return Countries
     */
    public function setCountryisoa3($countryisoa3)
    {
        $this->countryisoa3 = $countryisoa3;
    
        return $this;
    }

    /**
     * Get countryisoa3
     *
     * @return string 
     */
    public function getCountryisoa3()
    {
        return $this->countryisoa3;
    }

    /**
     * Set countryisonumber
     *
     * @param string $countryisonumber
     * @return Countries
     */
    public function setCountryisonumber($countryisonumber)
    {
        $this->countryisonumber = $countryisonumber;
    
        return $this;
    }

    /**
     * Get countryisonumber
     *
     * @return string 
     */
    public function getCountryisonumber()
    {
        return $this->countryisonumber;
    }

    /**
     * Set countrypriority
     *
     * @param integer $countrypriority
     * @return Countries
     */
    public function setCountrypriority($countrypriority)
    {
        $this->countrypriority = $countrypriority;
    
        return $this;
    }

    /**
     * Get countrypriority
     *
     * @return integer 
     */
    public function getCountrypriority()
    {
        return $this->countrypriority;
    }

    /**
     * Set addressformatid
     *
     * @param integer $addressformatid
     * @return Countries
     */
    public function setAddressformatid($addressformatid)
    {
        $this->addressformatid = $addressformatid;
    
        return $this;
    }

    /**
     * Get addressformatid
     *
     * @return integer 
     */
    public function getAddressformatid()
    {
        return $this->addressformatid;
    }
    public function __toString() {
        return $this->getCountryname();   
    }

}
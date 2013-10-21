<?php

namespace Application\userBundle;

use Symfony\Component\HttpKernel\Bundle\Bundle;

class ApplicationuserBundle extends Bundle
{
    public function getParent()
    {
        return 'FOSUserBundle';
    }
}

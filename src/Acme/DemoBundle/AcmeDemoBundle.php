<?php

namespace Acme\DemoBundle;

use Symfony\Component\HttpKernel\Bundle\Bundle;

class AcmeDemoBundle extends Bundle
{
	public function boot() { $em = $this->container->get('doctrine')->getEntityManager(); $platform = $em->getConnection()->getDatabasePlatform(); $platform->registerDoctrineTypeMapping('enum', 'string'); }
}

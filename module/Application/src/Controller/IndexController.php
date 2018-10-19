<?php
/**
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2016 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */
namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class IndexController extends AbstractActionController
{

    public function indexAction()
    {
        if (!$this->access('profile.own.view', [])) {
            return $this->redirect()->toRoute('not-authorized');
        }
        
        return new ViewModel();
    }

    public function docAction()
    {
        $pageTemplate = 'application/index/doc' . $this->params()->fromRoute('page', 'documentation.phtml');

        $filePath = __DIR__ . '/../../view/' . $pageTemplate . '.phtml';
        if (! file_exists($filePath) || ! is_readable($filePath)) {
            $this->getResponse()->setStatusCode(404);
            return;
        }

        $viewModel = new ViewModel([
            'page' => $pageTemplate
        ]);
        $viewModel->setTemplate($pageTemplate);

        return $viewModel;
    }

    public function staticAction()
    {
        $pageTemplate = 'application/index/static' . $this->params()->fromRoute('page', 'help.phtml');

        $filePath = __DIR__ . '/../../view/' . $pageTemplate . '.phtml';
        if (! file_exists($filePath) || ! is_readable($filePath)) {
            $this->getResponse()->setStatusCode(404);
            return;
        }

        $viewModel = new ViewModel([
            'page' => $pageTemplate
        ]);
        $viewModel->setTemplate($pageTemplate);

        return $viewModel;
    }

    public function aboutAction()
    {
        return new ViewModel();
    }
}

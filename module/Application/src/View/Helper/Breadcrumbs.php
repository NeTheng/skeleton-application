<?php
namespace Application\View\Helper;

use Zend\View\Helper\AbstractHelper;

/**
 * This view helper class displays breadcrumbs.
 */
class Breadcrumbs extends AbstractHelper {
	/**
	 * Array of items.
	 * @var array
	 */
	private $items = [];

	/**
	 * Constructor.
	 * @param array $items Array of items (optional).
	 */
	public function __construct($items = []) {
		$this->items = $items;
	}

	/**
	 * Sets the items.
	 * @param array $items Items.
	 */
	public function setItems($items) {
		$this->items = $items;
	}

	/**
	 * Renders the breadcrumbs.
	 * @return string HTML code of the breadcrumbs.
	 */
	public function render() {
		if (count($this->items) == 0) {
			return '';
		}
		// Do nothing if there are no items.

		// Resulting HTML code will be stored in this var
		$result = '<div class="row wrapper border-bottom white-bg page-heading">';
		$result .= '<div class="col-lg-10">';
		$result .= '<h3>Tabs</h3>';
		$result .= '<ol class="breadcrumb">';

		// Get item count
		$itemCount = count($this->items);

		$itemNum = 1; // item counter

		// Walk through items
		foreach ($this->items as $label => $link) {

			// Make the last item inactive
			$isActive = ($itemNum == $itemCount ? true : false);

			// Render current item
			$result .= $this->renderItem($label, $link, $isActive);

			// Increment item counter
			$itemNum++;
		}

		$result .= '</ol>';
		$result .= '</div>';

		$result .= '<div class="col-lg-2">';
		$result .= '</div>';

		$result .= '</div>';

		return $result;

	}

	/**
	 * Renders an item.
	 * @param string $label
	 * @param string $link
	 * @param boolean $isActive
	 * @return string HTML code of the item.
	 */
	protected function renderItem($label, $link, $isActive) {
		$escapeHtml = $this->getView()->plugin('escapeHtml');

		$result = $isActive ? '<li class="active breadcrumb-item">' : '<li class="breadcrumb-item">';

		if (!$isActive) {
			$result .= '<a href="' . $escapeHtml($link) . '">' . $escapeHtml($label) . '</a>';
		} else {
			$result .= '<strong>' . $escapeHtml($label) . '</strong>';
		}

		$result .= '</li>';

		return $result;
	}
}

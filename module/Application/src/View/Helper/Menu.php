<?php
namespace Application\View\Helper;

use Zend\View\Helper\AbstractHelper;

/**
 * This view helper class displays a menu bar.
 */
class Menu extends AbstractHelper {
	/**
	 * Menu items array.
	 * @var array
	 */
	protected $items = [];

	/**
	 * Active item's ID.
	 * @var string
	 */
	protected $activeItemId = '';

	/**
	 * Constructor.
	 * @param array $items Menu items.
	 */
	public function __construct($items = []) {
		$this->items = $items;
	}

	/**
	 * Sets menu items.
	 * @param array $items Menu items.
	 */
	public function setItems($items) {
		$this->items = $items;
	}

	/**
	 * Sets ID of the active items.
	 * @param string $activeItemId
	 */
	public function setActiveItemId($activeItemId) {
		$this->activeItemId = $activeItemId;
	}

	/** * Renders the menu.
	 * @return string HTML code of the menu.
	 */
	public function render() {
		if (count($this->items) == 0) {
			return '';
		}

		$result = '';
		// Render items
		foreach ($this->items as $item) {
			$result .= $this->renderItem($item);
		}

		return $result;

	}

	/**
	 * Renders an item.
	 * @param array $item The menu item info.
	 * @return string HTML code of the item.
	 */
	protected function renderItem($item) {
		$id = isset($item['id']) ? $item['id'] : '';
		$isActive = ($id == $this->activeItemId);
		$label = isset($item['label']) ? $item['label'] : '';
		$class_parent = isset($item['class']) ? $item['class'] : '';

		$result = '';
		$escapeHtml = $this->getView()->plugin('escapeHtml');

		if (isset($item['dropdown'])) {

			$dropdownItems = $item['dropdown'];

			$result .= '<li class="dropdown ' . ($isActive ? 'active' : '') . '">';
			$result .= '<a href="#"><i class="' . $escapeHtml($class_parent) . '"></i><span class="nav-label">' . $escapeHtml($label) . '</span><span class="fa arrow"></span></a>';

			$result .= '<ul class="nav nav-second-level">';
			foreach ($dropdownItems as $item) {
				$link = isset($item['link']) ? $item['link'] : '#';
				$label = isset($item['label']) ? $item['label'] : '';
				$class = isset($item['class_0']) ? $item['class_0'] : '';


				$result .= '<li>';
				$result .= '<a href="' . $escapeHtml($link) . '"><i class="' . $escapeHtml($class) . '"></i>' . $escapeHtml($label) . '</a>';
				$result .= '</li>';
			}
			$result .= '</ul>';
			$result .= '</li>';

		} else {
			$link = isset($item['link']) ? $item['link'] : '#';
			$result .= $isActive ? '<li class="active">' : '<li>';
			$result .= '<a href="' . $escapeHtml($link) . '"><i class="'.(isset($item['class']) ? $item['class'] : "").'"></i> <span class="nav-label">' . $escapeHtml($label) . '</span> <span class="fa arrow"></span></a>';
			$result .= '</li>';
		}

		return $result;
	}
}

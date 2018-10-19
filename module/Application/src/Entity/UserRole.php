<?php
namespace Application\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * This class represents a registered user.
 * @ORM\Entity()
 * @ORM\Table(name="user_role")
 */
class UserRole {

	/**
	 * @ORM\Id
	 * @ORM\Column(name="id")
	 * @ORM\GeneratedValue
	 */
	protected $id;

	/**
	 * @ORM\Column(name="user_id")
	 */
	protected $user_id;

	/**
	 * @ORM\Column(name="role_id")
	 */
	protected $role_id;

	/**
	 * Constructor.
	 */
	public function __construct() {
		$this->roles = new ArrayCollection();
	}

	/**
	 * Returns user_role ID.
	 * @return integer
	 */
	public function getId() {
		return $this->id;
	}

	/**
	 * Sets user_role ID.
	 * @param int $id
	 */
	public function setId($id) {
		$this->id = $id;
	}

	/**
	 * Returns user_role ID.
	 * @return integer
	 */
	public function getUserId() {
		return $this->user_id;
	}

	/**
	 * Sets user_role ID.
	 * @param int $id
	 */
	public function setUserId($id) {
		$this->user_id = $id;
	}

	/**
	 * Returns role_id ID.
	 * @return integer
	 */
	public function getRoleId() {
		return $this->role_id;
	}

	/**
	 * Sets role_id ID.
	 * @param int $id
	 */
	public function setRoleId($id) {
		$this->role_id = $id;
	}

}
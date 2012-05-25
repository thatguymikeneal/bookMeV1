<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Booking extends CI_Controller 
{
	/**
	 * Index Page for the site which will load
	 * the main view for staff and the additional
	 * menu items for admin users such as
	 * block bookings and settings
	 */
	
	function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->model('Settings_model');
		$this->load->view('template/header_view', array( 'bg_colour' => $this->Settings_model->get_bg_colour()));
		$this->load->view('main_menu', array( 'school_name' => $this->Settings_model->get_school_name()));
	}
	
	/*
	 * as and when bookings controller is tidied up and separated out, the following views need to be edited too:
	 * main_body_booking.php -> a href link changed to reflect subfolder/class 
	 */
	
	function index()
	{
		echo "Index function of bookings";
	}

	function booking_room_overview()
	{
		$this->load->view('booking/booking_room_overview');
	}
	
}
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Periods extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->model('Settings_model');
		$this->load->view('template/header_view', array( 'bg_colour' => $this->Settings_model->get_bg_colour()));
		$this->load->view('main_menu', array( 'school_name' => $this->Settings_model->get_school_name()));
		
	}
	
	function index()
	{

	}
	
	function period_settings()
	{
		$data['period_count'] = $this->Settings_model->get_period_count();

		//if no periods exist, load a view to show period add page
		if ($data['period_count'] == 0)
		{
			$this->load->view('settings/settings_periods_add', array('error' => ' ' ));
			$this->load->view('template/footer');
		} else 
		//else get the list of periods in the database, order them
		//by period_start ascending and show them
		{
			$data['periods'] = $this->Settings_model->get_all_periods();
			$this->load->view('settings/settings_periods_edit',$data);
			$this->load->view('template/footer');
		}
	}
	
	function submit_new_period()
	{
		//update the database with the details given
		$period_name = $this->input->post('period_name');
		$period_start = $this->input->post('period_start');
		$period_end = $this->input->post('period_end');
		$period_bookable = $this->input->post('period_bookable');
		$this->Settings_model->add_period($period_name, $period_start, $period_end, $period_bookable);
			
		//then load the view
		$this->load->view('settings/settings_periods_update');
		$this->load->view('template/footer');
	}
	
	function edit_period()
	{
		$period_id = $this->uri->segment(4);
		$data = $this->Settings_model->get_period_info($period_id);
		$this->load->view('settings/edit_period', $data);
		$this->load->view('template/footer');
	}
	
	function update_period()
	{
		$period_id = $this->input->post('period_id');
		$period_name = $this->input->post('period_name');
		$period_start = $this->input->post('period_start');
		$period_end = $this->input->post('period_end');
		$period_bookable = $this->input->post('period_bookable');
		$this->Settings_model->update_period($period_id, $period_name, $period_start, $period_end, $period_bookable);
		
		//load the view
		$this->load->view('settings/settings_periods_update');
		$this->load->view('template/footer');
	}
	
	function add_period()
	{
		$this->load->view('settings/settings_periods_add', array('error' => ' ' ));
		$this->load->view('template/footer');
	}
	
	function period_delete()
	{
		$this->load->model('Main_model');
		$period_id = $this->uri->segment(4);
		$query = $this->db->delete('periods', array('period_id' => $period_id)); 
		
		$this->load->view('settings/settings_periods_update');	
		$this->load->view('template/footer');
	}
	
}
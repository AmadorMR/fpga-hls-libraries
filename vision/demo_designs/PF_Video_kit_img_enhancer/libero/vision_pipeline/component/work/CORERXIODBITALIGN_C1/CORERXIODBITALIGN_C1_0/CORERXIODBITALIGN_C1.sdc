set_component CORERXIODBITALIGN_C1
set_false_path -from [ get_cells { */u_CoreRxIODBitAlign/mv_up_fg } ]
set_false_path -to [ get_cells { */u_CoreRxIODBitAlign/mv_up_fg } ]
set_false_path -from [ get_cells { */u_CoreRxIODBitAlign/mv_dn_fg } ]
set_false_path -to [ get_cells { */u_CoreRxIODBitAlign/mv_dn_fg } ]
set_false_path -from [ get_cells { */u_CoreRxIODBitAlign/reset_dly_fg } ]
set_false_path -from [ get_cells { */u_CoreRxIODBitAlign/rx_trng_done } ]
set_false_path -from [ get_cells { */u_CoreRxIODBitAlign/timeout_cnt[*] } ]
set_false_path -to [ get_cells { */u_CoreRxIODBitAlign/timeout_cnt[*] } ] 
set_multicycle_path -setup 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_found_lsb_d } ]
set_multicycle_path -setup 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_found_msb_d } ]
set_multicycle_path -setup 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_found_lsb_d } ]
set_multicycle_path -setup 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_found_msb_d } ]
set_multicycle_path -setup 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_not_found_lsb_d } ]
set_multicycle_path -setup 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_not_found_msb_d } ]
set_multicycle_path -setup 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_not_found_lsb_d } ]
set_multicycle_path -setup 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_not_found_msb_d } ]
set_multicycle_path -setup 3 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_cur_set } ]
set_multicycle_path -setup 3 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_last_set } ]
set_multicycle_path -setup 3 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_cur_set } ]
set_multicycle_path -setup 3 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_last_set } ]
set_multicycle_path -setup 3 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_val[*] } ]
set_multicycle_path -setup 3 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_val[*] } ]
set_multicycle_path -setup 3 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/no_early_no_late_val_st1[*] } ]
set_multicycle_path -setup 3 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/no_early_no_late_val_end1[*] } ]
set_multicycle_path -setup 3 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/no_early_no_late_val_st2[*] } ]
set_multicycle_path -setup 3 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/no_early_no_late_val_end2[*] } ]
set_multicycle_path -setup 3 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_late_diff[*] } ]
set_multicycle_path -setup 3 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/noearly_nolate_diff_start[*] } ]
set_multicycle_path -setup 3 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/noearly_nolate_diff_nxt[*] } ]
set_multicycle_path -hold 1 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_found_lsb_d } ]
set_multicycle_path -hold 1 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_found_msb_d } ]
set_multicycle_path -hold 1 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_found_lsb_d } ]
set_multicycle_path -hold 1 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_found_msb_d } ]
set_multicycle_path -hold 1 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_not_found_lsb_d } ]
set_multicycle_path -hold 1 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_not_found_msb_d } ]
set_multicycle_path -hold 1 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_not_found_lsb_d } ]
set_multicycle_path -hold 1 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_not_found_msb_d } ]
set_multicycle_path -hold 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_cur_set } ]
set_multicycle_path -hold 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_last_set } ]
set_multicycle_path -hold 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_cur_set } ]
set_multicycle_path -hold 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_last_set } ]
set_multicycle_path -hold 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_val[*] } ]
set_multicycle_path -hold 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_val[*] } ]
set_multicycle_path -hold 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/no_early_no_late_val_st1[*] } ]
set_multicycle_path -hold 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/no_early_no_late_val_end1[*] } ]
set_multicycle_path -hold 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/no_early_no_late_val_st2[*] } ]
set_multicycle_path -hold 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/no_early_no_late_val_end2[*] } ]
set_multicycle_path -hold 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_late_diff[*] } ]
set_multicycle_path -hold 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/noearly_nolate_diff_start[*] } ]
set_multicycle_path -hold 2 -from [ get_cells { */u_CoreRxIODBitAlign/emflag_cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/noearly_nolate_diff_nxt[*] } ]
set_multicycle_path -setup 2 -from [ get_cells { */u_CoreRxIODBitAlign/cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/tap_cnt[*] } ]
set_multicycle_path -hold 1 -from [ get_cells { */u_CoreRxIODBitAlign/cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/tap_cnt[*] } ]
set_multicycle_path -setup 2 -from [ get_cells { */u_CoreRxIODBitAlign/bitalign_curr_state[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_flags_lsb[*] } ]
set_multicycle_path -setup 2 -from [ get_cells { */u_CoreRxIODBitAlign/bitalign_curr_state[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_flags_msb[*] } ]
set_multicycle_path -setup 2 -from [ get_cells { */u_CoreRxIODBitAlign/bitalign_curr_state[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_flags_lsb[*] } ]
set_multicycle_path -setup 2 -from [ get_cells { */u_CoreRxIODBitAlign/bitalign_curr_state[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_flags_msb[*] } ]
set_multicycle_path -hold 1 -from [ get_cells { */u_CoreRxIODBitAlign/bitalign_curr_state[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_flags_lsb[*] } ]
set_multicycle_path -hold 1 -from [ get_cells { */u_CoreRxIODBitAlign/bitalign_curr_state[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_flags_msb[*] } ]
set_multicycle_path -hold 1 -from [ get_cells { */u_CoreRxIODBitAlign/bitalign_curr_state[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_flags_lsb[*] } ]
set_multicycle_path -hold 1 -from [ get_cells { */u_CoreRxIODBitAlign/bitalign_curr_state[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_flags_msb[*] } ]
set_multicycle_path -setup 2 -from [ get_cells { */u_CoreRxIODBitAlign/cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_flags_lsb[*] } ]
set_multicycle_path -setup 2 -from [ get_cells { */u_CoreRxIODBitAlign/cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_flags_msb[*] } ]
set_multicycle_path -setup 2 -from [ get_cells { */u_CoreRxIODBitAlign/cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_flags_lsb[*] } ]
set_multicycle_path -setup 2 -from [ get_cells { */u_CoreRxIODBitAlign/cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_flags_msb[*] } ]
set_multicycle_path -hold 1 -from [ get_cells { */u_CoreRxIODBitAlign/cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_flags_lsb[*] } ]
set_multicycle_path -hold 1 -from [ get_cells { */u_CoreRxIODBitAlign/cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/late_flags_msb[*] } ]
set_multicycle_path -hold 1 -from [ get_cells { */u_CoreRxIODBitAlign/cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_flags_lsb[*] } ]
set_multicycle_path -hold 1 -from [ get_cells { */u_CoreRxIODBitAlign/cnt[*] } ] -to [ get_cells { */u_CoreRxIODBitAlign/early_flags_msb[*] } ]

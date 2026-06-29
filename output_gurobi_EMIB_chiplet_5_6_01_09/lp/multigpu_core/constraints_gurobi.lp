\ Model ChipletPlacementGrid
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0x7a1676f316e262ed
Minimize
  0 r_0 + 0 r_1 + 0 r_2 + 0.00809061488673139 aspect_ratio_penalty
   - 2.09557e-07 power_aware_penalty + 8.7947e-05 wirelength
   + 0.0911834096301581 bbox_area_proxy_t
Subject To
 width_rotation_0: w_var_0 = 12
 height_rotation_0: h_var_0 = 12
 x_grid_var_ub_0: w_var_0 + x_grid_var_0 <= 141
 y_grid_var_ub_0: h_var_0 + y_grid_var_0 <= 141
 width_rotation_1: w_var_1 = 18.2
 height_rotation_1: h_var_1 = 18.2
 x_grid_var_ub_1: w_var_1 + x_grid_var_1 <= 141
 y_grid_var_ub_1: h_var_1 + y_grid_var_1 <= 141
 width_rotation_2: w_var_2 = 18.2
 height_rotation_2: h_var_2 = 18.2
 x_grid_var_ub_2: w_var_2 + x_grid_var_2 <= 141
 y_grid_var_ub_2: h_var_2 + y_grid_var_2 <= 141
 width_rotation_3: - 4.12 r_3 + w_var_3 = 7.75
 height_rotation_3: 4.12 r_3 + h_var_3 = 11.87
 x_grid_var_ub_3: w_var_3 + x_grid_var_3 <= 141
 y_grid_var_ub_3: h_var_3 + y_grid_var_3 <= 141
 width_rotation_4: - 4.12 r_4 + w_var_4 = 7.75
 height_rotation_4: 4.12 r_4 + h_var_4 = 11.87
 x_grid_var_ub_4: w_var_4 + x_grid_var_4 <= 141
 y_grid_var_ub_4: h_var_4 + y_grid_var_4 <= 141
 width_rotation_5: - 4.12 r_5 + w_var_5 = 7.75
 height_rotation_5: 4.12 r_5 + h_var_5 = 11.87
 x_grid_var_ub_5: w_var_5 + x_grid_var_5 <= 141
 y_grid_var_ub_5: h_var_5 + y_grid_var_5 <= 141
 EMIB_width_rotation_0_3: - 1.4133 r_EMIB_0_3 + EMIB_w_var_0_3 = 2
 EMIB_height_rotation_0_3: 1.4133 r_EMIB_0_3 + EMIB_h_var_0_3 = 3.4133
 EMIB_x_grid_var_ub_0_3: EMIB_w_var_0_3 + EMIB_x_grid_var_0_3 <= 141
 EMIB_y_grid_var_ub_0_3: EMIB_h_var_0_3 + EMIB_y_grid_var_0_3 <= 141
 EMIB_width_rotation_1_4: - 1.4133 r_EMIB_1_4 + EMIB_w_var_1_4 = 2
 EMIB_height_rotation_1_4: 1.4133 r_EMIB_1_4 + EMIB_h_var_1_4 = 3.4133
 EMIB_x_grid_var_ub_1_4: EMIB_w_var_1_4 + EMIB_x_grid_var_1_4 <= 141
 EMIB_y_grid_var_ub_1_4: EMIB_h_var_1_4 + EMIB_y_grid_var_1_4 <= 141
 EMIB_width_rotation_2_5: - 1.4133 r_EMIB_2_5 + EMIB_w_var_2_5 = 2
 EMIB_height_rotation_2_5: 1.4133 r_EMIB_2_5 + EMIB_h_var_2_5 = 3.4133
 EMIB_x_grid_var_ub_2_5: EMIB_w_var_2_5 + EMIB_x_grid_var_2_5 <= 141
 EMIB_y_grid_var_ub_2_5: EMIB_h_var_2_5 + EMIB_y_grid_var_2_5 <= 141
 cx_def_0: - 0.5 w_var_0 - x_grid_var_0 + cx_grid_var_0 = 0
 cy_def_0: - 0.5 h_var_0 - y_grid_var_0 + cy_grid_var_0 = 0
 cx_def_1: - 0.5 w_var_1 - x_grid_var_1 + cx_grid_var_1 = 0
 cy_def_1: - 0.5 h_var_1 - y_grid_var_1 + cy_grid_var_1 = 0
 cx_def_2: - 0.5 w_var_2 - x_grid_var_2 + cx_grid_var_2 = 0
 cy_def_2: - 0.5 h_var_2 - y_grid_var_2 + cy_grid_var_2 = 0
 cx_def_3: - 0.5 w_var_3 - x_grid_var_3 + cx_grid_var_3 = 0
 cy_def_3: - 0.5 h_var_3 - y_grid_var_3 + cy_grid_var_3 = 0
 cx_def_4: - 0.5 w_var_4 - x_grid_var_4 + cx_grid_var_4 = 0
 cy_def_4: - 0.5 h_var_4 - y_grid_var_4 + cy_grid_var_4 = 0
 cx_def_5: - 0.5 w_var_5 - x_grid_var_5 + cx_grid_var_5 = 0
 cy_def_5: - 0.5 h_var_5 - y_grid_var_5 + cy_grid_var_5 = 0
 EMIB_cx_def_0_3: - 0.5 EMIB_w_var_0_3 - EMIB_x_grid_var_0_3
   + EMIB_cx_grid_var_0_3 = 0
 EMIB_cy_def_0_3: - 0.5 EMIB_h_var_0_3 - EMIB_y_grid_var_0_3
   + EMIB_cy_grid_var_0_3 = 0
 EMIB_cx_def_1_4: - 0.5 EMIB_w_var_1_4 - EMIB_x_grid_var_1_4
   + EMIB_cx_grid_var_1_4 = 0
 EMIB_cy_def_1_4: - 0.5 EMIB_h_var_1_4 - EMIB_y_grid_var_1_4
   + EMIB_cy_grid_var_1_4 = 0
 EMIB_cx_def_2_5: - 0.5 EMIB_w_var_2_5 - EMIB_x_grid_var_2_5
   + EMIB_cx_grid_var_2_5 = 0
 EMIB_cy_def_2_5: - 0.5 EMIB_h_var_2_5 - EMIB_y_grid_var_2_5
   + EMIB_cy_grid_var_2_5 = 0
 must_adjacent_sb_0_3: z1_0_3 + z2_0_3 = 1
 horizontal_direction_sb_0_3: - z1_0_3 + z1L_0_3 + z1R_0_3 = 0
 vertical_direction_sb_0_3: - z2_0_3 + z2D_0_3 + z2U_0_3 = 0
 EMIB_rotate_eq_z2_0_3: r_EMIB_0_3 - z2_0_3 = 0
 horizontal_left_dist_lb_0_3: - w_var_0 - x_grid_var_0 + x_grid_var_3
   - 282 z1L_0_3 >= -282
 EMIB_left_overlap_0_3: w_var_0 + x_grid_var_0 - EMIB_x_grid_var_0_3
   - 282 z1L_0_3 >= -281.001
 EMIB_right_overlap_0_3: EMIB_w_var_0_3 - x_grid_var_3
   + EMIB_x_grid_var_0_3 - 282 z1L_0_3 >= -281.001
 horizontal_right_dist_lb_0_3: - w_var_3 + x_grid_var_0 - x_grid_var_3
   - 282 z1R_0_3 >= -282
 EMIB_left_overlap_right_0_3: w_var_3 + x_grid_var_3 - EMIB_x_grid_var_0_3
   - 282 z1R_0_3 >= -281.001
 EMIB_right_overlap_right_0_3: EMIB_w_var_0_3 - x_grid_var_0
   + EMIB_x_grid_var_0_3 - 282 z1R_0_3 >= -281.001
 vertical_down_dist_lb_0_3: - h_var_0 - y_grid_var_0 + y_grid_var_3
   - 282 z2D_0_3 >= -282
 EMIB_bottom_overlap_down_0_3: h_var_0 + y_grid_var_0 - EMIB_y_grid_var_0_3
   - 282 z2D_0_3 >= -281.001
 EMIB_top_overlap_down_0_3: EMIB_h_var_0_3 - y_grid_var_3
   + EMIB_y_grid_var_0_3 - 282 z2D_0_3 >= -281.001
 vertical_up_dist_lb_0_3: - h_var_3 + y_grid_var_0 - y_grid_var_3
   - 282 z2U_0_3 >= -282
 EMIB_bottom_overlap_up_0_3: h_var_3 + y_grid_var_3 - EMIB_y_grid_var_0_3
   - 282 z2U_0_3 >= -281.001
 EMIB_top_overlap_up_0_3: EMIB_h_var_0_3 - y_grid_var_0
   + EMIB_y_grid_var_0_3 - 282 z2U_0_3 >= -281.001
 shared_yi_ub1_0_3: h_var_0 - EMIB_h_var_0_3 + y_grid_var_0
   - EMIB_y_grid_var_0_3 - 282 z1_0_3 >= -282
 shared_yi_ub2_0_3: y_grid_var_0 - EMIB_y_grid_var_0_3 + 282 z1_0_3 <= 282
 shared_yj_ub1_0_3: h_var_3 - EMIB_h_var_0_3 + y_grid_var_3
   - EMIB_y_grid_var_0_3 - 282 z1_0_3 >= -282
 shared_yj_ub2_0_3: y_grid_var_3 - EMIB_y_grid_var_0_3 + 282 z1_0_3 <= 282
 shared_xi_ub1_0_3: w_var_0 - EMIB_w_var_0_3 + x_grid_var_0
   - EMIB_x_grid_var_0_3 - 282 z2_0_3 >= -282
 shared_xi_ub2_0_3: x_grid_var_0 - EMIB_x_grid_var_0_3 + 282 z2_0_3 <= 282
 shared_xj_ub1_0_3: w_var_3 - EMIB_w_var_0_3 + x_grid_var_3
   - EMIB_x_grid_var_0_3 - 282 z2_0_3 >= -282
 shared_xj_ub2_0_3: x_grid_var_3 - EMIB_x_grid_var_0_3 + 282 z2_0_3 <= 282
 must_adjacent_sb_1_4: z1_1_4 + z2_1_4 = 1
 horizontal_direction_sb_1_4: - z1_1_4 + z1L_1_4 + z1R_1_4 = 0
 vertical_direction_sb_1_4: - z2_1_4 + z2D_1_4 + z2U_1_4 = 0
 EMIB_rotate_eq_z2_1_4: r_EMIB_1_4 - z2_1_4 = 0
 horizontal_left_dist_lb_1_4: - w_var_1 - x_grid_var_1 + x_grid_var_4
   - 282 z1L_1_4 >= -282
 EMIB_left_overlap_1_4: w_var_1 + x_grid_var_1 - EMIB_x_grid_var_1_4
   - 282 z1L_1_4 >= -281.001
 EMIB_right_overlap_1_4: EMIB_w_var_1_4 - x_grid_var_4
   + EMIB_x_grid_var_1_4 - 282 z1L_1_4 >= -281.001
 horizontal_right_dist_lb_1_4: - w_var_4 + x_grid_var_1 - x_grid_var_4
   - 282 z1R_1_4 >= -282
 EMIB_left_overlap_right_1_4: w_var_4 + x_grid_var_4 - EMIB_x_grid_var_1_4
   - 282 z1R_1_4 >= -281.001
 EMIB_right_overlap_right_1_4: EMIB_w_var_1_4 - x_grid_var_1
   + EMIB_x_grid_var_1_4 - 282 z1R_1_4 >= -281.001
 vertical_down_dist_lb_1_4: - h_var_1 - y_grid_var_1 + y_grid_var_4
   - 282 z2D_1_4 >= -282
 EMIB_bottom_overlap_down_1_4: h_var_1 + y_grid_var_1 - EMIB_y_grid_var_1_4
   - 282 z2D_1_4 >= -281.001
 EMIB_top_overlap_down_1_4: EMIB_h_var_1_4 - y_grid_var_4
   + EMIB_y_grid_var_1_4 - 282 z2D_1_4 >= -281.001
 vertical_up_dist_lb_1_4: - h_var_4 + y_grid_var_1 - y_grid_var_4
   - 282 z2U_1_4 >= -282
 EMIB_bottom_overlap_up_1_4: h_var_4 + y_grid_var_4 - EMIB_y_grid_var_1_4
   - 282 z2U_1_4 >= -281.001
 EMIB_top_overlap_up_1_4: EMIB_h_var_1_4 - y_grid_var_1
   + EMIB_y_grid_var_1_4 - 282 z2U_1_4 >= -281.001
 shared_yi_ub1_1_4: h_var_1 - EMIB_h_var_1_4 + y_grid_var_1
   - EMIB_y_grid_var_1_4 - 282 z1_1_4 >= -282
 shared_yi_ub2_1_4: y_grid_var_1 - EMIB_y_grid_var_1_4 + 282 z1_1_4 <= 282
 shared_yj_ub1_1_4: h_var_4 - EMIB_h_var_1_4 + y_grid_var_4
   - EMIB_y_grid_var_1_4 - 282 z1_1_4 >= -282
 shared_yj_ub2_1_4: y_grid_var_4 - EMIB_y_grid_var_1_4 + 282 z1_1_4 <= 282
 shared_xi_ub1_1_4: w_var_1 - EMIB_w_var_1_4 + x_grid_var_1
   - EMIB_x_grid_var_1_4 - 282 z2_1_4 >= -282
 shared_xi_ub2_1_4: x_grid_var_1 - EMIB_x_grid_var_1_4 + 282 z2_1_4 <= 282
 shared_xj_ub1_1_4: w_var_4 - EMIB_w_var_1_4 + x_grid_var_4
   - EMIB_x_grid_var_1_4 - 282 z2_1_4 >= -282
 shared_xj_ub2_1_4: x_grid_var_4 - EMIB_x_grid_var_1_4 + 282 z2_1_4 <= 282
 must_adjacent_sb_2_5: z1_2_5 + z2_2_5 = 1
 horizontal_direction_sb_2_5: - z1_2_5 + z1L_2_5 + z1R_2_5 = 0
 vertical_direction_sb_2_5: - z2_2_5 + z2D_2_5 + z2U_2_5 = 0
 EMIB_rotate_eq_z2_2_5: r_EMIB_2_5 - z2_2_5 = 0
 horizontal_left_dist_lb_2_5: - w_var_2 - x_grid_var_2 + x_grid_var_5
   - 282 z1L_2_5 >= -282
 EMIB_left_overlap_2_5: w_var_2 + x_grid_var_2 - EMIB_x_grid_var_2_5
   - 282 z1L_2_5 >= -281.001
 EMIB_right_overlap_2_5: EMIB_w_var_2_5 - x_grid_var_5
   + EMIB_x_grid_var_2_5 - 282 z1L_2_5 >= -281.001
 horizontal_right_dist_lb_2_5: - w_var_5 + x_grid_var_2 - x_grid_var_5
   - 282 z1R_2_5 >= -282
 EMIB_left_overlap_right_2_5: w_var_5 + x_grid_var_5 - EMIB_x_grid_var_2_5
   - 282 z1R_2_5 >= -281.001
 EMIB_right_overlap_right_2_5: EMIB_w_var_2_5 - x_grid_var_2
   + EMIB_x_grid_var_2_5 - 282 z1R_2_5 >= -281.001
 vertical_down_dist_lb_2_5: - h_var_2 - y_grid_var_2 + y_grid_var_5
   - 282 z2D_2_5 >= -282
 EMIB_bottom_overlap_down_2_5: h_var_2 + y_grid_var_2 - EMIB_y_grid_var_2_5
   - 282 z2D_2_5 >= -281.001
 EMIB_top_overlap_down_2_5: EMIB_h_var_2_5 - y_grid_var_5
   + EMIB_y_grid_var_2_5 - 282 z2D_2_5 >= -281.001
 vertical_up_dist_lb_2_5: - h_var_5 + y_grid_var_2 - y_grid_var_5
   - 282 z2U_2_5 >= -282
 EMIB_bottom_overlap_up_2_5: h_var_5 + y_grid_var_5 - EMIB_y_grid_var_2_5
   - 282 z2U_2_5 >= -281.001
 EMIB_top_overlap_up_2_5: EMIB_h_var_2_5 - y_grid_var_2
   + EMIB_y_grid_var_2_5 - 282 z2U_2_5 >= -281.001
 shared_yi_ub1_2_5: h_var_2 - EMIB_h_var_2_5 + y_grid_var_2
   - EMIB_y_grid_var_2_5 - 282 z1_2_5 >= -282
 shared_yi_ub2_2_5: y_grid_var_2 - EMIB_y_grid_var_2_5 + 282 z1_2_5 <= 282
 shared_yj_ub1_2_5: h_var_5 - EMIB_h_var_2_5 + y_grid_var_5
   - EMIB_y_grid_var_2_5 - 282 z1_2_5 >= -282
 shared_yj_ub2_2_5: y_grid_var_5 - EMIB_y_grid_var_2_5 + 282 z1_2_5 <= 282
 shared_xi_ub1_2_5: w_var_2 - EMIB_w_var_2_5 + x_grid_var_2
   - EMIB_x_grid_var_2_5 - 282 z2_2_5 >= -282
 shared_xi_ub2_2_5: x_grid_var_2 - EMIB_x_grid_var_2_5 + 282 z2_2_5 <= 282
 shared_xj_ub1_2_5: w_var_5 - EMIB_w_var_2_5 + x_grid_var_5
   - EMIB_x_grid_var_2_5 - 282 z2_2_5 >= -282
 shared_xj_ub2_2_5: x_grid_var_5 - EMIB_x_grid_var_2_5 + 282 z2_2_5 <= 282
 non_overlap_any_0_1: p_left_0_1 + p_right_0_1 + p_down_0_1 + p_up_0_1
   >= 1
 non_overlap_left_0_1: w_var_0 + x_grid_var_0 - x_grid_var_1
   + 282 p_left_0_1 <= 282
 non_overlap_left_rev_0_1: - w_var_0 - x_grid_var_0 + x_grid_var_1
   - 282 p_left_0_1 <= 0
 non_overlap_right_0_1: w_var_1 - x_grid_var_0 + x_grid_var_1
   + 282 p_right_0_1 <= 282
 non_overlap_right_rev_0_1: - w_var_1 + x_grid_var_0 - x_grid_var_1
   - 282 p_right_0_1 <= 0
 non_overlap_down_0_1: h_var_0 + y_grid_var_0 - y_grid_var_1
   + 282 p_down_0_1 <= 282
 non_overlap_down_rev_0_1: - h_var_0 - y_grid_var_0 + y_grid_var_1
   - 282 p_down_0_1 <= 0
 non_overlap_up_0_1: h_var_1 - y_grid_var_0 + y_grid_var_1 + 282 p_up_0_1
   <= 282
 non_overlap_up_rev_0_1: - h_var_1 + y_grid_var_0 - y_grid_var_1
   - 282 p_up_0_1 <= 0
 non_overlap_any_0_2: p_left_0_2 + p_right_0_2 + p_down_0_2 + p_up_0_2
   >= 1
 non_overlap_left_0_2: w_var_0 + x_grid_var_0 - x_grid_var_2
   + 282 p_left_0_2 <= 282
 non_overlap_left_rev_0_2: - w_var_0 - x_grid_var_0 + x_grid_var_2
   - 282 p_left_0_2 <= 0
 non_overlap_right_0_2: w_var_2 - x_grid_var_0 + x_grid_var_2
   + 282 p_right_0_2 <= 282
 non_overlap_right_rev_0_2: - w_var_2 + x_grid_var_0 - x_grid_var_2
   - 282 p_right_0_2 <= 0
 non_overlap_down_0_2: h_var_0 + y_grid_var_0 - y_grid_var_2
   + 282 p_down_0_2 <= 282
 non_overlap_down_rev_0_2: - h_var_0 - y_grid_var_0 + y_grid_var_2
   - 282 p_down_0_2 <= 0
 non_overlap_up_0_2: h_var_2 - y_grid_var_0 + y_grid_var_2 + 282 p_up_0_2
   <= 282
 non_overlap_up_rev_0_2: - h_var_2 + y_grid_var_0 - y_grid_var_2
   - 282 p_up_0_2 <= 0
 non_overlap_any_0_3: p_left_0_3 + p_right_0_3 + p_down_0_3 + p_up_0_3
   >= 1
 non_overlap_left_0_3: w_var_0 + x_grid_var_0 - x_grid_var_3
   + 282 p_left_0_3 <= 282
 non_overlap_left_rev_0_3: - w_var_0 - x_grid_var_0 + x_grid_var_3
   - 282 p_left_0_3 <= 0
 non_overlap_right_0_3: w_var_3 - x_grid_var_0 + x_grid_var_3
   + 282 p_right_0_3 <= 282
 non_overlap_right_rev_0_3: - w_var_3 + x_grid_var_0 - x_grid_var_3
   - 282 p_right_0_3 <= 0
 non_overlap_down_0_3: h_var_0 + y_grid_var_0 - y_grid_var_3
   + 282 p_down_0_3 <= 282
 non_overlap_down_rev_0_3: - h_var_0 - y_grid_var_0 + y_grid_var_3
   - 282 p_down_0_3 <= 0
 non_overlap_up_0_3: h_var_3 - y_grid_var_0 + y_grid_var_3 + 282 p_up_0_3
   <= 282
 non_overlap_up_rev_0_3: - h_var_3 + y_grid_var_0 - y_grid_var_3
   - 282 p_up_0_3 <= 0
 non_overlap_any_0_4: p_left_0_4 + p_right_0_4 + p_down_0_4 + p_up_0_4
   >= 1
 non_overlap_left_0_4: w_var_0 + x_grid_var_0 - x_grid_var_4
   + 282 p_left_0_4 <= 282
 non_overlap_left_rev_0_4: - w_var_0 - x_grid_var_0 + x_grid_var_4
   - 282 p_left_0_4 <= 0
 non_overlap_right_0_4: w_var_4 - x_grid_var_0 + x_grid_var_4
   + 282 p_right_0_4 <= 282
 non_overlap_right_rev_0_4: - w_var_4 + x_grid_var_0 - x_grid_var_4
   - 282 p_right_0_4 <= 0
 non_overlap_down_0_4: h_var_0 + y_grid_var_0 - y_grid_var_4
   + 282 p_down_0_4 <= 282
 non_overlap_down_rev_0_4: - h_var_0 - y_grid_var_0 + y_grid_var_4
   - 282 p_down_0_4 <= 0
 non_overlap_up_0_4: h_var_4 - y_grid_var_0 + y_grid_var_4 + 282 p_up_0_4
   <= 282
 non_overlap_up_rev_0_4: - h_var_4 + y_grid_var_0 - y_grid_var_4
   - 282 p_up_0_4 <= 0
 non_overlap_any_0_5: p_left_0_5 + p_right_0_5 + p_down_0_5 + p_up_0_5
   >= 1
 non_overlap_left_0_5: w_var_0 + x_grid_var_0 - x_grid_var_5
   + 282 p_left_0_5 <= 282
 non_overlap_left_rev_0_5: - w_var_0 - x_grid_var_0 + x_grid_var_5
   - 282 p_left_0_5 <= 0
 non_overlap_right_0_5: w_var_5 - x_grid_var_0 + x_grid_var_5
   + 282 p_right_0_5 <= 282
 non_overlap_right_rev_0_5: - w_var_5 + x_grid_var_0 - x_grid_var_5
   - 282 p_right_0_5 <= 0
 non_overlap_down_0_5: h_var_0 + y_grid_var_0 - y_grid_var_5
   + 282 p_down_0_5 <= 282
 non_overlap_down_rev_0_5: - h_var_0 - y_grid_var_0 + y_grid_var_5
   - 282 p_down_0_5 <= 0
 non_overlap_up_0_5: h_var_5 - y_grid_var_0 + y_grid_var_5 + 282 p_up_0_5
   <= 282
 non_overlap_up_rev_0_5: - h_var_5 + y_grid_var_0 - y_grid_var_5
   - 282 p_up_0_5 <= 0
 non_overlap_any_1_2: p_left_1_2 + p_right_1_2 + p_down_1_2 + p_up_1_2
   >= 1
 non_overlap_left_1_2: w_var_1 + x_grid_var_1 - x_grid_var_2
   + 282 p_left_1_2 <= 282
 non_overlap_left_rev_1_2: - w_var_1 - x_grid_var_1 + x_grid_var_2
   - 282 p_left_1_2 <= 0
 non_overlap_right_1_2: w_var_2 - x_grid_var_1 + x_grid_var_2
   + 282 p_right_1_2 <= 282
 non_overlap_right_rev_1_2: - w_var_2 + x_grid_var_1 - x_grid_var_2
   - 282 p_right_1_2 <= 0
 non_overlap_down_1_2: h_var_1 + y_grid_var_1 - y_grid_var_2
   + 282 p_down_1_2 <= 282
 non_overlap_down_rev_1_2: - h_var_1 - y_grid_var_1 + y_grid_var_2
   - 282 p_down_1_2 <= 0
 non_overlap_up_1_2: h_var_2 - y_grid_var_1 + y_grid_var_2 + 282 p_up_1_2
   <= 282
 non_overlap_up_rev_1_2: - h_var_2 + y_grid_var_1 - y_grid_var_2
   - 282 p_up_1_2 <= 0
 non_overlap_any_1_3: p_left_1_3 + p_right_1_3 + p_down_1_3 + p_up_1_3
   >= 1
 non_overlap_left_1_3: w_var_1 + x_grid_var_1 - x_grid_var_3
   + 282 p_left_1_3 <= 282
 non_overlap_left_rev_1_3: - w_var_1 - x_grid_var_1 + x_grid_var_3
   - 282 p_left_1_3 <= 0
 non_overlap_right_1_3: w_var_3 - x_grid_var_1 + x_grid_var_3
   + 282 p_right_1_3 <= 282
 non_overlap_right_rev_1_3: - w_var_3 + x_grid_var_1 - x_grid_var_3
   - 282 p_right_1_3 <= 0
 non_overlap_down_1_3: h_var_1 + y_grid_var_1 - y_grid_var_3
   + 282 p_down_1_3 <= 282
 non_overlap_down_rev_1_3: - h_var_1 - y_grid_var_1 + y_grid_var_3
   - 282 p_down_1_3 <= 0
 non_overlap_up_1_3: h_var_3 - y_grid_var_1 + y_grid_var_3 + 282 p_up_1_3
   <= 282
 non_overlap_up_rev_1_3: - h_var_3 + y_grid_var_1 - y_grid_var_3
   - 282 p_up_1_3 <= 0
 non_overlap_any_1_4: p_left_1_4 + p_right_1_4 + p_down_1_4 + p_up_1_4
   >= 1
 non_overlap_left_1_4: w_var_1 + x_grid_var_1 - x_grid_var_4
   + 282 p_left_1_4 <= 282
 non_overlap_left_rev_1_4: - w_var_1 - x_grid_var_1 + x_grid_var_4
   - 282 p_left_1_4 <= 0
 non_overlap_right_1_4: w_var_4 - x_grid_var_1 + x_grid_var_4
   + 282 p_right_1_4 <= 282
 non_overlap_right_rev_1_4: - w_var_4 + x_grid_var_1 - x_grid_var_4
   - 282 p_right_1_4 <= 0
 non_overlap_down_1_4: h_var_1 + y_grid_var_1 - y_grid_var_4
   + 282 p_down_1_4 <= 282
 non_overlap_down_rev_1_4: - h_var_1 - y_grid_var_1 + y_grid_var_4
   - 282 p_down_1_4 <= 0
 non_overlap_up_1_4: h_var_4 - y_grid_var_1 + y_grid_var_4 + 282 p_up_1_4
   <= 282
 non_overlap_up_rev_1_4: - h_var_4 + y_grid_var_1 - y_grid_var_4
   - 282 p_up_1_4 <= 0
 non_overlap_any_1_5: p_left_1_5 + p_right_1_5 + p_down_1_5 + p_up_1_5
   >= 1
 non_overlap_left_1_5: w_var_1 + x_grid_var_1 - x_grid_var_5
   + 282 p_left_1_5 <= 282
 non_overlap_left_rev_1_5: - w_var_1 - x_grid_var_1 + x_grid_var_5
   - 282 p_left_1_5 <= 0
 non_overlap_right_1_5: w_var_5 - x_grid_var_1 + x_grid_var_5
   + 282 p_right_1_5 <= 282
 non_overlap_right_rev_1_5: - w_var_5 + x_grid_var_1 - x_grid_var_5
   - 282 p_right_1_5 <= 0
 non_overlap_down_1_5: h_var_1 + y_grid_var_1 - y_grid_var_5
   + 282 p_down_1_5 <= 282
 non_overlap_down_rev_1_5: - h_var_1 - y_grid_var_1 + y_grid_var_5
   - 282 p_down_1_5 <= 0
 non_overlap_up_1_5: h_var_5 - y_grid_var_1 + y_grid_var_5 + 282 p_up_1_5
   <= 282
 non_overlap_up_rev_1_5: - h_var_5 + y_grid_var_1 - y_grid_var_5
   - 282 p_up_1_5 <= 0
 non_overlap_any_2_3: p_left_2_3 + p_right_2_3 + p_down_2_3 + p_up_2_3
   >= 1
 non_overlap_left_2_3: w_var_2 + x_grid_var_2 - x_grid_var_3
   + 282 p_left_2_3 <= 282
 non_overlap_left_rev_2_3: - w_var_2 - x_grid_var_2 + x_grid_var_3
   - 282 p_left_2_3 <= 0
 non_overlap_right_2_3: w_var_3 - x_grid_var_2 + x_grid_var_3
   + 282 p_right_2_3 <= 282
 non_overlap_right_rev_2_3: - w_var_3 + x_grid_var_2 - x_grid_var_3
   - 282 p_right_2_3 <= 0
 non_overlap_down_2_3: h_var_2 + y_grid_var_2 - y_grid_var_3
   + 282 p_down_2_3 <= 282
 non_overlap_down_rev_2_3: - h_var_2 - y_grid_var_2 + y_grid_var_3
   - 282 p_down_2_3 <= 0
 non_overlap_up_2_3: h_var_3 - y_grid_var_2 + y_grid_var_3 + 282 p_up_2_3
   <= 282
 non_overlap_up_rev_2_3: - h_var_3 + y_grid_var_2 - y_grid_var_3
   - 282 p_up_2_3 <= 0
 non_overlap_any_2_4: p_left_2_4 + p_right_2_4 + p_down_2_4 + p_up_2_4
   >= 1
 non_overlap_left_2_4: w_var_2 + x_grid_var_2 - x_grid_var_4
   + 282 p_left_2_4 <= 282
 non_overlap_left_rev_2_4: - w_var_2 - x_grid_var_2 + x_grid_var_4
   - 282 p_left_2_4 <= 0
 non_overlap_right_2_4: w_var_4 - x_grid_var_2 + x_grid_var_4
   + 282 p_right_2_4 <= 282
 non_overlap_right_rev_2_4: - w_var_4 + x_grid_var_2 - x_grid_var_4
   - 282 p_right_2_4 <= 0
 non_overlap_down_2_4: h_var_2 + y_grid_var_2 - y_grid_var_4
   + 282 p_down_2_4 <= 282
 non_overlap_down_rev_2_4: - h_var_2 - y_grid_var_2 + y_grid_var_4
   - 282 p_down_2_4 <= 0
 non_overlap_up_2_4: h_var_4 - y_grid_var_2 + y_grid_var_4 + 282 p_up_2_4
   <= 282
 non_overlap_up_rev_2_4: - h_var_4 + y_grid_var_2 - y_grid_var_4
   - 282 p_up_2_4 <= 0
 non_overlap_any_2_5: p_left_2_5 + p_right_2_5 + p_down_2_5 + p_up_2_5
   >= 1
 non_overlap_left_2_5: w_var_2 + x_grid_var_2 - x_grid_var_5
   + 282 p_left_2_5 <= 282
 non_overlap_left_rev_2_5: - w_var_2 - x_grid_var_2 + x_grid_var_5
   - 282 p_left_2_5 <= 0
 non_overlap_right_2_5: w_var_5 - x_grid_var_2 + x_grid_var_5
   + 282 p_right_2_5 <= 282
 non_overlap_right_rev_2_5: - w_var_5 + x_grid_var_2 - x_grid_var_5
   - 282 p_right_2_5 <= 0
 non_overlap_down_2_5: h_var_2 + y_grid_var_2 - y_grid_var_5
   + 282 p_down_2_5 <= 282
 non_overlap_down_rev_2_5: - h_var_2 - y_grid_var_2 + y_grid_var_5
   - 282 p_down_2_5 <= 0
 non_overlap_up_2_5: h_var_5 - y_grid_var_2 + y_grid_var_5 + 282 p_up_2_5
   <= 282
 non_overlap_up_rev_2_5: - h_var_5 + y_grid_var_2 - y_grid_var_5
   - 282 p_up_2_5 <= 0
 non_overlap_any_3_4: p_left_3_4 + p_right_3_4 + p_down_3_4 + p_up_3_4
   >= 1
 non_overlap_left_3_4: w_var_3 + x_grid_var_3 - x_grid_var_4
   + 282 p_left_3_4 <= 282
 non_overlap_left_rev_3_4: - w_var_3 - x_grid_var_3 + x_grid_var_4
   - 282 p_left_3_4 <= 0
 non_overlap_right_3_4: w_var_4 - x_grid_var_3 + x_grid_var_4
   + 282 p_right_3_4 <= 282
 non_overlap_right_rev_3_4: - w_var_4 + x_grid_var_3 - x_grid_var_4
   - 282 p_right_3_4 <= 0
 non_overlap_down_3_4: h_var_3 + y_grid_var_3 - y_grid_var_4
   + 282 p_down_3_4 <= 282
 non_overlap_down_rev_3_4: - h_var_3 - y_grid_var_3 + y_grid_var_4
   - 282 p_down_3_4 <= 0
 non_overlap_up_3_4: h_var_4 - y_grid_var_3 + y_grid_var_4 + 282 p_up_3_4
   <= 282
 non_overlap_up_rev_3_4: - h_var_4 + y_grid_var_3 - y_grid_var_4
   - 282 p_up_3_4 <= 0
 non_overlap_any_3_5: p_left_3_5 + p_right_3_5 + p_down_3_5 + p_up_3_5
   >= 1
 non_overlap_left_3_5: w_var_3 + x_grid_var_3 - x_grid_var_5
   + 282 p_left_3_5 <= 282
 non_overlap_left_rev_3_5: - w_var_3 - x_grid_var_3 + x_grid_var_5
   - 282 p_left_3_5 <= 0
 non_overlap_right_3_5: w_var_5 - x_grid_var_3 + x_grid_var_5
   + 282 p_right_3_5 <= 282
 non_overlap_right_rev_3_5: - w_var_5 + x_grid_var_3 - x_grid_var_5
   - 282 p_right_3_5 <= 0
 non_overlap_down_3_5: h_var_3 + y_grid_var_3 - y_grid_var_5
   + 282 p_down_3_5 <= 282
 non_overlap_down_rev_3_5: - h_var_3 - y_grid_var_3 + y_grid_var_5
   - 282 p_down_3_5 <= 0
 non_overlap_up_3_5: h_var_5 - y_grid_var_3 + y_grid_var_5 + 282 p_up_3_5
   <= 282
 non_overlap_up_rev_3_5: - h_var_5 + y_grid_var_3 - y_grid_var_5
   - 282 p_up_3_5 <= 0
 non_overlap_any_4_5: p_left_4_5 + p_right_4_5 + p_down_4_5 + p_up_4_5
   >= 1
 non_overlap_left_4_5: w_var_4 + x_grid_var_4 - x_grid_var_5
   + 282 p_left_4_5 <= 282
 non_overlap_left_rev_4_5: - w_var_4 - x_grid_var_4 + x_grid_var_5
   - 282 p_left_4_5 <= 0
 non_overlap_right_4_5: w_var_5 - x_grid_var_4 + x_grid_var_5
   + 282 p_right_4_5 <= 282
 non_overlap_right_rev_4_5: - w_var_5 + x_grid_var_4 - x_grid_var_5
   - 282 p_right_4_5 <= 0
 non_overlap_down_4_5: h_var_4 + y_grid_var_4 - y_grid_var_5
   + 282 p_down_4_5 <= 282
 non_overlap_down_rev_4_5: - h_var_4 - y_grid_var_4 + y_grid_var_5
   - 282 p_down_4_5 <= 0
 non_overlap_up_4_5: h_var_5 - y_grid_var_4 + y_grid_var_5 + 282 p_up_4_5
   <= 282
 non_overlap_up_rev_4_5: - h_var_5 + y_grid_var_4 - y_grid_var_5
   - 282 p_up_4_5 <= 0
 bbox_min_x_0: - x_grid_var_0 + bbox_min_x <= 0
 bbox_max_x_0: - w_var_0 - x_grid_var_0 + bbox_max_x >= 0
 bbox_min_y_0: - y_grid_var_0 + bbox_min_y <= 0
 bbox_max_y_0: - h_var_0 - y_grid_var_0 + bbox_max_y >= 0
 bbox_min_x_1: - x_grid_var_1 + bbox_min_x <= 0
 bbox_max_x_1: - w_var_1 - x_grid_var_1 + bbox_max_x >= 0
 bbox_min_y_1: - y_grid_var_1 + bbox_min_y <= 0
 bbox_max_y_1: - h_var_1 - y_grid_var_1 + bbox_max_y >= 0
 bbox_min_x_2: - x_grid_var_2 + bbox_min_x <= 0
 bbox_max_x_2: - w_var_2 - x_grid_var_2 + bbox_max_x >= 0
 bbox_min_y_2: - y_grid_var_2 + bbox_min_y <= 0
 bbox_max_y_2: - h_var_2 - y_grid_var_2 + bbox_max_y >= 0
 bbox_min_x_3: - x_grid_var_3 + bbox_min_x <= 0
 bbox_max_x_3: - w_var_3 - x_grid_var_3 + bbox_max_x >= 0
 bbox_min_y_3: - y_grid_var_3 + bbox_min_y <= 0
 bbox_max_y_3: - h_var_3 - y_grid_var_3 + bbox_max_y >= 0
 bbox_min_x_4: - x_grid_var_4 + bbox_min_x <= 0
 bbox_max_x_4: - w_var_4 - x_grid_var_4 + bbox_max_x >= 0
 bbox_min_y_4: - y_grid_var_4 + bbox_min_y <= 0
 bbox_max_y_4: - h_var_4 - y_grid_var_4 + bbox_max_y >= 0
 bbox_min_x_5: - x_grid_var_5 + bbox_min_x <= 0
 bbox_max_x_5: - w_var_5 - x_grid_var_5 + bbox_max_x >= 0
 bbox_min_y_5: - y_grid_var_5 + bbox_min_y <= 0
 bbox_max_y_5: - h_var_5 - y_grid_var_5 + bbox_max_y >= 0
 bbox_w_def: bbox_min_x - bbox_max_x + bbox_w = 0
 bbox_h_def: bbox_min_y - bbox_max_y + bbox_h = 0
 cx_center_def: cx_center - 0.5 bbox_min_x - 0.5 bbox_max_x = 0
 cy_center_def: cy_center - 0.5 bbox_min_y - 0.5 bbox_max_y = 0
 aspect_ratio_diff_ge_w_minus_h: - bbox_w + bbox_h + aspect_ratio_penalty
   >= 0
 aspect_ratio_diff_ge_h_minus_w: bbox_w - bbox_h + aspect_ratio_penalty
   >= 0
 dx_grid_diff_def_1_2: - cx_grid_var_1 + cx_grid_var_2 + dx_grid_diff_1_2
   = 0
 dx_grid_abs_pair_1_2_abs_ge_orig: dx_grid_abs_pair_1_2 - dx_grid_diff_1_2
   - 282 dx_grid_abs_pair_1_2_is_positive >= -282
 dx_grid_abs_pair_1_2_abs_le_orig: dx_grid_abs_pair_1_2 - dx_grid_diff_1_2
   + 282 dx_grid_abs_pair_1_2_is_positive <= 282
 dx_grid_abs_pair_1_2_abs_ge_neg_orig: dx_grid_abs_pair_1_2
   + dx_grid_diff_1_2 + 282 dx_grid_abs_pair_1_2_is_positive >= 0
 dx_grid_abs_pair_1_2_abs_le_neg_orig: dx_grid_abs_pair_1_2
   + dx_grid_diff_1_2 - 282 dx_grid_abs_pair_1_2_is_positive <= 0
 dx_grid_abs_pair_1_2_force_positive: dx_grid_diff_1_2
   - 282 dx_grid_abs_pair_1_2_is_positive >= -282
 dx_grid_abs_pair_1_2_force_negative: dx_grid_diff_1_2
   - 282 dx_grid_abs_pair_1_2_is_positive <= 0
 dy_grid_diff_def_1_2: - cy_grid_var_1 + cy_grid_var_2 + dy_grid_diff_1_2
   = 0
 dy_grid_abs_pair_1_2_abs_ge_orig: dy_grid_abs_pair_1_2 - dy_grid_diff_1_2
   - 282 dy_grid_abs_pair_1_2_is_positive >= -282
 dy_grid_abs_pair_1_2_abs_le_orig: dy_grid_abs_pair_1_2 - dy_grid_diff_1_2
   + 282 dy_grid_abs_pair_1_2_is_positive <= 282
 dy_grid_abs_pair_1_2_abs_ge_neg_orig: dy_grid_abs_pair_1_2
   + dy_grid_diff_1_2 + 282 dy_grid_abs_pair_1_2_is_positive >= 0
 dy_grid_abs_pair_1_2_abs_le_neg_orig: dy_grid_abs_pair_1_2
   + dy_grid_diff_1_2 - 282 dy_grid_abs_pair_1_2_is_positive <= 0
 dy_grid_abs_pair_1_2_force_positive: dy_grid_diff_1_2
   - 282 dy_grid_abs_pair_1_2_is_positive >= -282
 dy_grid_abs_pair_1_2_force_negative: dy_grid_diff_1_2
   - 282 dy_grid_abs_pair_1_2_is_positive <= 0
 dist_curr_pair_def_1_2: - dx_grid_abs_pair_1_2 - dy_grid_abs_pair_1_2
   + dist_curr_pair_1_2 = 0
 dx_center_diff_def_1: - cx_grid_var_1 + cx_center + dx_center_diff_1 = 0
 dx_center_abs_1_abs_ge_orig: - dx_center_diff_1 + dx_center_abs_1
   - 282 dx_center_abs_1_is_positive >= -282
 dx_center_abs_1_abs_le_orig: - dx_center_diff_1 + dx_center_abs_1
   + 282 dx_center_abs_1_is_positive <= 282
 dx_center_abs_1_abs_ge_neg_orig: dx_center_diff_1 + dx_center_abs_1
   + 282 dx_center_abs_1_is_positive >= 0
 dx_center_abs_1_abs_le_neg_orig: dx_center_diff_1 + dx_center_abs_1
   - 282 dx_center_abs_1_is_positive <= 0
 dx_center_abs_1_force_positive: dx_center_diff_1
   - 282 dx_center_abs_1_is_positive >= -282
 dx_center_abs_1_force_negative: dx_center_diff_1
   - 282 dx_center_abs_1_is_positive <= 0
 dy_center_diff_def_1: - cy_grid_var_1 + cy_center + dy_center_diff_1 = 0
 dy_center_abs_1_abs_ge_orig: - dy_center_diff_1 + dy_center_abs_1
   - 282 dy_center_abs_1_is_positive >= -282
 dy_center_abs_1_abs_le_orig: - dy_center_diff_1 + dy_center_abs_1
   + 282 dy_center_abs_1_is_positive <= 282
 dy_center_abs_1_abs_ge_neg_orig: dy_center_diff_1 + dy_center_abs_1
   + 282 dy_center_abs_1_is_positive >= 0
 dy_center_abs_1_abs_le_neg_orig: dy_center_diff_1 + dy_center_abs_1
   - 282 dy_center_abs_1_is_positive <= 0
 dy_center_abs_1_force_positive: dy_center_diff_1
   - 282 dy_center_abs_1_is_positive >= -282
 dy_center_abs_1_force_negative: dy_center_diff_1
   - 282 dy_center_abs_1_is_positive <= 0
 dist_center_def_1: - dx_center_abs_1 - dy_center_abs_1 + dist_center_1
   = 0
 dx_center_diff_def_2: - cx_grid_var_2 + cx_center + dx_center_diff_2 = 0
 dx_center_abs_2_abs_ge_orig: - dx_center_diff_2 + dx_center_abs_2
   - 282 dx_center_abs_2_is_positive >= -282
 dx_center_abs_2_abs_le_orig: - dx_center_diff_2 + dx_center_abs_2
   + 282 dx_center_abs_2_is_positive <= 282
 dx_center_abs_2_abs_ge_neg_orig: dx_center_diff_2 + dx_center_abs_2
   + 282 dx_center_abs_2_is_positive >= 0
 dx_center_abs_2_abs_le_neg_orig: dx_center_diff_2 + dx_center_abs_2
   - 282 dx_center_abs_2_is_positive <= 0
 dx_center_abs_2_force_positive: dx_center_diff_2
   - 282 dx_center_abs_2_is_positive >= -282
 dx_center_abs_2_force_negative: dx_center_diff_2
   - 282 dx_center_abs_2_is_positive <= 0
 dy_center_diff_def_2: - cy_grid_var_2 + cy_center + dy_center_diff_2 = 0
 dy_center_abs_2_abs_ge_orig: - dy_center_diff_2 + dy_center_abs_2
   - 282 dy_center_abs_2_is_positive >= -282
 dy_center_abs_2_abs_le_orig: - dy_center_diff_2 + dy_center_abs_2
   + 282 dy_center_abs_2_is_positive <= 282
 dy_center_abs_2_abs_ge_neg_orig: dy_center_diff_2 + dy_center_abs_2
   + 282 dy_center_abs_2_is_positive >= 0
 dy_center_abs_2_abs_le_neg_orig: dy_center_diff_2 + dy_center_abs_2
   - 282 dy_center_abs_2_is_positive <= 0
 dy_center_abs_2_force_positive: dy_center_diff_2
   - 282 dy_center_abs_2_is_positive >= -282
 dy_center_abs_2_force_negative: dy_center_diff_2
   - 282 dy_center_abs_2_is_positive <= 0
 dist_center_def_2: - dx_center_abs_2 - dy_center_abs_2 + dist_center_2
   = 0
 power_aware_penalty_def: power_aware_penalty - 87025 dist_curr_pair_1_2
   - 87025 dist_center_1 - 87025 dist_center_2 = 0
 dx_diff_def_0_1: - cx_grid_var_0 + cx_grid_var_1 + dx_diff_0_1 = 0
 dy_diff_def_0_1: - cy_grid_var_0 + cy_grid_var_1 + dy_diff_0_1 = 0
 dx_abs_0_1_abs_ge_orig: dx_abs_0_1 - dx_diff_0_1
   - 282 dx_abs_0_1_is_positive >= -282
 dx_abs_0_1_abs_le_orig: dx_abs_0_1 - dx_diff_0_1
   + 282 dx_abs_0_1_is_positive <= 282
 dx_abs_0_1_abs_ge_neg_orig: dx_abs_0_1 + dx_diff_0_1
   + 282 dx_abs_0_1_is_positive >= 0
 dx_abs_0_1_abs_le_neg_orig: dx_abs_0_1 + dx_diff_0_1
   - 282 dx_abs_0_1_is_positive <= 0
 dx_abs_0_1_force_positive: dx_diff_0_1 - 282 dx_abs_0_1_is_positive
   >= -282
 dx_abs_0_1_force_negative: dx_diff_0_1 - 282 dx_abs_0_1_is_positive <= 0
 dy_abs_0_1_abs_ge_orig: dy_abs_0_1 - dy_diff_0_1
   - 282 dy_abs_0_1_is_positive >= -282
 dy_abs_0_1_abs_le_orig: dy_abs_0_1 - dy_diff_0_1
   + 282 dy_abs_0_1_is_positive <= 282
 dy_abs_0_1_abs_ge_neg_orig: dy_abs_0_1 + dy_diff_0_1
   + 282 dy_abs_0_1_is_positive >= 0
 dy_abs_0_1_abs_le_neg_orig: dy_abs_0_1 + dy_diff_0_1
   - 282 dy_abs_0_1_is_positive <= 0
 dy_abs_0_1_force_positive: dy_diff_0_1 - 282 dy_abs_0_1_is_positive
   >= -282
 dy_abs_0_1_force_negative: dy_diff_0_1 - 282 dy_abs_0_1_is_positive <= 0
 dx_diff_def_0_2: - cx_grid_var_0 + cx_grid_var_2 + dx_diff_0_2 = 0
 dy_diff_def_0_2: - cy_grid_var_0 + cy_grid_var_2 + dy_diff_0_2 = 0
 dx_abs_0_2_abs_ge_orig: dx_abs_0_2 - dx_diff_0_2
   - 282 dx_abs_0_2_is_positive >= -282
 dx_abs_0_2_abs_le_orig: dx_abs_0_2 - dx_diff_0_2
   + 282 dx_abs_0_2_is_positive <= 282
 dx_abs_0_2_abs_ge_neg_orig: dx_abs_0_2 + dx_diff_0_2
   + 282 dx_abs_0_2_is_positive >= 0
 dx_abs_0_2_abs_le_neg_orig: dx_abs_0_2 + dx_diff_0_2
   - 282 dx_abs_0_2_is_positive <= 0
 dx_abs_0_2_force_positive: dx_diff_0_2 - 282 dx_abs_0_2_is_positive
   >= -282
 dx_abs_0_2_force_negative: dx_diff_0_2 - 282 dx_abs_0_2_is_positive <= 0
 dy_abs_0_2_abs_ge_orig: dy_abs_0_2 - dy_diff_0_2
   - 282 dy_abs_0_2_is_positive >= -282
 dy_abs_0_2_abs_le_orig: dy_abs_0_2 - dy_diff_0_2
   + 282 dy_abs_0_2_is_positive <= 282
 dy_abs_0_2_abs_ge_neg_orig: dy_abs_0_2 + dy_diff_0_2
   + 282 dy_abs_0_2_is_positive >= 0
 dy_abs_0_2_abs_le_neg_orig: dy_abs_0_2 + dy_diff_0_2
   - 282 dy_abs_0_2_is_positive <= 0
 dy_abs_0_2_force_positive: dy_diff_0_2 - 282 dy_abs_0_2_is_positive
   >= -282
 dy_abs_0_2_force_negative: dy_diff_0_2 - 282 dy_abs_0_2_is_positive <= 0
 dx_diff_def_1_2: - cx_grid_var_1 + cx_grid_var_2 + dx_diff_1_2 = 0
 dy_diff_def_1_2: - cy_grid_var_1 + cy_grid_var_2 + dy_diff_1_2 = 0
 dx_abs_1_2_abs_ge_orig: dx_abs_1_2 - dx_diff_1_2
   - 282 dx_abs_1_2_is_positive >= -282
 dx_abs_1_2_abs_le_orig: dx_abs_1_2 - dx_diff_1_2
   + 282 dx_abs_1_2_is_positive <= 282
 dx_abs_1_2_abs_ge_neg_orig: dx_abs_1_2 + dx_diff_1_2
   + 282 dx_abs_1_2_is_positive >= 0
 dx_abs_1_2_abs_le_neg_orig: dx_abs_1_2 + dx_diff_1_2
   - 282 dx_abs_1_2_is_positive <= 0
 dx_abs_1_2_force_positive: dx_diff_1_2 - 282 dx_abs_1_2_is_positive
   >= -282
 dx_abs_1_2_force_negative: dx_diff_1_2 - 282 dx_abs_1_2_is_positive <= 0
 dy_abs_1_2_abs_ge_orig: dy_abs_1_2 - dy_diff_1_2
   - 282 dy_abs_1_2_is_positive >= -282
 dy_abs_1_2_abs_le_orig: dy_abs_1_2 - dy_diff_1_2
   + 282 dy_abs_1_2_is_positive <= 282
 dy_abs_1_2_abs_ge_neg_orig: dy_abs_1_2 + dy_diff_1_2
   + 282 dy_abs_1_2_is_positive >= 0
 dy_abs_1_2_abs_le_neg_orig: dy_abs_1_2 + dy_diff_1_2
   - 282 dy_abs_1_2_is_positive <= 0
 dy_abs_1_2_force_positive: dy_diff_1_2 - 282 dy_abs_1_2_is_positive
   >= -282
 dy_abs_1_2_force_negative: dy_diff_1_2 - 282 dy_abs_1_2_is_positive <= 0
 dx_diff_def_i_0_3: EMIB_cx_grid_var_0_3 - cx_grid_var_0 + dx_diff_i_0_3
   = 0
 dx_diff_def_j_0_3: EMIB_cx_grid_var_0_3 - cx_grid_var_3 + dx_diff_j_0_3
   = 0
 dy_diff_def_i_0_3: EMIB_cy_grid_var_0_3 - cy_grid_var_0 + dy_diff_i_0_3
   = 0
 dy_diff_def_j_0_3: EMIB_cy_grid_var_0_3 - cy_grid_var_3 + dy_diff_j_0_3
   = 0
 dx_abs_i_0_3_abs_ge_orig: dx_abs_i_0_3 - dx_diff_i_0_3
   - 282 dx_abs_i_0_3_is_positive >= -282
 dx_abs_i_0_3_abs_le_orig: dx_abs_i_0_3 - dx_diff_i_0_3
   + 282 dx_abs_i_0_3_is_positive <= 282
 dx_abs_i_0_3_abs_ge_neg_orig: dx_abs_i_0_3 + dx_diff_i_0_3
   + 282 dx_abs_i_0_3_is_positive >= 0
 dx_abs_i_0_3_abs_le_neg_orig: dx_abs_i_0_3 + dx_diff_i_0_3
   - 282 dx_abs_i_0_3_is_positive <= 0
 dx_abs_i_0_3_force_positive: dx_diff_i_0_3 - 282 dx_abs_i_0_3_is_positive
   >= -282
 dx_abs_i_0_3_force_negative: dx_diff_i_0_3 - 282 dx_abs_i_0_3_is_positive
   <= 0
 dy_abs_i_0_3_abs_ge_orig: dy_abs_i_0_3 - dy_diff_i_0_3
   - 282 dy_abs_i_0_3_is_positive >= -282
 dy_abs_i_0_3_abs_le_orig: dy_abs_i_0_3 - dy_diff_i_0_3
   + 282 dy_abs_i_0_3_is_positive <= 282
 dy_abs_i_0_3_abs_ge_neg_orig: dy_abs_i_0_3 + dy_diff_i_0_3
   + 282 dy_abs_i_0_3_is_positive >= 0
 dy_abs_i_0_3_abs_le_neg_orig: dy_abs_i_0_3 + dy_diff_i_0_3
   - 282 dy_abs_i_0_3_is_positive <= 0
 dy_abs_i_0_3_force_positive: dy_diff_i_0_3 - 282 dy_abs_i_0_3_is_positive
   >= -282
 dy_abs_i_0_3_force_negative: dy_diff_i_0_3 - 282 dy_abs_i_0_3_is_positive
   <= 0
 dx_abs_j_0_3_abs_ge_orig: dx_abs_j_0_3 - dx_diff_j_0_3
   - 282 dx_abs_j_0_3_is_positive >= -282
 dx_abs_j_0_3_abs_le_orig: dx_abs_j_0_3 - dx_diff_j_0_3
   + 282 dx_abs_j_0_3_is_positive <= 282
 dx_abs_j_0_3_abs_ge_neg_orig: dx_abs_j_0_3 + dx_diff_j_0_3
   + 282 dx_abs_j_0_3_is_positive >= 0
 dx_abs_j_0_3_abs_le_neg_orig: dx_abs_j_0_3 + dx_diff_j_0_3
   - 282 dx_abs_j_0_3_is_positive <= 0
 dx_abs_j_0_3_force_positive: dx_diff_j_0_3 - 282 dx_abs_j_0_3_is_positive
   >= -282
 dx_abs_j_0_3_force_negative: dx_diff_j_0_3 - 282 dx_abs_j_0_3_is_positive
   <= 0
 dy_abs_j_0_3_abs_ge_orig: dy_abs_j_0_3 - dy_diff_j_0_3
   - 282 dy_abs_j_0_3_is_positive >= -282
 dy_abs_j_0_3_abs_le_orig: dy_abs_j_0_3 - dy_diff_j_0_3
   + 282 dy_abs_j_0_3_is_positive <= 282
 dy_abs_j_0_3_abs_ge_neg_orig: dy_abs_j_0_3 + dy_diff_j_0_3
   + 282 dy_abs_j_0_3_is_positive >= 0
 dy_abs_j_0_3_abs_le_neg_orig: dy_abs_j_0_3 + dy_diff_j_0_3
   - 282 dy_abs_j_0_3_is_positive <= 0
 dy_abs_j_0_3_force_positive: dy_diff_j_0_3 - 282 dy_abs_j_0_3_is_positive
   >= -282
 dy_abs_j_0_3_force_negative: dy_diff_j_0_3 - 282 dy_abs_j_0_3_is_positive
   <= 0
 dx_diff_def_i_1_4: EMIB_cx_grid_var_1_4 - cx_grid_var_1 + dx_diff_i_1_4
   = 0
 dx_diff_def_j_1_4: EMIB_cx_grid_var_1_4 - cx_grid_var_4 + dx_diff_j_1_4
   = 0
 dy_diff_def_i_1_4: EMIB_cy_grid_var_1_4 - cy_grid_var_1 + dy_diff_i_1_4
   = 0
 dy_diff_def_j_1_4: EMIB_cy_grid_var_1_4 - cy_grid_var_4 + dy_diff_j_1_4
   = 0
 dx_abs_i_1_4_abs_ge_orig: dx_abs_i_1_4 - dx_diff_i_1_4
   - 282 dx_abs_i_1_4_is_positive >= -282
 dx_abs_i_1_4_abs_le_orig: dx_abs_i_1_4 - dx_diff_i_1_4
   + 282 dx_abs_i_1_4_is_positive <= 282
 dx_abs_i_1_4_abs_ge_neg_orig: dx_abs_i_1_4 + dx_diff_i_1_4
   + 282 dx_abs_i_1_4_is_positive >= 0
 dx_abs_i_1_4_abs_le_neg_orig: dx_abs_i_1_4 + dx_diff_i_1_4
   - 282 dx_abs_i_1_4_is_positive <= 0
 dx_abs_i_1_4_force_positive: dx_diff_i_1_4 - 282 dx_abs_i_1_4_is_positive
   >= -282
 dx_abs_i_1_4_force_negative: dx_diff_i_1_4 - 282 dx_abs_i_1_4_is_positive
   <= 0
 dy_abs_i_1_4_abs_ge_orig: dy_abs_i_1_4 - dy_diff_i_1_4
   - 282 dy_abs_i_1_4_is_positive >= -282
 dy_abs_i_1_4_abs_le_orig: dy_abs_i_1_4 - dy_diff_i_1_4
   + 282 dy_abs_i_1_4_is_positive <= 282
 dy_abs_i_1_4_abs_ge_neg_orig: dy_abs_i_1_4 + dy_diff_i_1_4
   + 282 dy_abs_i_1_4_is_positive >= 0
 dy_abs_i_1_4_abs_le_neg_orig: dy_abs_i_1_4 + dy_diff_i_1_4
   - 282 dy_abs_i_1_4_is_positive <= 0
 dy_abs_i_1_4_force_positive: dy_diff_i_1_4 - 282 dy_abs_i_1_4_is_positive
   >= -282
 dy_abs_i_1_4_force_negative: dy_diff_i_1_4 - 282 dy_abs_i_1_4_is_positive
   <= 0
 dx_abs_j_1_4_abs_ge_orig: dx_abs_j_1_4 - dx_diff_j_1_4
   - 282 dx_abs_j_1_4_is_positive >= -282
 dx_abs_j_1_4_abs_le_orig: dx_abs_j_1_4 - dx_diff_j_1_4
   + 282 dx_abs_j_1_4_is_positive <= 282
 dx_abs_j_1_4_abs_ge_neg_orig: dx_abs_j_1_4 + dx_diff_j_1_4
   + 282 dx_abs_j_1_4_is_positive >= 0
 dx_abs_j_1_4_abs_le_neg_orig: dx_abs_j_1_4 + dx_diff_j_1_4
   - 282 dx_abs_j_1_4_is_positive <= 0
 dx_abs_j_1_4_force_positive: dx_diff_j_1_4 - 282 dx_abs_j_1_4_is_positive
   >= -282
 dx_abs_j_1_4_force_negative: dx_diff_j_1_4 - 282 dx_abs_j_1_4_is_positive
   <= 0
 dy_abs_j_1_4_abs_ge_orig: dy_abs_j_1_4 - dy_diff_j_1_4
   - 282 dy_abs_j_1_4_is_positive >= -282
 dy_abs_j_1_4_abs_le_orig: dy_abs_j_1_4 - dy_diff_j_1_4
   + 282 dy_abs_j_1_4_is_positive <= 282
 dy_abs_j_1_4_abs_ge_neg_orig: dy_abs_j_1_4 + dy_diff_j_1_4
   + 282 dy_abs_j_1_4_is_positive >= 0
 dy_abs_j_1_4_abs_le_neg_orig: dy_abs_j_1_4 + dy_diff_j_1_4
   - 282 dy_abs_j_1_4_is_positive <= 0
 dy_abs_j_1_4_force_positive: dy_diff_j_1_4 - 282 dy_abs_j_1_4_is_positive
   >= -282
 dy_abs_j_1_4_force_negative: dy_diff_j_1_4 - 282 dy_abs_j_1_4_is_positive
   <= 0
 dx_diff_def_i_2_5: EMIB_cx_grid_var_2_5 - cx_grid_var_2 + dx_diff_i_2_5
   = 0
 dx_diff_def_j_2_5: EMIB_cx_grid_var_2_5 - cx_grid_var_5 + dx_diff_j_2_5
   = 0
 dy_diff_def_i_2_5: EMIB_cy_grid_var_2_5 - cy_grid_var_2 + dy_diff_i_2_5
   = 0
 dy_diff_def_j_2_5: EMIB_cy_grid_var_2_5 - cy_grid_var_5 + dy_diff_j_2_5
   = 0
 dx_abs_i_2_5_abs_ge_orig: dx_abs_i_2_5 - dx_diff_i_2_5
   - 282 dx_abs_i_2_5_is_positive >= -282
 dx_abs_i_2_5_abs_le_orig: dx_abs_i_2_5 - dx_diff_i_2_5
   + 282 dx_abs_i_2_5_is_positive <= 282
 dx_abs_i_2_5_abs_ge_neg_orig: dx_abs_i_2_5 + dx_diff_i_2_5
   + 282 dx_abs_i_2_5_is_positive >= 0
 dx_abs_i_2_5_abs_le_neg_orig: dx_abs_i_2_5 + dx_diff_i_2_5
   - 282 dx_abs_i_2_5_is_positive <= 0
 dx_abs_i_2_5_force_positive: dx_diff_i_2_5 - 282 dx_abs_i_2_5_is_positive
   >= -282
 dx_abs_i_2_5_force_negative: dx_diff_i_2_5 - 282 dx_abs_i_2_5_is_positive
   <= 0
 dy_abs_i_2_5_abs_ge_orig: dy_abs_i_2_5 - dy_diff_i_2_5
   - 282 dy_abs_i_2_5_is_positive >= -282
 dy_abs_i_2_5_abs_le_orig: dy_abs_i_2_5 - dy_diff_i_2_5
   + 282 dy_abs_i_2_5_is_positive <= 282
 dy_abs_i_2_5_abs_ge_neg_orig: dy_abs_i_2_5 + dy_diff_i_2_5
   + 282 dy_abs_i_2_5_is_positive >= 0
 dy_abs_i_2_5_abs_le_neg_orig: dy_abs_i_2_5 + dy_diff_i_2_5
   - 282 dy_abs_i_2_5_is_positive <= 0
 dy_abs_i_2_5_force_positive: dy_diff_i_2_5 - 282 dy_abs_i_2_5_is_positive
   >= -282
 dy_abs_i_2_5_force_negative: dy_diff_i_2_5 - 282 dy_abs_i_2_5_is_positive
   <= 0
 dx_abs_j_2_5_abs_ge_orig: dx_abs_j_2_5 - dx_diff_j_2_5
   - 282 dx_abs_j_2_5_is_positive >= -282
 dx_abs_j_2_5_abs_le_orig: dx_abs_j_2_5 - dx_diff_j_2_5
   + 282 dx_abs_j_2_5_is_positive <= 282
 dx_abs_j_2_5_abs_ge_neg_orig: dx_abs_j_2_5 + dx_diff_j_2_5
   + 282 dx_abs_j_2_5_is_positive >= 0
 dx_abs_j_2_5_abs_le_neg_orig: dx_abs_j_2_5 + dx_diff_j_2_5
   - 282 dx_abs_j_2_5_is_positive <= 0
 dx_abs_j_2_5_force_positive: dx_diff_j_2_5 - 282 dx_abs_j_2_5_is_positive
   >= -282
 dx_abs_j_2_5_force_negative: dx_diff_j_2_5 - 282 dx_abs_j_2_5_is_positive
   <= 0
 dy_abs_j_2_5_abs_ge_orig: dy_abs_j_2_5 - dy_diff_j_2_5
   - 282 dy_abs_j_2_5_is_positive >= -282
 dy_abs_j_2_5_abs_le_orig: dy_abs_j_2_5 - dy_diff_j_2_5
   + 282 dy_abs_j_2_5_is_positive <= 282
 dy_abs_j_2_5_abs_ge_neg_orig: dy_abs_j_2_5 + dy_diff_j_2_5
   + 282 dy_abs_j_2_5_is_positive >= 0
 dy_abs_j_2_5_abs_le_neg_orig: dy_abs_j_2_5 + dy_diff_j_2_5
   - 282 dy_abs_j_2_5_is_positive <= 0
 dy_abs_j_2_5_force_positive: dy_diff_j_2_5 - 282 dy_abs_j_2_5_is_positive
   >= -282
 dy_abs_j_2_5_force_negative: dy_diff_j_2_5 - 282 dy_abs_j_2_5_is_positive
   <= 0
 wirelength_def: wirelength - 128 dx_abs_0_1 - 128 dy_abs_0_1
   - 128 dx_abs_0_2 - 128 dy_abs_0_2 - 128 dx_abs_1_2 - 128 dy_abs_1_2
   - 1024 dx_abs_i_0_3 - 1024 dy_abs_i_0_3 - 1024 dx_abs_j_0_3
   - 1024 dy_abs_j_0_3 - 1024 dx_abs_i_1_4 - 1024 dy_abs_i_1_4
   - 1024 dx_abs_j_1_4 - 1024 dy_abs_j_1_4 - 1024 dx_abs_i_2_5
   - 1024 dy_abs_i_2_5 - 1024 dx_abs_j_2_5 - 1024 dy_abs_j_2_5 = 0
 t_ge_scaled_mean: - 0.8 bbox_w - 0.8 bbox_h + bbox_area_proxy_t >= 0
Bounds
 w_var_0 = 12
 h_var_0 = 12
 w_var_1 = 18.2
 h_var_1 = 18.2
 w_var_2 = 18.2
 h_var_2 = 18.2
 7.75 <= w_var_3 <= 11.87
 7.75 <= h_var_3 <= 11.87
 7.75 <= w_var_4 <= 11.87
 7.75 <= h_var_4 <= 11.87
 7.75 <= w_var_5 <= 11.87
 7.75 <= h_var_5 <= 11.87
 2 <= EMIB_w_var_0_3 <= 3.4133
 2 <= EMIB_h_var_0_3 <= 3.4133
 2 <= EMIB_w_var_1_4 <= 3.4133
 2 <= EMIB_h_var_1_4 <= 3.4133
 2 <= EMIB_w_var_2_5 <= 3.4133
 2 <= EMIB_h_var_2_5 <= 3.4133
 x_grid_var_0 <= 141
 y_grid_var_0 <= 141
 x_grid_var_1 <= 141
 y_grid_var_1 <= 141
 x_grid_var_2 <= 141
 y_grid_var_2 <= 141
 x_grid_var_3 <= 141
 y_grid_var_3 <= 141
 x_grid_var_4 <= 141
 y_grid_var_4 <= 141
 x_grid_var_5 <= 141
 y_grid_var_5 <= 141
 EMIB_x_grid_var_0_3 <= 141
 EMIB_y_grid_var_0_3 <= 141
 EMIB_x_grid_var_1_4 <= 141
 EMIB_y_grid_var_1_4 <= 141
 EMIB_x_grid_var_2_5 <= 141
 EMIB_y_grid_var_2_5 <= 141
 EMIB_cx_grid_var_0_3 <= 282
 EMIB_cy_grid_var_0_3 <= 282
 EMIB_cx_grid_var_1_4 <= 282
 EMIB_cy_grid_var_1_4 <= 282
 EMIB_cx_grid_var_2_5 <= 282
 EMIB_cy_grid_var_2_5 <= 282
 cx_grid_var_0 <= 282
 cy_grid_var_0 <= 282
 cx_grid_var_1 <= 282
 cy_grid_var_1 <= 282
 cx_grid_var_2 <= 282
 cy_grid_var_2 <= 282
 cx_grid_var_3 <= 282
 cy_grid_var_3 <= 282
 cx_grid_var_4 <= 282
 cy_grid_var_4 <= 282
 cx_grid_var_5 <= 282
 cy_grid_var_5 <= 282
 cx_center <= 141
 cy_center <= 141
 bbox_min_x <= 141
 bbox_max_x <= 141
 bbox_min_y <= 141
 bbox_max_y <= 141
 bbox_w <= 141
 bbox_h <= 141
 aspect_ratio_penalty <= 141
 dx_grid_abs_pair_1_2 <= 141
 dy_grid_abs_pair_1_2 <= 141
 -141 <= dx_grid_diff_1_2 <= 141
 -141 <= dy_grid_diff_1_2 <= 141
 dist_curr_pair_1_2 <= 282
 -141 <= dx_center_diff_1 <= 141
 dx_center_abs_1 <= 141
 -141 <= dy_center_diff_1 <= 141
 dy_center_abs_1 <= 141
 dist_center_1 <= 282
 -141 <= dx_center_diff_2 <= 141
 dx_center_abs_2 <= 141
 -141 <= dy_center_diff_2 <= 141
 dy_center_abs_2 <= 141
 dist_center_2 <= 282
 wirelength <= 6.930432e+06
 -141 <= dx_diff_0_1 <= 141
 -141 <= dy_diff_0_1 <= 141
 -141 <= dx_diff_0_2 <= 141
 -141 <= dy_diff_0_2 <= 141
 -141 <= dx_diff_1_2 <= 141
 -141 <= dy_diff_1_2 <= 141
 -141 <= dx_diff_i_0_3 <= 141
 -141 <= dy_diff_i_0_3 <= 141
 -141 <= dx_diff_j_0_3 <= 141
 -141 <= dy_diff_j_0_3 <= 141
 -141 <= dx_diff_i_1_4 <= 141
 -141 <= dy_diff_i_1_4 <= 141
 -141 <= dx_diff_j_1_4 <= 141
 -141 <= dy_diff_j_1_4 <= 141
 -141 <= dx_diff_i_2_5 <= 141
 -141 <= dy_diff_i_2_5 <= 141
 -141 <= dx_diff_j_2_5 <= 141
 -141 <= dy_diff_j_2_5 <= 141
 bbox_area_proxy_t <= 282
Binaries
 r_0 r_1 r_2 r_3 r_4 r_5 r_EMIB_0_3 r_EMIB_1_4 r_EMIB_2_5 z1_0_3 z2_0_3
 z1L_0_3 z1R_0_3 z2D_0_3 z2U_0_3 z1_1_4 z2_1_4 z1L_1_4 z1R_1_4 z2D_1_4
 z2U_1_4 z1_2_5 z2_2_5 z1L_2_5 z1R_2_5 z2D_2_5 z2U_2_5 p_left_0_1
 p_right_0_1 p_down_0_1 p_up_0_1 p_left_0_2 p_right_0_2 p_down_0_2 p_up_0_2
 p_left_0_3 p_right_0_3 p_down_0_3 p_up_0_3 p_left_0_4 p_right_0_4
 p_down_0_4 p_up_0_4 p_left_0_5 p_right_0_5 p_down_0_5 p_up_0_5 p_left_1_2
 p_right_1_2 p_down_1_2 p_up_1_2 p_left_1_3 p_right_1_3 p_down_1_3 p_up_1_3
 p_left_1_4 p_right_1_4 p_down_1_4 p_up_1_4 p_left_1_5 p_right_1_5
 p_down_1_5 p_up_1_5 p_left_2_3 p_right_2_3 p_down_2_3 p_up_2_3 p_left_2_4
 p_right_2_4 p_down_2_4 p_up_2_4 p_left_2_5 p_right_2_5 p_down_2_5 p_up_2_5
 p_left_3_4 p_right_3_4 p_down_3_4 p_up_3_4 p_left_3_5 p_right_3_5
 p_down_3_5 p_up_3_5 p_left_4_5 p_right_4_5 p_down_4_5 p_up_4_5
 dx_grid_abs_pair_1_2_is_positive dy_grid_abs_pair_1_2_is_positive
 dx_center_abs_1_is_positive dy_center_abs_1_is_positive
 dx_center_abs_2_is_positive dy_center_abs_2_is_positive
 dx_abs_0_1_is_positive dy_abs_0_1_is_positive dx_abs_0_2_is_positive
 dy_abs_0_2_is_positive dx_abs_1_2_is_positive dy_abs_1_2_is_positive
 dx_abs_i_0_3_is_positive dy_abs_i_0_3_is_positive dx_abs_j_0_3_is_positive
 dy_abs_j_0_3_is_positive dx_abs_i_1_4_is_positive dy_abs_i_1_4_is_positive
 dx_abs_j_1_4_is_positive dy_abs_j_1_4_is_positive dx_abs_i_2_5_is_positive
 dy_abs_i_2_5_is_positive dx_abs_j_2_5_is_positive dy_abs_j_2_5_is_positive
End

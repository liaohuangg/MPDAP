\ Model ChipletPlacementGrid
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0x6b69e523ed0defa7
Minimize
  0 r_4 + 0 r_5 + 0 r_6 + 0 r_7 + 0.0333333333333333 aspect_ratio_penalty
   - 4.70481e-07 power_aware_penalty + 7.95209e-05 wirelength
   + 0.1221441268875107 bbox_area_proxy_t
Subject To
 width_rotation_0: - 0.75 r_0 + w_var_0 = 8.25
 height_rotation_0: 0.75 r_0 + h_var_0 = 9
 x_grid_var_ub_0: w_var_0 + x_grid_var_0 <= 105
 y_grid_var_ub_0: h_var_0 + y_grid_var_0 <= 105
 width_rotation_1: - 0.75 r_1 + w_var_1 = 8.25
 height_rotation_1: 0.75 r_1 + h_var_1 = 9
 x_grid_var_ub_1: w_var_1 + x_grid_var_1 <= 105
 y_grid_var_ub_1: h_var_1 + y_grid_var_1 <= 105
 width_rotation_2: - 0.75 r_2 + w_var_2 = 8.25
 height_rotation_2: 0.75 r_2 + h_var_2 = 9
 x_grid_var_ub_2: w_var_2 + x_grid_var_2 <= 105
 y_grid_var_ub_2: h_var_2 + y_grid_var_2 <= 105
 width_rotation_3: - 0.75 r_3 + w_var_3 = 8.25
 height_rotation_3: 0.75 r_3 + h_var_3 = 9
 x_grid_var_ub_3: w_var_3 + x_grid_var_3 <= 105
 y_grid_var_ub_3: h_var_3 + y_grid_var_3 <= 105
 width_rotation_4: w_var_4 = 8.75
 height_rotation_4: h_var_4 = 8.75
 x_grid_var_ub_4: w_var_4 + x_grid_var_4 <= 105
 y_grid_var_ub_4: h_var_4 + y_grid_var_4 <= 105
 width_rotation_5: w_var_5 = 8.75
 height_rotation_5: h_var_5 = 8.75
 x_grid_var_ub_5: w_var_5 + x_grid_var_5 <= 105
 y_grid_var_ub_5: h_var_5 + y_grid_var_5 <= 105
 width_rotation_6: w_var_6 = 8.75
 height_rotation_6: h_var_6 = 8.75
 x_grid_var_ub_6: w_var_6 + x_grid_var_6 <= 105
 y_grid_var_ub_6: h_var_6 + y_grid_var_6 <= 105
 width_rotation_7: w_var_7 = 8.75
 height_rotation_7: h_var_7 = 8.75
 x_grid_var_ub_7: w_var_7 + x_grid_var_7 <= 105
 y_grid_var_ub_7: h_var_7 + y_grid_var_7 <= 105
 EMIB_width_rotation_0_1: 1.1467 r_EMIB_0_1 + EMIB_w_var_0_1 = 2
 EMIB_height_rotation_0_1: - 1.1467 r_EMIB_0_1 + EMIB_h_var_0_1 = 0.8533
 EMIB_x_grid_var_ub_0_1: EMIB_w_var_0_1 + EMIB_x_grid_var_0_1 <= 105
 EMIB_y_grid_var_ub_0_1: EMIB_h_var_0_1 + EMIB_y_grid_var_0_1 <= 105
 EMIB_width_rotation_0_3: 1.1467 r_EMIB_0_3 + EMIB_w_var_0_3 = 2
 EMIB_height_rotation_0_3: - 1.1467 r_EMIB_0_3 + EMIB_h_var_0_3 = 0.8533
 EMIB_x_grid_var_ub_0_3: EMIB_w_var_0_3 + EMIB_x_grid_var_0_3 <= 105
 EMIB_y_grid_var_ub_0_3: EMIB_h_var_0_3 + EMIB_y_grid_var_0_3 <= 105
 EMIB_width_rotation_0_4: - 1.4133 r_EMIB_0_4 + EMIB_w_var_0_4 = 2
 EMIB_height_rotation_0_4: 1.4133 r_EMIB_0_4 + EMIB_h_var_0_4 = 3.4133
 EMIB_x_grid_var_ub_0_4: EMIB_w_var_0_4 + EMIB_x_grid_var_0_4 <= 105
 EMIB_y_grid_var_ub_0_4: EMIB_h_var_0_4 + EMIB_y_grid_var_0_4 <= 105
 EMIB_width_rotation_1_2: 1.1467 r_EMIB_1_2 + EMIB_w_var_1_2 = 2
 EMIB_height_rotation_1_2: - 1.1467 r_EMIB_1_2 + EMIB_h_var_1_2 = 0.8533
 EMIB_x_grid_var_ub_1_2: EMIB_w_var_1_2 + EMIB_x_grid_var_1_2 <= 105
 EMIB_y_grid_var_ub_1_2: EMIB_h_var_1_2 + EMIB_y_grid_var_1_2 <= 105
 EMIB_width_rotation_1_5: - 1.4133 r_EMIB_1_5 + EMIB_w_var_1_5 = 2
 EMIB_height_rotation_1_5: 1.4133 r_EMIB_1_5 + EMIB_h_var_1_5 = 3.4133
 EMIB_x_grid_var_ub_1_5: EMIB_w_var_1_5 + EMIB_x_grid_var_1_5 <= 105
 EMIB_y_grid_var_ub_1_5: EMIB_h_var_1_5 + EMIB_y_grid_var_1_5 <= 105
 EMIB_width_rotation_2_3: 1.1467 r_EMIB_2_3 + EMIB_w_var_2_3 = 2
 EMIB_height_rotation_2_3: - 1.1467 r_EMIB_2_3 + EMIB_h_var_2_3 = 0.8533
 EMIB_x_grid_var_ub_2_3: EMIB_w_var_2_3 + EMIB_x_grid_var_2_3 <= 105
 EMIB_y_grid_var_ub_2_3: EMIB_h_var_2_3 + EMIB_y_grid_var_2_3 <= 105
 EMIB_width_rotation_2_6: - 1.4133 r_EMIB_2_6 + EMIB_w_var_2_6 = 2
 EMIB_height_rotation_2_6: 1.4133 r_EMIB_2_6 + EMIB_h_var_2_6 = 3.4133
 EMIB_x_grid_var_ub_2_6: EMIB_w_var_2_6 + EMIB_x_grid_var_2_6 <= 105
 EMIB_y_grid_var_ub_2_6: EMIB_h_var_2_6 + EMIB_y_grid_var_2_6 <= 105
 EMIB_width_rotation_3_7: - 1.4133 r_EMIB_3_7 + EMIB_w_var_3_7 = 2
 EMIB_height_rotation_3_7: 1.4133 r_EMIB_3_7 + EMIB_h_var_3_7 = 3.4133
 EMIB_x_grid_var_ub_3_7: EMIB_w_var_3_7 + EMIB_x_grid_var_3_7 <= 105
 EMIB_y_grid_var_ub_3_7: EMIB_h_var_3_7 + EMIB_y_grid_var_3_7 <= 105
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
 cx_def_6: - 0.5 w_var_6 - x_grid_var_6 + cx_grid_var_6 = 0
 cy_def_6: - 0.5 h_var_6 - y_grid_var_6 + cy_grid_var_6 = 0
 cx_def_7: - 0.5 w_var_7 - x_grid_var_7 + cx_grid_var_7 = 0
 cy_def_7: - 0.5 h_var_7 - y_grid_var_7 + cy_grid_var_7 = 0
 EMIB_cx_def_0_1: - 0.5 EMIB_w_var_0_1 - EMIB_x_grid_var_0_1
   + EMIB_cx_grid_var_0_1 = 0
 EMIB_cy_def_0_1: - 0.5 EMIB_h_var_0_1 - EMIB_y_grid_var_0_1
   + EMIB_cy_grid_var_0_1 = 0
 EMIB_cx_def_0_3: - 0.5 EMIB_w_var_0_3 - EMIB_x_grid_var_0_3
   + EMIB_cx_grid_var_0_3 = 0
 EMIB_cy_def_0_3: - 0.5 EMIB_h_var_0_3 - EMIB_y_grid_var_0_3
   + EMIB_cy_grid_var_0_3 = 0
 EMIB_cx_def_0_4: - 0.5 EMIB_w_var_0_4 - EMIB_x_grid_var_0_4
   + EMIB_cx_grid_var_0_4 = 0
 EMIB_cy_def_0_4: - 0.5 EMIB_h_var_0_4 - EMIB_y_grid_var_0_4
   + EMIB_cy_grid_var_0_4 = 0
 EMIB_cx_def_1_2: - 0.5 EMIB_w_var_1_2 - EMIB_x_grid_var_1_2
   + EMIB_cx_grid_var_1_2 = 0
 EMIB_cy_def_1_2: - 0.5 EMIB_h_var_1_2 - EMIB_y_grid_var_1_2
   + EMIB_cy_grid_var_1_2 = 0
 EMIB_cx_def_1_5: - 0.5 EMIB_w_var_1_5 - EMIB_x_grid_var_1_5
   + EMIB_cx_grid_var_1_5 = 0
 EMIB_cy_def_1_5: - 0.5 EMIB_h_var_1_5 - EMIB_y_grid_var_1_5
   + EMIB_cy_grid_var_1_5 = 0
 EMIB_cx_def_2_3: - 0.5 EMIB_w_var_2_3 - EMIB_x_grid_var_2_3
   + EMIB_cx_grid_var_2_3 = 0
 EMIB_cy_def_2_3: - 0.5 EMIB_h_var_2_3 - EMIB_y_grid_var_2_3
   + EMIB_cy_grid_var_2_3 = 0
 EMIB_cx_def_2_6: - 0.5 EMIB_w_var_2_6 - EMIB_x_grid_var_2_6
   + EMIB_cx_grid_var_2_6 = 0
 EMIB_cy_def_2_6: - 0.5 EMIB_h_var_2_6 - EMIB_y_grid_var_2_6
   + EMIB_cy_grid_var_2_6 = 0
 EMIB_cx_def_3_7: - 0.5 EMIB_w_var_3_7 - EMIB_x_grid_var_3_7
   + EMIB_cx_grid_var_3_7 = 0
 EMIB_cy_def_3_7: - 0.5 EMIB_h_var_3_7 - EMIB_y_grid_var_3_7
   + EMIB_cy_grid_var_3_7 = 0
 must_adjacent_sb_0_1: z1_0_1 + z2_0_1 = 1
 horizontal_direction_sb_0_1: - z1_0_1 + z1L_0_1 + z1R_0_1 = 0
 vertical_direction_sb_0_1: - z2_0_1 + z2D_0_1 + z2U_0_1 = 0
 EMIB_rotate_eq_z2_0_1: r_EMIB_0_1 - z2_0_1 = 0
 horizontal_left_dist_lb_0_1: - w_var_0 - x_grid_var_0 + x_grid_var_1
   - 210 z1L_0_1 >= -210
 EMIB_left_overlap_0_1: w_var_0 + x_grid_var_0 - EMIB_x_grid_var_0_1
   - 210 z1L_0_1 >= -209.001
 EMIB_right_overlap_0_1: EMIB_w_var_0_1 - x_grid_var_1
   + EMIB_x_grid_var_0_1 - 210 z1L_0_1 >= -209.001
 horizontal_right_dist_lb_0_1: - w_var_1 + x_grid_var_0 - x_grid_var_1
   - 210 z1R_0_1 >= -210
 EMIB_left_overlap_right_0_1: w_var_1 + x_grid_var_1 - EMIB_x_grid_var_0_1
   - 210 z1R_0_1 >= -209.001
 EMIB_right_overlap_right_0_1: EMIB_w_var_0_1 - x_grid_var_0
   + EMIB_x_grid_var_0_1 - 210 z1R_0_1 >= -209.001
 vertical_down_dist_lb_0_1: - h_var_0 - y_grid_var_0 + y_grid_var_1
   - 210 z2D_0_1 >= -210
 EMIB_bottom_overlap_down_0_1: h_var_0 + y_grid_var_0 - EMIB_y_grid_var_0_1
   - 210 z2D_0_1 >= -209.001
 EMIB_top_overlap_down_0_1: EMIB_h_var_0_1 - y_grid_var_1
   + EMIB_y_grid_var_0_1 - 210 z2D_0_1 >= -209.001
 vertical_up_dist_lb_0_1: - h_var_1 + y_grid_var_0 - y_grid_var_1
   - 210 z2U_0_1 >= -210
 EMIB_bottom_overlap_up_0_1: h_var_1 + y_grid_var_1 - EMIB_y_grid_var_0_1
   - 210 z2U_0_1 >= -209.001
 EMIB_top_overlap_up_0_1: EMIB_h_var_0_1 - y_grid_var_0
   + EMIB_y_grid_var_0_1 - 210 z2U_0_1 >= -209.001
 shared_yi_ub1_0_1: h_var_0 - EMIB_h_var_0_1 + y_grid_var_0
   - EMIB_y_grid_var_0_1 - 210 z1_0_1 >= -210
 shared_yi_ub2_0_1: y_grid_var_0 - EMIB_y_grid_var_0_1 + 210 z1_0_1 <= 210
 shared_yj_ub1_0_1: h_var_1 - EMIB_h_var_0_1 + y_grid_var_1
   - EMIB_y_grid_var_0_1 - 210 z1_0_1 >= -210
 shared_yj_ub2_0_1: y_grid_var_1 - EMIB_y_grid_var_0_1 + 210 z1_0_1 <= 210
 shared_xi_ub1_0_1: w_var_0 - EMIB_w_var_0_1 + x_grid_var_0
   - EMIB_x_grid_var_0_1 - 210 z2_0_1 >= -210
 shared_xi_ub2_0_1: x_grid_var_0 - EMIB_x_grid_var_0_1 + 210 z2_0_1 <= 210
 shared_xj_ub1_0_1: w_var_1 - EMIB_w_var_0_1 + x_grid_var_1
   - EMIB_x_grid_var_0_1 - 210 z2_0_1 >= -210
 shared_xj_ub2_0_1: x_grid_var_1 - EMIB_x_grid_var_0_1 + 210 z2_0_1 <= 210
 must_adjacent_sb_0_3: z1_0_3 + z2_0_3 = 1
 horizontal_direction_sb_0_3: - z1_0_3 + z1L_0_3 + z1R_0_3 = 0
 vertical_direction_sb_0_3: - z2_0_3 + z2D_0_3 + z2U_0_3 = 0
 EMIB_rotate_eq_z2_0_3: r_EMIB_0_3 - z2_0_3 = 0
 horizontal_left_dist_lb_0_3: - w_var_0 - x_grid_var_0 + x_grid_var_3
   - 210 z1L_0_3 >= -210
 EMIB_left_overlap_0_3: w_var_0 + x_grid_var_0 - EMIB_x_grid_var_0_3
   - 210 z1L_0_3 >= -209.001
 EMIB_right_overlap_0_3: EMIB_w_var_0_3 - x_grid_var_3
   + EMIB_x_grid_var_0_3 - 210 z1L_0_3 >= -209.001
 horizontal_right_dist_lb_0_3: - w_var_3 + x_grid_var_0 - x_grid_var_3
   - 210 z1R_0_3 >= -210
 EMIB_left_overlap_right_0_3: w_var_3 + x_grid_var_3 - EMIB_x_grid_var_0_3
   - 210 z1R_0_3 >= -209.001
 EMIB_right_overlap_right_0_3: EMIB_w_var_0_3 - x_grid_var_0
   + EMIB_x_grid_var_0_3 - 210 z1R_0_3 >= -209.001
 vertical_down_dist_lb_0_3: - h_var_0 - y_grid_var_0 + y_grid_var_3
   - 210 z2D_0_3 >= -210
 EMIB_bottom_overlap_down_0_3: h_var_0 + y_grid_var_0 - EMIB_y_grid_var_0_3
   - 210 z2D_0_3 >= -209.001
 EMIB_top_overlap_down_0_3: EMIB_h_var_0_3 - y_grid_var_3
   + EMIB_y_grid_var_0_3 - 210 z2D_0_3 >= -209.001
 vertical_up_dist_lb_0_3: - h_var_3 + y_grid_var_0 - y_grid_var_3
   - 210 z2U_0_3 >= -210
 EMIB_bottom_overlap_up_0_3: h_var_3 + y_grid_var_3 - EMIB_y_grid_var_0_3
   - 210 z2U_0_3 >= -209.001
 EMIB_top_overlap_up_0_3: EMIB_h_var_0_3 - y_grid_var_0
   + EMIB_y_grid_var_0_3 - 210 z2U_0_3 >= -209.001
 shared_yi_ub1_0_3: h_var_0 - EMIB_h_var_0_3 + y_grid_var_0
   - EMIB_y_grid_var_0_3 - 210 z1_0_3 >= -210
 shared_yi_ub2_0_3: y_grid_var_0 - EMIB_y_grid_var_0_3 + 210 z1_0_3 <= 210
 shared_yj_ub1_0_3: h_var_3 - EMIB_h_var_0_3 + y_grid_var_3
   - EMIB_y_grid_var_0_3 - 210 z1_0_3 >= -210
 shared_yj_ub2_0_3: y_grid_var_3 - EMIB_y_grid_var_0_3 + 210 z1_0_3 <= 210
 shared_xi_ub1_0_3: w_var_0 - EMIB_w_var_0_3 + x_grid_var_0
   - EMIB_x_grid_var_0_3 - 210 z2_0_3 >= -210
 shared_xi_ub2_0_3: x_grid_var_0 - EMIB_x_grid_var_0_3 + 210 z2_0_3 <= 210
 shared_xj_ub1_0_3: w_var_3 - EMIB_w_var_0_3 + x_grid_var_3
   - EMIB_x_grid_var_0_3 - 210 z2_0_3 >= -210
 shared_xj_ub2_0_3: x_grid_var_3 - EMIB_x_grid_var_0_3 + 210 z2_0_3 <= 210
 must_adjacent_sb_0_4: z1_0_4 + z2_0_4 = 1
 horizontal_direction_sb_0_4: - z1_0_4 + z1L_0_4 + z1R_0_4 = 0
 vertical_direction_sb_0_4: - z2_0_4 + z2D_0_4 + z2U_0_4 = 0
 EMIB_rotate_eq_z2_0_4: r_EMIB_0_4 - z2_0_4 = 0
 horizontal_left_dist_lb_0_4: - w_var_0 - x_grid_var_0 + x_grid_var_4
   - 210 z1L_0_4 >= -210
 EMIB_left_overlap_0_4: w_var_0 + x_grid_var_0 - EMIB_x_grid_var_0_4
   - 210 z1L_0_4 >= -209.001
 EMIB_right_overlap_0_4: EMIB_w_var_0_4 - x_grid_var_4
   + EMIB_x_grid_var_0_4 - 210 z1L_0_4 >= -209.001
 horizontal_right_dist_lb_0_4: - w_var_4 + x_grid_var_0 - x_grid_var_4
   - 210 z1R_0_4 >= -210
 EMIB_left_overlap_right_0_4: w_var_4 + x_grid_var_4 - EMIB_x_grid_var_0_4
   - 210 z1R_0_4 >= -209.001
 EMIB_right_overlap_right_0_4: EMIB_w_var_0_4 - x_grid_var_0
   + EMIB_x_grid_var_0_4 - 210 z1R_0_4 >= -209.001
 vertical_down_dist_lb_0_4: - h_var_0 - y_grid_var_0 + y_grid_var_4
   - 210 z2D_0_4 >= -210
 EMIB_bottom_overlap_down_0_4: h_var_0 + y_grid_var_0 - EMIB_y_grid_var_0_4
   - 210 z2D_0_4 >= -209.001
 EMIB_top_overlap_down_0_4: EMIB_h_var_0_4 - y_grid_var_4
   + EMIB_y_grid_var_0_4 - 210 z2D_0_4 >= -209.001
 vertical_up_dist_lb_0_4: - h_var_4 + y_grid_var_0 - y_grid_var_4
   - 210 z2U_0_4 >= -210
 EMIB_bottom_overlap_up_0_4: h_var_4 + y_grid_var_4 - EMIB_y_grid_var_0_4
   - 210 z2U_0_4 >= -209.001
 EMIB_top_overlap_up_0_4: EMIB_h_var_0_4 - y_grid_var_0
   + EMIB_y_grid_var_0_4 - 210 z2U_0_4 >= -209.001
 shared_yi_ub1_0_4: h_var_0 - EMIB_h_var_0_4 + y_grid_var_0
   - EMIB_y_grid_var_0_4 - 210 z1_0_4 >= -210
 shared_yi_ub2_0_4: y_grid_var_0 - EMIB_y_grid_var_0_4 + 210 z1_0_4 <= 210
 shared_yj_ub1_0_4: h_var_4 - EMIB_h_var_0_4 + y_grid_var_4
   - EMIB_y_grid_var_0_4 - 210 z1_0_4 >= -210
 shared_yj_ub2_0_4: y_grid_var_4 - EMIB_y_grid_var_0_4 + 210 z1_0_4 <= 210
 shared_xi_ub1_0_4: w_var_0 - EMIB_w_var_0_4 + x_grid_var_0
   - EMIB_x_grid_var_0_4 - 210 z2_0_4 >= -210
 shared_xi_ub2_0_4: x_grid_var_0 - EMIB_x_grid_var_0_4 + 210 z2_0_4 <= 210
 shared_xj_ub1_0_4: w_var_4 - EMIB_w_var_0_4 + x_grid_var_4
   - EMIB_x_grid_var_0_4 - 210 z2_0_4 >= -210
 shared_xj_ub2_0_4: x_grid_var_4 - EMIB_x_grid_var_0_4 + 210 z2_0_4 <= 210
 must_adjacent_sb_1_2: z1_1_2 + z2_1_2 = 1
 horizontal_direction_sb_1_2: - z1_1_2 + z1L_1_2 + z1R_1_2 = 0
 vertical_direction_sb_1_2: - z2_1_2 + z2D_1_2 + z2U_1_2 = 0
 EMIB_rotate_eq_z2_1_2: r_EMIB_1_2 - z2_1_2 = 0
 horizontal_left_dist_lb_1_2: - w_var_1 - x_grid_var_1 + x_grid_var_2
   - 210 z1L_1_2 >= -210
 EMIB_left_overlap_1_2: w_var_1 + x_grid_var_1 - EMIB_x_grid_var_1_2
   - 210 z1L_1_2 >= -209.001
 EMIB_right_overlap_1_2: EMIB_w_var_1_2 - x_grid_var_2
   + EMIB_x_grid_var_1_2 - 210 z1L_1_2 >= -209.001
 horizontal_right_dist_lb_1_2: - w_var_2 + x_grid_var_1 - x_grid_var_2
   - 210 z1R_1_2 >= -210
 EMIB_left_overlap_right_1_2: w_var_2 + x_grid_var_2 - EMIB_x_grid_var_1_2
   - 210 z1R_1_2 >= -209.001
 EMIB_right_overlap_right_1_2: EMIB_w_var_1_2 - x_grid_var_1
   + EMIB_x_grid_var_1_2 - 210 z1R_1_2 >= -209.001
 vertical_down_dist_lb_1_2: - h_var_1 - y_grid_var_1 + y_grid_var_2
   - 210 z2D_1_2 >= -210
 EMIB_bottom_overlap_down_1_2: h_var_1 + y_grid_var_1 - EMIB_y_grid_var_1_2
   - 210 z2D_1_2 >= -209.001
 EMIB_top_overlap_down_1_2: EMIB_h_var_1_2 - y_grid_var_2
   + EMIB_y_grid_var_1_2 - 210 z2D_1_2 >= -209.001
 vertical_up_dist_lb_1_2: - h_var_2 + y_grid_var_1 - y_grid_var_2
   - 210 z2U_1_2 >= -210
 EMIB_bottom_overlap_up_1_2: h_var_2 + y_grid_var_2 - EMIB_y_grid_var_1_2
   - 210 z2U_1_2 >= -209.001
 EMIB_top_overlap_up_1_2: EMIB_h_var_1_2 - y_grid_var_1
   + EMIB_y_grid_var_1_2 - 210 z2U_1_2 >= -209.001
 shared_yi_ub1_1_2: h_var_1 - EMIB_h_var_1_2 + y_grid_var_1
   - EMIB_y_grid_var_1_2 - 210 z1_1_2 >= -210
 shared_yi_ub2_1_2: y_grid_var_1 - EMIB_y_grid_var_1_2 + 210 z1_1_2 <= 210
 shared_yj_ub1_1_2: h_var_2 - EMIB_h_var_1_2 + y_grid_var_2
   - EMIB_y_grid_var_1_2 - 210 z1_1_2 >= -210
 shared_yj_ub2_1_2: y_grid_var_2 - EMIB_y_grid_var_1_2 + 210 z1_1_2 <= 210
 shared_xi_ub1_1_2: w_var_1 - EMIB_w_var_1_2 + x_grid_var_1
   - EMIB_x_grid_var_1_2 - 210 z2_1_2 >= -210
 shared_xi_ub2_1_2: x_grid_var_1 - EMIB_x_grid_var_1_2 + 210 z2_1_2 <= 210
 shared_xj_ub1_1_2: w_var_2 - EMIB_w_var_1_2 + x_grid_var_2
   - EMIB_x_grid_var_1_2 - 210 z2_1_2 >= -210
 shared_xj_ub2_1_2: x_grid_var_2 - EMIB_x_grid_var_1_2 + 210 z2_1_2 <= 210
 must_adjacent_sb_1_5: z1_1_5 + z2_1_5 = 1
 horizontal_direction_sb_1_5: - z1_1_5 + z1L_1_5 + z1R_1_5 = 0
 vertical_direction_sb_1_5: - z2_1_5 + z2D_1_5 + z2U_1_5 = 0
 EMIB_rotate_eq_z2_1_5: r_EMIB_1_5 - z2_1_5 = 0
 horizontal_left_dist_lb_1_5: - w_var_1 - x_grid_var_1 + x_grid_var_5
   - 210 z1L_1_5 >= -210
 EMIB_left_overlap_1_5: w_var_1 + x_grid_var_1 - EMIB_x_grid_var_1_5
   - 210 z1L_1_5 >= -209.001
 EMIB_right_overlap_1_5: EMIB_w_var_1_5 - x_grid_var_5
   + EMIB_x_grid_var_1_5 - 210 z1L_1_5 >= -209.001
 horizontal_right_dist_lb_1_5: - w_var_5 + x_grid_var_1 - x_grid_var_5
   - 210 z1R_1_5 >= -210
 EMIB_left_overlap_right_1_5: w_var_5 + x_grid_var_5 - EMIB_x_grid_var_1_5
   - 210 z1R_1_5 >= -209.001
 EMIB_right_overlap_right_1_5: EMIB_w_var_1_5 - x_grid_var_1
   + EMIB_x_grid_var_1_5 - 210 z1R_1_5 >= -209.001
 vertical_down_dist_lb_1_5: - h_var_1 - y_grid_var_1 + y_grid_var_5
   - 210 z2D_1_5 >= -210
 EMIB_bottom_overlap_down_1_5: h_var_1 + y_grid_var_1 - EMIB_y_grid_var_1_5
   - 210 z2D_1_5 >= -209.001
 EMIB_top_overlap_down_1_5: EMIB_h_var_1_5 - y_grid_var_5
   + EMIB_y_grid_var_1_5 - 210 z2D_1_5 >= -209.001
 vertical_up_dist_lb_1_5: - h_var_5 + y_grid_var_1 - y_grid_var_5
   - 210 z2U_1_5 >= -210
 EMIB_bottom_overlap_up_1_5: h_var_5 + y_grid_var_5 - EMIB_y_grid_var_1_5
   - 210 z2U_1_5 >= -209.001
 EMIB_top_overlap_up_1_5: EMIB_h_var_1_5 - y_grid_var_1
   + EMIB_y_grid_var_1_5 - 210 z2U_1_5 >= -209.001
 shared_yi_ub1_1_5: h_var_1 - EMIB_h_var_1_5 + y_grid_var_1
   - EMIB_y_grid_var_1_5 - 210 z1_1_5 >= -210
 shared_yi_ub2_1_5: y_grid_var_1 - EMIB_y_grid_var_1_5 + 210 z1_1_5 <= 210
 shared_yj_ub1_1_5: h_var_5 - EMIB_h_var_1_5 + y_grid_var_5
   - EMIB_y_grid_var_1_5 - 210 z1_1_5 >= -210
 shared_yj_ub2_1_5: y_grid_var_5 - EMIB_y_grid_var_1_5 + 210 z1_1_5 <= 210
 shared_xi_ub1_1_5: w_var_1 - EMIB_w_var_1_5 + x_grid_var_1
   - EMIB_x_grid_var_1_5 - 210 z2_1_5 >= -210
 shared_xi_ub2_1_5: x_grid_var_1 - EMIB_x_grid_var_1_5 + 210 z2_1_5 <= 210
 shared_xj_ub1_1_5: w_var_5 - EMIB_w_var_1_5 + x_grid_var_5
   - EMIB_x_grid_var_1_5 - 210 z2_1_5 >= -210
 shared_xj_ub2_1_5: x_grid_var_5 - EMIB_x_grid_var_1_5 + 210 z2_1_5 <= 210
 must_adjacent_sb_2_3: z1_2_3 + z2_2_3 = 1
 horizontal_direction_sb_2_3: - z1_2_3 + z1L_2_3 + z1R_2_3 = 0
 vertical_direction_sb_2_3: - z2_2_3 + z2D_2_3 + z2U_2_3 = 0
 EMIB_rotate_eq_z2_2_3: r_EMIB_2_3 - z2_2_3 = 0
 horizontal_left_dist_lb_2_3: - w_var_2 - x_grid_var_2 + x_grid_var_3
   - 210 z1L_2_3 >= -210
 EMIB_left_overlap_2_3: w_var_2 + x_grid_var_2 - EMIB_x_grid_var_2_3
   - 210 z1L_2_3 >= -209.001
 EMIB_right_overlap_2_3: EMIB_w_var_2_3 - x_grid_var_3
   + EMIB_x_grid_var_2_3 - 210 z1L_2_3 >= -209.001
 horizontal_right_dist_lb_2_3: - w_var_3 + x_grid_var_2 - x_grid_var_3
   - 210 z1R_2_3 >= -210
 EMIB_left_overlap_right_2_3: w_var_3 + x_grid_var_3 - EMIB_x_grid_var_2_3
   - 210 z1R_2_3 >= -209.001
 EMIB_right_overlap_right_2_3: EMIB_w_var_2_3 - x_grid_var_2
   + EMIB_x_grid_var_2_3 - 210 z1R_2_3 >= -209.001
 vertical_down_dist_lb_2_3: - h_var_2 - y_grid_var_2 + y_grid_var_3
   - 210 z2D_2_3 >= -210
 EMIB_bottom_overlap_down_2_3: h_var_2 + y_grid_var_2 - EMIB_y_grid_var_2_3
   - 210 z2D_2_3 >= -209.001
 EMIB_top_overlap_down_2_3: EMIB_h_var_2_3 - y_grid_var_3
   + EMIB_y_grid_var_2_3 - 210 z2D_2_3 >= -209.001
 vertical_up_dist_lb_2_3: - h_var_3 + y_grid_var_2 - y_grid_var_3
   - 210 z2U_2_3 >= -210
 EMIB_bottom_overlap_up_2_3: h_var_3 + y_grid_var_3 - EMIB_y_grid_var_2_3
   - 210 z2U_2_3 >= -209.001
 EMIB_top_overlap_up_2_3: EMIB_h_var_2_3 - y_grid_var_2
   + EMIB_y_grid_var_2_3 - 210 z2U_2_3 >= -209.001
 shared_yi_ub1_2_3: h_var_2 - EMIB_h_var_2_3 + y_grid_var_2
   - EMIB_y_grid_var_2_3 - 210 z1_2_3 >= -210
 shared_yi_ub2_2_3: y_grid_var_2 - EMIB_y_grid_var_2_3 + 210 z1_2_3 <= 210
 shared_yj_ub1_2_3: h_var_3 - EMIB_h_var_2_3 + y_grid_var_3
   - EMIB_y_grid_var_2_3 - 210 z1_2_3 >= -210
 shared_yj_ub2_2_3: y_grid_var_3 - EMIB_y_grid_var_2_3 + 210 z1_2_3 <= 210
 shared_xi_ub1_2_3: w_var_2 - EMIB_w_var_2_3 + x_grid_var_2
   - EMIB_x_grid_var_2_3 - 210 z2_2_3 >= -210
 shared_xi_ub2_2_3: x_grid_var_2 - EMIB_x_grid_var_2_3 + 210 z2_2_3 <= 210
 shared_xj_ub1_2_3: w_var_3 - EMIB_w_var_2_3 + x_grid_var_3
   - EMIB_x_grid_var_2_3 - 210 z2_2_3 >= -210
 shared_xj_ub2_2_3: x_grid_var_3 - EMIB_x_grid_var_2_3 + 210 z2_2_3 <= 210
 must_adjacent_sb_2_6: z1_2_6 + z2_2_6 = 1
 horizontal_direction_sb_2_6: - z1_2_6 + z1L_2_6 + z1R_2_6 = 0
 vertical_direction_sb_2_6: - z2_2_6 + z2D_2_6 + z2U_2_6 = 0
 EMIB_rotate_eq_z2_2_6: r_EMIB_2_6 - z2_2_6 = 0
 horizontal_left_dist_lb_2_6: - w_var_2 - x_grid_var_2 + x_grid_var_6
   - 210 z1L_2_6 >= -210
 EMIB_left_overlap_2_6: w_var_2 + x_grid_var_2 - EMIB_x_grid_var_2_6
   - 210 z1L_2_6 >= -209.001
 EMIB_right_overlap_2_6: EMIB_w_var_2_6 - x_grid_var_6
   + EMIB_x_grid_var_2_6 - 210 z1L_2_6 >= -209.001
 horizontal_right_dist_lb_2_6: - w_var_6 + x_grid_var_2 - x_grid_var_6
   - 210 z1R_2_6 >= -210
 EMIB_left_overlap_right_2_6: w_var_6 + x_grid_var_6 - EMIB_x_grid_var_2_6
   - 210 z1R_2_6 >= -209.001
 EMIB_right_overlap_right_2_6: EMIB_w_var_2_6 - x_grid_var_2
   + EMIB_x_grid_var_2_6 - 210 z1R_2_6 >= -209.001
 vertical_down_dist_lb_2_6: - h_var_2 - y_grid_var_2 + y_grid_var_6
   - 210 z2D_2_6 >= -210
 EMIB_bottom_overlap_down_2_6: h_var_2 + y_grid_var_2 - EMIB_y_grid_var_2_6
   - 210 z2D_2_6 >= -209.001
 EMIB_top_overlap_down_2_6: EMIB_h_var_2_6 - y_grid_var_6
   + EMIB_y_grid_var_2_6 - 210 z2D_2_6 >= -209.001
 vertical_up_dist_lb_2_6: - h_var_6 + y_grid_var_2 - y_grid_var_6
   - 210 z2U_2_6 >= -210
 EMIB_bottom_overlap_up_2_6: h_var_6 + y_grid_var_6 - EMIB_y_grid_var_2_6
   - 210 z2U_2_6 >= -209.001
 EMIB_top_overlap_up_2_6: EMIB_h_var_2_6 - y_grid_var_2
   + EMIB_y_grid_var_2_6 - 210 z2U_2_6 >= -209.001
 shared_yi_ub1_2_6: h_var_2 - EMIB_h_var_2_6 + y_grid_var_2
   - EMIB_y_grid_var_2_6 - 210 z1_2_6 >= -210
 shared_yi_ub2_2_6: y_grid_var_2 - EMIB_y_grid_var_2_6 + 210 z1_2_6 <= 210
 shared_yj_ub1_2_6: h_var_6 - EMIB_h_var_2_6 + y_grid_var_6
   - EMIB_y_grid_var_2_6 - 210 z1_2_6 >= -210
 shared_yj_ub2_2_6: y_grid_var_6 - EMIB_y_grid_var_2_6 + 210 z1_2_6 <= 210
 shared_xi_ub1_2_6: w_var_2 - EMIB_w_var_2_6 + x_grid_var_2
   - EMIB_x_grid_var_2_6 - 210 z2_2_6 >= -210
 shared_xi_ub2_2_6: x_grid_var_2 - EMIB_x_grid_var_2_6 + 210 z2_2_6 <= 210
 shared_xj_ub1_2_6: w_var_6 - EMIB_w_var_2_6 + x_grid_var_6
   - EMIB_x_grid_var_2_6 - 210 z2_2_6 >= -210
 shared_xj_ub2_2_6: x_grid_var_6 - EMIB_x_grid_var_2_6 + 210 z2_2_6 <= 210
 must_adjacent_sb_3_7: z1_3_7 + z2_3_7 = 1
 horizontal_direction_sb_3_7: - z1_3_7 + z1L_3_7 + z1R_3_7 = 0
 vertical_direction_sb_3_7: - z2_3_7 + z2D_3_7 + z2U_3_7 = 0
 EMIB_rotate_eq_z2_3_7: r_EMIB_3_7 - z2_3_7 = 0
 horizontal_left_dist_lb_3_7: - w_var_3 - x_grid_var_3 + x_grid_var_7
   - 210 z1L_3_7 >= -210
 EMIB_left_overlap_3_7: w_var_3 + x_grid_var_3 - EMIB_x_grid_var_3_7
   - 210 z1L_3_7 >= -209.001
 EMIB_right_overlap_3_7: EMIB_w_var_3_7 - x_grid_var_7
   + EMIB_x_grid_var_3_7 - 210 z1L_3_7 >= -209.001
 horizontal_right_dist_lb_3_7: - w_var_7 + x_grid_var_3 - x_grid_var_7
   - 210 z1R_3_7 >= -210
 EMIB_left_overlap_right_3_7: w_var_7 + x_grid_var_7 - EMIB_x_grid_var_3_7
   - 210 z1R_3_7 >= -209.001
 EMIB_right_overlap_right_3_7: EMIB_w_var_3_7 - x_grid_var_3
   + EMIB_x_grid_var_3_7 - 210 z1R_3_7 >= -209.001
 vertical_down_dist_lb_3_7: - h_var_3 - y_grid_var_3 + y_grid_var_7
   - 210 z2D_3_7 >= -210
 EMIB_bottom_overlap_down_3_7: h_var_3 + y_grid_var_3 - EMIB_y_grid_var_3_7
   - 210 z2D_3_7 >= -209.001
 EMIB_top_overlap_down_3_7: EMIB_h_var_3_7 - y_grid_var_7
   + EMIB_y_grid_var_3_7 - 210 z2D_3_7 >= -209.001
 vertical_up_dist_lb_3_7: - h_var_7 + y_grid_var_3 - y_grid_var_7
   - 210 z2U_3_7 >= -210
 EMIB_bottom_overlap_up_3_7: h_var_7 + y_grid_var_7 - EMIB_y_grid_var_3_7
   - 210 z2U_3_7 >= -209.001
 EMIB_top_overlap_up_3_7: EMIB_h_var_3_7 - y_grid_var_3
   + EMIB_y_grid_var_3_7 - 210 z2U_3_7 >= -209.001
 shared_yi_ub1_3_7: h_var_3 - EMIB_h_var_3_7 + y_grid_var_3
   - EMIB_y_grid_var_3_7 - 210 z1_3_7 >= -210
 shared_yi_ub2_3_7: y_grid_var_3 - EMIB_y_grid_var_3_7 + 210 z1_3_7 <= 210
 shared_yj_ub1_3_7: h_var_7 - EMIB_h_var_3_7 + y_grid_var_7
   - EMIB_y_grid_var_3_7 - 210 z1_3_7 >= -210
 shared_yj_ub2_3_7: y_grid_var_7 - EMIB_y_grid_var_3_7 + 210 z1_3_7 <= 210
 shared_xi_ub1_3_7: w_var_3 - EMIB_w_var_3_7 + x_grid_var_3
   - EMIB_x_grid_var_3_7 - 210 z2_3_7 >= -210
 shared_xi_ub2_3_7: x_grid_var_3 - EMIB_x_grid_var_3_7 + 210 z2_3_7 <= 210
 shared_xj_ub1_3_7: w_var_7 - EMIB_w_var_3_7 + x_grid_var_7
   - EMIB_x_grid_var_3_7 - 210 z2_3_7 >= -210
 shared_xj_ub2_3_7: x_grid_var_7 - EMIB_x_grid_var_3_7 + 210 z2_3_7 <= 210
 non_overlap_any_0_1: p_left_0_1 + p_right_0_1 + p_down_0_1 + p_up_0_1
   >= 1
 non_overlap_left_0_1: w_var_0 + x_grid_var_0 - x_grid_var_1
   + 210 p_left_0_1 <= 210
 non_overlap_left_rev_0_1: - w_var_0 - x_grid_var_0 + x_grid_var_1
   - 210 p_left_0_1 <= 0
 non_overlap_right_0_1: w_var_1 - x_grid_var_0 + x_grid_var_1
   + 210 p_right_0_1 <= 210
 non_overlap_right_rev_0_1: - w_var_1 + x_grid_var_0 - x_grid_var_1
   - 210 p_right_0_1 <= 0
 non_overlap_down_0_1: h_var_0 + y_grid_var_0 - y_grid_var_1
   + 210 p_down_0_1 <= 210
 non_overlap_down_rev_0_1: - h_var_0 - y_grid_var_0 + y_grid_var_1
   - 210 p_down_0_1 <= 0
 non_overlap_up_0_1: h_var_1 - y_grid_var_0 + y_grid_var_1 + 210 p_up_0_1
   <= 210
 non_overlap_up_rev_0_1: - h_var_1 + y_grid_var_0 - y_grid_var_1
   - 210 p_up_0_1 <= 0
 non_overlap_any_0_2: p_left_0_2 + p_right_0_2 + p_down_0_2 + p_up_0_2
   >= 1
 non_overlap_left_0_2: w_var_0 + x_grid_var_0 - x_grid_var_2
   + 210 p_left_0_2 <= 210
 non_overlap_left_rev_0_2: - w_var_0 - x_grid_var_0 + x_grid_var_2
   - 210 p_left_0_2 <= 0
 non_overlap_right_0_2: w_var_2 - x_grid_var_0 + x_grid_var_2
   + 210 p_right_0_2 <= 210
 non_overlap_right_rev_0_2: - w_var_2 + x_grid_var_0 - x_grid_var_2
   - 210 p_right_0_2 <= 0
 non_overlap_down_0_2: h_var_0 + y_grid_var_0 - y_grid_var_2
   + 210 p_down_0_2 <= 210
 non_overlap_down_rev_0_2: - h_var_0 - y_grid_var_0 + y_grid_var_2
   - 210 p_down_0_2 <= 0
 non_overlap_up_0_2: h_var_2 - y_grid_var_0 + y_grid_var_2 + 210 p_up_0_2
   <= 210
 non_overlap_up_rev_0_2: - h_var_2 + y_grid_var_0 - y_grid_var_2
   - 210 p_up_0_2 <= 0
 non_overlap_any_0_3: p_left_0_3 + p_right_0_3 + p_down_0_3 + p_up_0_3
   >= 1
 non_overlap_left_0_3: w_var_0 + x_grid_var_0 - x_grid_var_3
   + 210 p_left_0_3 <= 210
 non_overlap_left_rev_0_3: - w_var_0 - x_grid_var_0 + x_grid_var_3
   - 210 p_left_0_3 <= 0
 non_overlap_right_0_3: w_var_3 - x_grid_var_0 + x_grid_var_3
   + 210 p_right_0_3 <= 210
 non_overlap_right_rev_0_3: - w_var_3 + x_grid_var_0 - x_grid_var_3
   - 210 p_right_0_3 <= 0
 non_overlap_down_0_3: h_var_0 + y_grid_var_0 - y_grid_var_3
   + 210 p_down_0_3 <= 210
 non_overlap_down_rev_0_3: - h_var_0 - y_grid_var_0 + y_grid_var_3
   - 210 p_down_0_3 <= 0
 non_overlap_up_0_3: h_var_3 - y_grid_var_0 + y_grid_var_3 + 210 p_up_0_3
   <= 210
 non_overlap_up_rev_0_3: - h_var_3 + y_grid_var_0 - y_grid_var_3
   - 210 p_up_0_3 <= 0
 non_overlap_any_0_4: p_left_0_4 + p_right_0_4 + p_down_0_4 + p_up_0_4
   >= 1
 non_overlap_left_0_4: w_var_0 + x_grid_var_0 - x_grid_var_4
   + 210 p_left_0_4 <= 210
 non_overlap_left_rev_0_4: - w_var_0 - x_grid_var_0 + x_grid_var_4
   - 210 p_left_0_4 <= 0
 non_overlap_right_0_4: w_var_4 - x_grid_var_0 + x_grid_var_4
   + 210 p_right_0_4 <= 210
 non_overlap_right_rev_0_4: - w_var_4 + x_grid_var_0 - x_grid_var_4
   - 210 p_right_0_4 <= 0
 non_overlap_down_0_4: h_var_0 + y_grid_var_0 - y_grid_var_4
   + 210 p_down_0_4 <= 210
 non_overlap_down_rev_0_4: - h_var_0 - y_grid_var_0 + y_grid_var_4
   - 210 p_down_0_4 <= 0
 non_overlap_up_0_4: h_var_4 - y_grid_var_0 + y_grid_var_4 + 210 p_up_0_4
   <= 210
 non_overlap_up_rev_0_4: - h_var_4 + y_grid_var_0 - y_grid_var_4
   - 210 p_up_0_4 <= 0
 non_overlap_any_0_5: p_left_0_5 + p_right_0_5 + p_down_0_5 + p_up_0_5
   >= 1
 non_overlap_left_0_5: w_var_0 + x_grid_var_0 - x_grid_var_5
   + 210 p_left_0_5 <= 210
 non_overlap_left_rev_0_5: - w_var_0 - x_grid_var_0 + x_grid_var_5
   - 210 p_left_0_5 <= 0
 non_overlap_right_0_5: w_var_5 - x_grid_var_0 + x_grid_var_5
   + 210 p_right_0_5 <= 210
 non_overlap_right_rev_0_5: - w_var_5 + x_grid_var_0 - x_grid_var_5
   - 210 p_right_0_5 <= 0
 non_overlap_down_0_5: h_var_0 + y_grid_var_0 - y_grid_var_5
   + 210 p_down_0_5 <= 210
 non_overlap_down_rev_0_5: - h_var_0 - y_grid_var_0 + y_grid_var_5
   - 210 p_down_0_5 <= 0
 non_overlap_up_0_5: h_var_5 - y_grid_var_0 + y_grid_var_5 + 210 p_up_0_5
   <= 210
 non_overlap_up_rev_0_5: - h_var_5 + y_grid_var_0 - y_grid_var_5
   - 210 p_up_0_5 <= 0
 non_overlap_any_0_6: p_left_0_6 + p_right_0_6 + p_down_0_6 + p_up_0_6
   >= 1
 non_overlap_left_0_6: w_var_0 + x_grid_var_0 - x_grid_var_6
   + 210 p_left_0_6 <= 210
 non_overlap_left_rev_0_6: - w_var_0 - x_grid_var_0 + x_grid_var_6
   - 210 p_left_0_6 <= 0
 non_overlap_right_0_6: w_var_6 - x_grid_var_0 + x_grid_var_6
   + 210 p_right_0_6 <= 210
 non_overlap_right_rev_0_6: - w_var_6 + x_grid_var_0 - x_grid_var_6
   - 210 p_right_0_6 <= 0
 non_overlap_down_0_6: h_var_0 + y_grid_var_0 - y_grid_var_6
   + 210 p_down_0_6 <= 210
 non_overlap_down_rev_0_6: - h_var_0 - y_grid_var_0 + y_grid_var_6
   - 210 p_down_0_6 <= 0
 non_overlap_up_0_6: h_var_6 - y_grid_var_0 + y_grid_var_6 + 210 p_up_0_6
   <= 210
 non_overlap_up_rev_0_6: - h_var_6 + y_grid_var_0 - y_grid_var_6
   - 210 p_up_0_6 <= 0
 non_overlap_any_0_7: p_left_0_7 + p_right_0_7 + p_down_0_7 + p_up_0_7
   >= 1
 non_overlap_left_0_7: w_var_0 + x_grid_var_0 - x_grid_var_7
   + 210 p_left_0_7 <= 210
 non_overlap_left_rev_0_7: - w_var_0 - x_grid_var_0 + x_grid_var_7
   - 210 p_left_0_7 <= 0
 non_overlap_right_0_7: w_var_7 - x_grid_var_0 + x_grid_var_7
   + 210 p_right_0_7 <= 210
 non_overlap_right_rev_0_7: - w_var_7 + x_grid_var_0 - x_grid_var_7
   - 210 p_right_0_7 <= 0
 non_overlap_down_0_7: h_var_0 + y_grid_var_0 - y_grid_var_7
   + 210 p_down_0_7 <= 210
 non_overlap_down_rev_0_7: - h_var_0 - y_grid_var_0 + y_grid_var_7
   - 210 p_down_0_7 <= 0
 non_overlap_up_0_7: h_var_7 - y_grid_var_0 + y_grid_var_7 + 210 p_up_0_7
   <= 210
 non_overlap_up_rev_0_7: - h_var_7 + y_grid_var_0 - y_grid_var_7
   - 210 p_up_0_7 <= 0
 non_overlap_any_1_2: p_left_1_2 + p_right_1_2 + p_down_1_2 + p_up_1_2
   >= 1
 non_overlap_left_1_2: w_var_1 + x_grid_var_1 - x_grid_var_2
   + 210 p_left_1_2 <= 210
 non_overlap_left_rev_1_2: - w_var_1 - x_grid_var_1 + x_grid_var_2
   - 210 p_left_1_2 <= 0
 non_overlap_right_1_2: w_var_2 - x_grid_var_1 + x_grid_var_2
   + 210 p_right_1_2 <= 210
 non_overlap_right_rev_1_2: - w_var_2 + x_grid_var_1 - x_grid_var_2
   - 210 p_right_1_2 <= 0
 non_overlap_down_1_2: h_var_1 + y_grid_var_1 - y_grid_var_2
   + 210 p_down_1_2 <= 210
 non_overlap_down_rev_1_2: - h_var_1 - y_grid_var_1 + y_grid_var_2
   - 210 p_down_1_2 <= 0
 non_overlap_up_1_2: h_var_2 - y_grid_var_1 + y_grid_var_2 + 210 p_up_1_2
   <= 210
 non_overlap_up_rev_1_2: - h_var_2 + y_grid_var_1 - y_grid_var_2
   - 210 p_up_1_2 <= 0
 non_overlap_any_1_3: p_left_1_3 + p_right_1_3 + p_down_1_3 + p_up_1_3
   >= 1
 non_overlap_left_1_3: w_var_1 + x_grid_var_1 - x_grid_var_3
   + 210 p_left_1_3 <= 210
 non_overlap_left_rev_1_3: - w_var_1 - x_grid_var_1 + x_grid_var_3
   - 210 p_left_1_3 <= 0
 non_overlap_right_1_3: w_var_3 - x_grid_var_1 + x_grid_var_3
   + 210 p_right_1_3 <= 210
 non_overlap_right_rev_1_3: - w_var_3 + x_grid_var_1 - x_grid_var_3
   - 210 p_right_1_3 <= 0
 non_overlap_down_1_3: h_var_1 + y_grid_var_1 - y_grid_var_3
   + 210 p_down_1_3 <= 210
 non_overlap_down_rev_1_3: - h_var_1 - y_grid_var_1 + y_grid_var_3
   - 210 p_down_1_3 <= 0
 non_overlap_up_1_3: h_var_3 - y_grid_var_1 + y_grid_var_3 + 210 p_up_1_3
   <= 210
 non_overlap_up_rev_1_3: - h_var_3 + y_grid_var_1 - y_grid_var_3
   - 210 p_up_1_3 <= 0
 non_overlap_any_1_4: p_left_1_4 + p_right_1_4 + p_down_1_4 + p_up_1_4
   >= 1
 non_overlap_left_1_4: w_var_1 + x_grid_var_1 - x_grid_var_4
   + 210 p_left_1_4 <= 210
 non_overlap_left_rev_1_4: - w_var_1 - x_grid_var_1 + x_grid_var_4
   - 210 p_left_1_4 <= 0
 non_overlap_right_1_4: w_var_4 - x_grid_var_1 + x_grid_var_4
   + 210 p_right_1_4 <= 210
 non_overlap_right_rev_1_4: - w_var_4 + x_grid_var_1 - x_grid_var_4
   - 210 p_right_1_4 <= 0
 non_overlap_down_1_4: h_var_1 + y_grid_var_1 - y_grid_var_4
   + 210 p_down_1_4 <= 210
 non_overlap_down_rev_1_4: - h_var_1 - y_grid_var_1 + y_grid_var_4
   - 210 p_down_1_4 <= 0
 non_overlap_up_1_4: h_var_4 - y_grid_var_1 + y_grid_var_4 + 210 p_up_1_4
   <= 210
 non_overlap_up_rev_1_4: - h_var_4 + y_grid_var_1 - y_grid_var_4
   - 210 p_up_1_4 <= 0
 non_overlap_any_1_5: p_left_1_5 + p_right_1_5 + p_down_1_5 + p_up_1_5
   >= 1
 non_overlap_left_1_5: w_var_1 + x_grid_var_1 - x_grid_var_5
   + 210 p_left_1_5 <= 210
 non_overlap_left_rev_1_5: - w_var_1 - x_grid_var_1 + x_grid_var_5
   - 210 p_left_1_5 <= 0
 non_overlap_right_1_5: w_var_5 - x_grid_var_1 + x_grid_var_5
   + 210 p_right_1_5 <= 210
 non_overlap_right_rev_1_5: - w_var_5 + x_grid_var_1 - x_grid_var_5
   - 210 p_right_1_5 <= 0
 non_overlap_down_1_5: h_var_1 + y_grid_var_1 - y_grid_var_5
   + 210 p_down_1_5 <= 210
 non_overlap_down_rev_1_5: - h_var_1 - y_grid_var_1 + y_grid_var_5
   - 210 p_down_1_5 <= 0
 non_overlap_up_1_5: h_var_5 - y_grid_var_1 + y_grid_var_5 + 210 p_up_1_5
   <= 210
 non_overlap_up_rev_1_5: - h_var_5 + y_grid_var_1 - y_grid_var_5
   - 210 p_up_1_5 <= 0
 non_overlap_any_1_6: p_left_1_6 + p_right_1_6 + p_down_1_6 + p_up_1_6
   >= 1
 non_overlap_left_1_6: w_var_1 + x_grid_var_1 - x_grid_var_6
   + 210 p_left_1_6 <= 210
 non_overlap_left_rev_1_6: - w_var_1 - x_grid_var_1 + x_grid_var_6
   - 210 p_left_1_6 <= 0
 non_overlap_right_1_6: w_var_6 - x_grid_var_1 + x_grid_var_6
   + 210 p_right_1_6 <= 210
 non_overlap_right_rev_1_6: - w_var_6 + x_grid_var_1 - x_grid_var_6
   - 210 p_right_1_6 <= 0
 non_overlap_down_1_6: h_var_1 + y_grid_var_1 - y_grid_var_6
   + 210 p_down_1_6 <= 210
 non_overlap_down_rev_1_6: - h_var_1 - y_grid_var_1 + y_grid_var_6
   - 210 p_down_1_6 <= 0
 non_overlap_up_1_6: h_var_6 - y_grid_var_1 + y_grid_var_6 + 210 p_up_1_6
   <= 210
 non_overlap_up_rev_1_6: - h_var_6 + y_grid_var_1 - y_grid_var_6
   - 210 p_up_1_6 <= 0
 non_overlap_any_1_7: p_left_1_7 + p_right_1_7 + p_down_1_7 + p_up_1_7
   >= 1
 non_overlap_left_1_7: w_var_1 + x_grid_var_1 - x_grid_var_7
   + 210 p_left_1_7 <= 210
 non_overlap_left_rev_1_7: - w_var_1 - x_grid_var_1 + x_grid_var_7
   - 210 p_left_1_7 <= 0
 non_overlap_right_1_7: w_var_7 - x_grid_var_1 + x_grid_var_7
   + 210 p_right_1_7 <= 210
 non_overlap_right_rev_1_7: - w_var_7 + x_grid_var_1 - x_grid_var_7
   - 210 p_right_1_7 <= 0
 non_overlap_down_1_7: h_var_1 + y_grid_var_1 - y_grid_var_7
   + 210 p_down_1_7 <= 210
 non_overlap_down_rev_1_7: - h_var_1 - y_grid_var_1 + y_grid_var_7
   - 210 p_down_1_7 <= 0
 non_overlap_up_1_7: h_var_7 - y_grid_var_1 + y_grid_var_7 + 210 p_up_1_7
   <= 210
 non_overlap_up_rev_1_7: - h_var_7 + y_grid_var_1 - y_grid_var_7
   - 210 p_up_1_7 <= 0
 non_overlap_any_2_3: p_left_2_3 + p_right_2_3 + p_down_2_3 + p_up_2_3
   >= 1
 non_overlap_left_2_3: w_var_2 + x_grid_var_2 - x_grid_var_3
   + 210 p_left_2_3 <= 210
 non_overlap_left_rev_2_3: - w_var_2 - x_grid_var_2 + x_grid_var_3
   - 210 p_left_2_3 <= 0
 non_overlap_right_2_3: w_var_3 - x_grid_var_2 + x_grid_var_3
   + 210 p_right_2_3 <= 210
 non_overlap_right_rev_2_3: - w_var_3 + x_grid_var_2 - x_grid_var_3
   - 210 p_right_2_3 <= 0
 non_overlap_down_2_3: h_var_2 + y_grid_var_2 - y_grid_var_3
   + 210 p_down_2_3 <= 210
 non_overlap_down_rev_2_3: - h_var_2 - y_grid_var_2 + y_grid_var_3
   - 210 p_down_2_3 <= 0
 non_overlap_up_2_3: h_var_3 - y_grid_var_2 + y_grid_var_3 + 210 p_up_2_3
   <= 210
 non_overlap_up_rev_2_3: - h_var_3 + y_grid_var_2 - y_grid_var_3
   - 210 p_up_2_3 <= 0
 non_overlap_any_2_4: p_left_2_4 + p_right_2_4 + p_down_2_4 + p_up_2_4
   >= 1
 non_overlap_left_2_4: w_var_2 + x_grid_var_2 - x_grid_var_4
   + 210 p_left_2_4 <= 210
 non_overlap_left_rev_2_4: - w_var_2 - x_grid_var_2 + x_grid_var_4
   - 210 p_left_2_4 <= 0
 non_overlap_right_2_4: w_var_4 - x_grid_var_2 + x_grid_var_4
   + 210 p_right_2_4 <= 210
 non_overlap_right_rev_2_4: - w_var_4 + x_grid_var_2 - x_grid_var_4
   - 210 p_right_2_4 <= 0
 non_overlap_down_2_4: h_var_2 + y_grid_var_2 - y_grid_var_4
   + 210 p_down_2_4 <= 210
 non_overlap_down_rev_2_4: - h_var_2 - y_grid_var_2 + y_grid_var_4
   - 210 p_down_2_4 <= 0
 non_overlap_up_2_4: h_var_4 - y_grid_var_2 + y_grid_var_4 + 210 p_up_2_4
   <= 210
 non_overlap_up_rev_2_4: - h_var_4 + y_grid_var_2 - y_grid_var_4
   - 210 p_up_2_4 <= 0
 non_overlap_any_2_5: p_left_2_5 + p_right_2_5 + p_down_2_5 + p_up_2_5
   >= 1
 non_overlap_left_2_5: w_var_2 + x_grid_var_2 - x_grid_var_5
   + 210 p_left_2_5 <= 210
 non_overlap_left_rev_2_5: - w_var_2 - x_grid_var_2 + x_grid_var_5
   - 210 p_left_2_5 <= 0
 non_overlap_right_2_5: w_var_5 - x_grid_var_2 + x_grid_var_5
   + 210 p_right_2_5 <= 210
 non_overlap_right_rev_2_5: - w_var_5 + x_grid_var_2 - x_grid_var_5
   - 210 p_right_2_5 <= 0
 non_overlap_down_2_5: h_var_2 + y_grid_var_2 - y_grid_var_5
   + 210 p_down_2_5 <= 210
 non_overlap_down_rev_2_5: - h_var_2 - y_grid_var_2 + y_grid_var_5
   - 210 p_down_2_5 <= 0
 non_overlap_up_2_5: h_var_5 - y_grid_var_2 + y_grid_var_5 + 210 p_up_2_5
   <= 210
 non_overlap_up_rev_2_5: - h_var_5 + y_grid_var_2 - y_grid_var_5
   - 210 p_up_2_5 <= 0
 non_overlap_any_2_6: p_left_2_6 + p_right_2_6 + p_down_2_6 + p_up_2_6
   >= 1
 non_overlap_left_2_6: w_var_2 + x_grid_var_2 - x_grid_var_6
   + 210 p_left_2_6 <= 210
 non_overlap_left_rev_2_6: - w_var_2 - x_grid_var_2 + x_grid_var_6
   - 210 p_left_2_6 <= 0
 non_overlap_right_2_6: w_var_6 - x_grid_var_2 + x_grid_var_6
   + 210 p_right_2_6 <= 210
 non_overlap_right_rev_2_6: - w_var_6 + x_grid_var_2 - x_grid_var_6
   - 210 p_right_2_6 <= 0
 non_overlap_down_2_6: h_var_2 + y_grid_var_2 - y_grid_var_6
   + 210 p_down_2_6 <= 210
 non_overlap_down_rev_2_6: - h_var_2 - y_grid_var_2 + y_grid_var_6
   - 210 p_down_2_6 <= 0
 non_overlap_up_2_6: h_var_6 - y_grid_var_2 + y_grid_var_6 + 210 p_up_2_6
   <= 210
 non_overlap_up_rev_2_6: - h_var_6 + y_grid_var_2 - y_grid_var_6
   - 210 p_up_2_6 <= 0
 non_overlap_any_2_7: p_left_2_7 + p_right_2_7 + p_down_2_7 + p_up_2_7
   >= 1
 non_overlap_left_2_7: w_var_2 + x_grid_var_2 - x_grid_var_7
   + 210 p_left_2_7 <= 210
 non_overlap_left_rev_2_7: - w_var_2 - x_grid_var_2 + x_grid_var_7
   - 210 p_left_2_7 <= 0
 non_overlap_right_2_7: w_var_7 - x_grid_var_2 + x_grid_var_7
   + 210 p_right_2_7 <= 210
 non_overlap_right_rev_2_7: - w_var_7 + x_grid_var_2 - x_grid_var_7
   - 210 p_right_2_7 <= 0
 non_overlap_down_2_7: h_var_2 + y_grid_var_2 - y_grid_var_7
   + 210 p_down_2_7 <= 210
 non_overlap_down_rev_2_7: - h_var_2 - y_grid_var_2 + y_grid_var_7
   - 210 p_down_2_7 <= 0
 non_overlap_up_2_7: h_var_7 - y_grid_var_2 + y_grid_var_7 + 210 p_up_2_7
   <= 210
 non_overlap_up_rev_2_7: - h_var_7 + y_grid_var_2 - y_grid_var_7
   - 210 p_up_2_7 <= 0
 non_overlap_any_3_4: p_left_3_4 + p_right_3_4 + p_down_3_4 + p_up_3_4
   >= 1
 non_overlap_left_3_4: w_var_3 + x_grid_var_3 - x_grid_var_4
   + 210 p_left_3_4 <= 210
 non_overlap_left_rev_3_4: - w_var_3 - x_grid_var_3 + x_grid_var_4
   - 210 p_left_3_4 <= 0
 non_overlap_right_3_4: w_var_4 - x_grid_var_3 + x_grid_var_4
   + 210 p_right_3_4 <= 210
 non_overlap_right_rev_3_4: - w_var_4 + x_grid_var_3 - x_grid_var_4
   - 210 p_right_3_4 <= 0
 non_overlap_down_3_4: h_var_3 + y_grid_var_3 - y_grid_var_4
   + 210 p_down_3_4 <= 210
 non_overlap_down_rev_3_4: - h_var_3 - y_grid_var_3 + y_grid_var_4
   - 210 p_down_3_4 <= 0
 non_overlap_up_3_4: h_var_4 - y_grid_var_3 + y_grid_var_4 + 210 p_up_3_4
   <= 210
 non_overlap_up_rev_3_4: - h_var_4 + y_grid_var_3 - y_grid_var_4
   - 210 p_up_3_4 <= 0
 non_overlap_any_3_5: p_left_3_5 + p_right_3_5 + p_down_3_5 + p_up_3_5
   >= 1
 non_overlap_left_3_5: w_var_3 + x_grid_var_3 - x_grid_var_5
   + 210 p_left_3_5 <= 210
 non_overlap_left_rev_3_5: - w_var_3 - x_grid_var_3 + x_grid_var_5
   - 210 p_left_3_5 <= 0
 non_overlap_right_3_5: w_var_5 - x_grid_var_3 + x_grid_var_5
   + 210 p_right_3_5 <= 210
 non_overlap_right_rev_3_5: - w_var_5 + x_grid_var_3 - x_grid_var_5
   - 210 p_right_3_5 <= 0
 non_overlap_down_3_5: h_var_3 + y_grid_var_3 - y_grid_var_5
   + 210 p_down_3_5 <= 210
 non_overlap_down_rev_3_5: - h_var_3 - y_grid_var_3 + y_grid_var_5
   - 210 p_down_3_5 <= 0
 non_overlap_up_3_5: h_var_5 - y_grid_var_3 + y_grid_var_5 + 210 p_up_3_5
   <= 210
 non_overlap_up_rev_3_5: - h_var_5 + y_grid_var_3 - y_grid_var_5
   - 210 p_up_3_5 <= 0
 non_overlap_any_3_6: p_left_3_6 + p_right_3_6 + p_down_3_6 + p_up_3_6
   >= 1
 non_overlap_left_3_6: w_var_3 + x_grid_var_3 - x_grid_var_6
   + 210 p_left_3_6 <= 210
 non_overlap_left_rev_3_6: - w_var_3 - x_grid_var_3 + x_grid_var_6
   - 210 p_left_3_6 <= 0
 non_overlap_right_3_6: w_var_6 - x_grid_var_3 + x_grid_var_6
   + 210 p_right_3_6 <= 210
 non_overlap_right_rev_3_6: - w_var_6 + x_grid_var_3 - x_grid_var_6
   - 210 p_right_3_6 <= 0
 non_overlap_down_3_6: h_var_3 + y_grid_var_3 - y_grid_var_6
   + 210 p_down_3_6 <= 210
 non_overlap_down_rev_3_6: - h_var_3 - y_grid_var_3 + y_grid_var_6
   - 210 p_down_3_6 <= 0
 non_overlap_up_3_6: h_var_6 - y_grid_var_3 + y_grid_var_6 + 210 p_up_3_6
   <= 210
 non_overlap_up_rev_3_6: - h_var_6 + y_grid_var_3 - y_grid_var_6
   - 210 p_up_3_6 <= 0
 non_overlap_any_3_7: p_left_3_7 + p_right_3_7 + p_down_3_7 + p_up_3_7
   >= 1
 non_overlap_left_3_7: w_var_3 + x_grid_var_3 - x_grid_var_7
   + 210 p_left_3_7 <= 210
 non_overlap_left_rev_3_7: - w_var_3 - x_grid_var_3 + x_grid_var_7
   - 210 p_left_3_7 <= 0
 non_overlap_right_3_7: w_var_7 - x_grid_var_3 + x_grid_var_7
   + 210 p_right_3_7 <= 210
 non_overlap_right_rev_3_7: - w_var_7 + x_grid_var_3 - x_grid_var_7
   - 210 p_right_3_7 <= 0
 non_overlap_down_3_7: h_var_3 + y_grid_var_3 - y_grid_var_7
   + 210 p_down_3_7 <= 210
 non_overlap_down_rev_3_7: - h_var_3 - y_grid_var_3 + y_grid_var_7
   - 210 p_down_3_7 <= 0
 non_overlap_up_3_7: h_var_7 - y_grid_var_3 + y_grid_var_7 + 210 p_up_3_7
   <= 210
 non_overlap_up_rev_3_7: - h_var_7 + y_grid_var_3 - y_grid_var_7
   - 210 p_up_3_7 <= 0
 non_overlap_any_4_5: p_left_4_5 + p_right_4_5 + p_down_4_5 + p_up_4_5
   >= 1
 non_overlap_left_4_5: w_var_4 + x_grid_var_4 - x_grid_var_5
   + 210 p_left_4_5 <= 210
 non_overlap_left_rev_4_5: - w_var_4 - x_grid_var_4 + x_grid_var_5
   - 210 p_left_4_5 <= 0
 non_overlap_right_4_5: w_var_5 - x_grid_var_4 + x_grid_var_5
   + 210 p_right_4_5 <= 210
 non_overlap_right_rev_4_5: - w_var_5 + x_grid_var_4 - x_grid_var_5
   - 210 p_right_4_5 <= 0
 non_overlap_down_4_5: h_var_4 + y_grid_var_4 - y_grid_var_5
   + 210 p_down_4_5 <= 210
 non_overlap_down_rev_4_5: - h_var_4 - y_grid_var_4 + y_grid_var_5
   - 210 p_down_4_5 <= 0
 non_overlap_up_4_5: h_var_5 - y_grid_var_4 + y_grid_var_5 + 210 p_up_4_5
   <= 210
 non_overlap_up_rev_4_5: - h_var_5 + y_grid_var_4 - y_grid_var_5
   - 210 p_up_4_5 <= 0
 non_overlap_any_4_6: p_left_4_6 + p_right_4_6 + p_down_4_6 + p_up_4_6
   >= 1
 non_overlap_left_4_6: w_var_4 + x_grid_var_4 - x_grid_var_6
   + 210 p_left_4_6 <= 210
 non_overlap_left_rev_4_6: - w_var_4 - x_grid_var_4 + x_grid_var_6
   - 210 p_left_4_6 <= 0
 non_overlap_right_4_6: w_var_6 - x_grid_var_4 + x_grid_var_6
   + 210 p_right_4_6 <= 210
 non_overlap_right_rev_4_6: - w_var_6 + x_grid_var_4 - x_grid_var_6
   - 210 p_right_4_6 <= 0
 non_overlap_down_4_6: h_var_4 + y_grid_var_4 - y_grid_var_6
   + 210 p_down_4_6 <= 210
 non_overlap_down_rev_4_6: - h_var_4 - y_grid_var_4 + y_grid_var_6
   - 210 p_down_4_6 <= 0
 non_overlap_up_4_6: h_var_6 - y_grid_var_4 + y_grid_var_6 + 210 p_up_4_6
   <= 210
 non_overlap_up_rev_4_6: - h_var_6 + y_grid_var_4 - y_grid_var_6
   - 210 p_up_4_6 <= 0
 non_overlap_any_4_7: p_left_4_7 + p_right_4_7 + p_down_4_7 + p_up_4_7
   >= 1
 non_overlap_left_4_7: w_var_4 + x_grid_var_4 - x_grid_var_7
   + 210 p_left_4_7 <= 210
 non_overlap_left_rev_4_7: - w_var_4 - x_grid_var_4 + x_grid_var_7
   - 210 p_left_4_7 <= 0
 non_overlap_right_4_7: w_var_7 - x_grid_var_4 + x_grid_var_7
   + 210 p_right_4_7 <= 210
 non_overlap_right_rev_4_7: - w_var_7 + x_grid_var_4 - x_grid_var_7
   - 210 p_right_4_7 <= 0
 non_overlap_down_4_7: h_var_4 + y_grid_var_4 - y_grid_var_7
   + 210 p_down_4_7 <= 210
 non_overlap_down_rev_4_7: - h_var_4 - y_grid_var_4 + y_grid_var_7
   - 210 p_down_4_7 <= 0
 non_overlap_up_4_7: h_var_7 - y_grid_var_4 + y_grid_var_7 + 210 p_up_4_7
   <= 210
 non_overlap_up_rev_4_7: - h_var_7 + y_grid_var_4 - y_grid_var_7
   - 210 p_up_4_7 <= 0
 non_overlap_any_5_6: p_left_5_6 + p_right_5_6 + p_down_5_6 + p_up_5_6
   >= 1
 non_overlap_left_5_6: w_var_5 + x_grid_var_5 - x_grid_var_6
   + 210 p_left_5_6 <= 210
 non_overlap_left_rev_5_6: - w_var_5 - x_grid_var_5 + x_grid_var_6
   - 210 p_left_5_6 <= 0
 non_overlap_right_5_6: w_var_6 - x_grid_var_5 + x_grid_var_6
   + 210 p_right_5_6 <= 210
 non_overlap_right_rev_5_6: - w_var_6 + x_grid_var_5 - x_grid_var_6
   - 210 p_right_5_6 <= 0
 non_overlap_down_5_6: h_var_5 + y_grid_var_5 - y_grid_var_6
   + 210 p_down_5_6 <= 210
 non_overlap_down_rev_5_6: - h_var_5 - y_grid_var_5 + y_grid_var_6
   - 210 p_down_5_6 <= 0
 non_overlap_up_5_6: h_var_6 - y_grid_var_5 + y_grid_var_6 + 210 p_up_5_6
   <= 210
 non_overlap_up_rev_5_6: - h_var_6 + y_grid_var_5 - y_grid_var_6
   - 210 p_up_5_6 <= 0
 non_overlap_any_5_7: p_left_5_7 + p_right_5_7 + p_down_5_7 + p_up_5_7
   >= 1
 non_overlap_left_5_7: w_var_5 + x_grid_var_5 - x_grid_var_7
   + 210 p_left_5_7 <= 210
 non_overlap_left_rev_5_7: - w_var_5 - x_grid_var_5 + x_grid_var_7
   - 210 p_left_5_7 <= 0
 non_overlap_right_5_7: w_var_7 - x_grid_var_5 + x_grid_var_7
   + 210 p_right_5_7 <= 210
 non_overlap_right_rev_5_7: - w_var_7 + x_grid_var_5 - x_grid_var_7
   - 210 p_right_5_7 <= 0
 non_overlap_down_5_7: h_var_5 + y_grid_var_5 - y_grid_var_7
   + 210 p_down_5_7 <= 210
 non_overlap_down_rev_5_7: - h_var_5 - y_grid_var_5 + y_grid_var_7
   - 210 p_down_5_7 <= 0
 non_overlap_up_5_7: h_var_7 - y_grid_var_5 + y_grid_var_7 + 210 p_up_5_7
   <= 210
 non_overlap_up_rev_5_7: - h_var_7 + y_grid_var_5 - y_grid_var_7
   - 210 p_up_5_7 <= 0
 non_overlap_any_6_7: p_left_6_7 + p_right_6_7 + p_down_6_7 + p_up_6_7
   >= 1
 non_overlap_left_6_7: w_var_6 + x_grid_var_6 - x_grid_var_7
   + 210 p_left_6_7 <= 210
 non_overlap_left_rev_6_7: - w_var_6 - x_grid_var_6 + x_grid_var_7
   - 210 p_left_6_7 <= 0
 non_overlap_right_6_7: w_var_7 - x_grid_var_6 + x_grid_var_7
   + 210 p_right_6_7 <= 210
 non_overlap_right_rev_6_7: - w_var_7 + x_grid_var_6 - x_grid_var_7
   - 210 p_right_6_7 <= 0
 non_overlap_down_6_7: h_var_6 + y_grid_var_6 - y_grid_var_7
   + 210 p_down_6_7 <= 210
 non_overlap_down_rev_6_7: - h_var_6 - y_grid_var_6 + y_grid_var_7
   - 210 p_down_6_7 <= 0
 non_overlap_up_6_7: h_var_7 - y_grid_var_6 + y_grid_var_7 + 210 p_up_6_7
   <= 210
 non_overlap_up_rev_6_7: - h_var_7 + y_grid_var_6 - y_grid_var_7
   - 210 p_up_6_7 <= 0
 EMIB_non_overlap_any_0_1_0_3: p_EMIB_left_0_1_0_3 + p_EMIB_right_0_1_0_3
   + p_EMIB_down_0_1_0_3 + p_EMIB_up_0_1_0_3 >= 1
 EMIB_non_overlap_left_0_1_0_3: EMIB_w_var_0_1 + EMIB_x_grid_var_0_1
   - EMIB_x_grid_var_0_3 + 210 p_EMIB_left_0_1_0_3 <= 210
 EMIB_non_overlap_left_rev_0_1_0_3: - EMIB_w_var_0_1 - EMIB_x_grid_var_0_1
   + EMIB_x_grid_var_0_3 - 210 p_EMIB_left_0_1_0_3 <= 0
 EMIB_non_overlap_right_0_1_0_3: EMIB_w_var_0_3 - EMIB_x_grid_var_0_1
   + EMIB_x_grid_var_0_3 + 210 p_EMIB_right_0_1_0_3 <= 210
 EMIB_non_overlap_right_rev_0_1_0_3: - EMIB_w_var_0_3 + EMIB_x_grid_var_0_1
   - EMIB_x_grid_var_0_3 - 210 p_EMIB_right_0_1_0_3 <= 0
 EMIB_non_overlap_down_0_1_0_3: EMIB_h_var_0_1 + EMIB_y_grid_var_0_1
   - EMIB_y_grid_var_0_3 + 210 p_EMIB_down_0_1_0_3 <= 210
 EMIB_non_overlap_down_rev_0_1_0_3: - EMIB_h_var_0_1 - EMIB_y_grid_var_0_1
   + EMIB_y_grid_var_0_3 - 210 p_EMIB_down_0_1_0_3 <= 0
 EMIB_non_overlap_up_0_1_0_3: EMIB_h_var_0_3 - EMIB_y_grid_var_0_1
   + EMIB_y_grid_var_0_3 + 210 p_EMIB_up_0_1_0_3 <= 210
 EMIB_non_overlap_up_rev_0_1_0_3: - EMIB_h_var_0_3 + EMIB_y_grid_var_0_1
   - EMIB_y_grid_var_0_3 - 210 p_EMIB_up_0_1_0_3 <= 0
 EMIB_non_overlap_any_0_1_0_4: p_EMIB_left_0_1_0_4 + p_EMIB_right_0_1_0_4
   + p_EMIB_down_0_1_0_4 + p_EMIB_up_0_1_0_4 >= 1
 EMIB_non_overlap_left_0_1_0_4: EMIB_w_var_0_1 + EMIB_x_grid_var_0_1
   - EMIB_x_grid_var_0_4 + 210 p_EMIB_left_0_1_0_4 <= 210
 EMIB_non_overlap_left_rev_0_1_0_4: - EMIB_w_var_0_1 - EMIB_x_grid_var_0_1
   + EMIB_x_grid_var_0_4 - 210 p_EMIB_left_0_1_0_4 <= 0
 EMIB_non_overlap_right_0_1_0_4: EMIB_w_var_0_4 - EMIB_x_grid_var_0_1
   + EMIB_x_grid_var_0_4 + 210 p_EMIB_right_0_1_0_4 <= 210
 EMIB_non_overlap_right_rev_0_1_0_4: - EMIB_w_var_0_4 + EMIB_x_grid_var_0_1
   - EMIB_x_grid_var_0_4 - 210 p_EMIB_right_0_1_0_4 <= 0
 EMIB_non_overlap_down_0_1_0_4: EMIB_h_var_0_1 + EMIB_y_grid_var_0_1
   - EMIB_y_grid_var_0_4 + 210 p_EMIB_down_0_1_0_4 <= 210
 EMIB_non_overlap_down_rev_0_1_0_4: - EMIB_h_var_0_1 - EMIB_y_grid_var_0_1
   + EMIB_y_grid_var_0_4 - 210 p_EMIB_down_0_1_0_4 <= 0
 EMIB_non_overlap_up_0_1_0_4: EMIB_h_var_0_4 - EMIB_y_grid_var_0_1
   + EMIB_y_grid_var_0_4 + 210 p_EMIB_up_0_1_0_4 <= 210
 EMIB_non_overlap_up_rev_0_1_0_4: - EMIB_h_var_0_4 + EMIB_y_grid_var_0_1
   - EMIB_y_grid_var_0_4 - 210 p_EMIB_up_0_1_0_4 <= 0
 EMIB_non_overlap_any_0_1_1_2: p_EMIB_left_0_1_1_2 + p_EMIB_right_0_1_1_2
   + p_EMIB_down_0_1_1_2 + p_EMIB_up_0_1_1_2 >= 1
 EMIB_non_overlap_left_0_1_1_2: EMIB_w_var_0_1 + EMIB_x_grid_var_0_1
   - EMIB_x_grid_var_1_2 + 210 p_EMIB_left_0_1_1_2 <= 210
 EMIB_non_overlap_left_rev_0_1_1_2: - EMIB_w_var_0_1 - EMIB_x_grid_var_0_1
   + EMIB_x_grid_var_1_2 - 210 p_EMIB_left_0_1_1_2 <= 0
 EMIB_non_overlap_right_0_1_1_2: EMIB_w_var_1_2 - EMIB_x_grid_var_0_1
   + EMIB_x_grid_var_1_2 + 210 p_EMIB_right_0_1_1_2 <= 210
 EMIB_non_overlap_right_rev_0_1_1_2: - EMIB_w_var_1_2 + EMIB_x_grid_var_0_1
   - EMIB_x_grid_var_1_2 - 210 p_EMIB_right_0_1_1_2 <= 0
 EMIB_non_overlap_down_0_1_1_2: EMIB_h_var_0_1 + EMIB_y_grid_var_0_1
   - EMIB_y_grid_var_1_2 + 210 p_EMIB_down_0_1_1_2 <= 210
 EMIB_non_overlap_down_rev_0_1_1_2: - EMIB_h_var_0_1 - EMIB_y_grid_var_0_1
   + EMIB_y_grid_var_1_2 - 210 p_EMIB_down_0_1_1_2 <= 0
 EMIB_non_overlap_up_0_1_1_2: EMIB_h_var_1_2 - EMIB_y_grid_var_0_1
   + EMIB_y_grid_var_1_2 + 210 p_EMIB_up_0_1_1_2 <= 210
 EMIB_non_overlap_up_rev_0_1_1_2: - EMIB_h_var_1_2 + EMIB_y_grid_var_0_1
   - EMIB_y_grid_var_1_2 - 210 p_EMIB_up_0_1_1_2 <= 0
 EMIB_non_overlap_any_0_1_1_5: p_EMIB_left_0_1_1_5 + p_EMIB_right_0_1_1_5
   + p_EMIB_down_0_1_1_5 + p_EMIB_up_0_1_1_5 >= 1
 EMIB_non_overlap_left_0_1_1_5: EMIB_w_var_0_1 + EMIB_x_grid_var_0_1
   - EMIB_x_grid_var_1_5 + 210 p_EMIB_left_0_1_1_5 <= 210
 EMIB_non_overlap_left_rev_0_1_1_5: - EMIB_w_var_0_1 - EMIB_x_grid_var_0_1
   + EMIB_x_grid_var_1_5 - 210 p_EMIB_left_0_1_1_5 <= 0
 EMIB_non_overlap_right_0_1_1_5: EMIB_w_var_1_5 - EMIB_x_grid_var_0_1
   + EMIB_x_grid_var_1_5 + 210 p_EMIB_right_0_1_1_5 <= 210
 EMIB_non_overlap_right_rev_0_1_1_5: - EMIB_w_var_1_5 + EMIB_x_grid_var_0_1
   - EMIB_x_grid_var_1_5 - 210 p_EMIB_right_0_1_1_5 <= 0
 EMIB_non_overlap_down_0_1_1_5: EMIB_h_var_0_1 + EMIB_y_grid_var_0_1
   - EMIB_y_grid_var_1_5 + 210 p_EMIB_down_0_1_1_5 <= 210
 EMIB_non_overlap_down_rev_0_1_1_5: - EMIB_h_var_0_1 - EMIB_y_grid_var_0_1
   + EMIB_y_grid_var_1_5 - 210 p_EMIB_down_0_1_1_5 <= 0
 EMIB_non_overlap_up_0_1_1_5: EMIB_h_var_1_5 - EMIB_y_grid_var_0_1
   + EMIB_y_grid_var_1_5 + 210 p_EMIB_up_0_1_1_5 <= 210
 EMIB_non_overlap_up_rev_0_1_1_5: - EMIB_h_var_1_5 + EMIB_y_grid_var_0_1
   - EMIB_y_grid_var_1_5 - 210 p_EMIB_up_0_1_1_5 <= 0
 EMIB_non_overlap_any_0_3_0_4: p_EMIB_left_0_3_0_4 + p_EMIB_right_0_3_0_4
   + p_EMIB_down_0_3_0_4 + p_EMIB_up_0_3_0_4 >= 1
 EMIB_non_overlap_left_0_3_0_4: EMIB_w_var_0_3 + EMIB_x_grid_var_0_3
   - EMIB_x_grid_var_0_4 + 210 p_EMIB_left_0_3_0_4 <= 210
 EMIB_non_overlap_left_rev_0_3_0_4: - EMIB_w_var_0_3 - EMIB_x_grid_var_0_3
   + EMIB_x_grid_var_0_4 - 210 p_EMIB_left_0_3_0_4 <= 0
 EMIB_non_overlap_right_0_3_0_4: EMIB_w_var_0_4 - EMIB_x_grid_var_0_3
   + EMIB_x_grid_var_0_4 + 210 p_EMIB_right_0_3_0_4 <= 210
 EMIB_non_overlap_right_rev_0_3_0_4: - EMIB_w_var_0_4 + EMIB_x_grid_var_0_3
   - EMIB_x_grid_var_0_4 - 210 p_EMIB_right_0_3_0_4 <= 0
 EMIB_non_overlap_down_0_3_0_4: EMIB_h_var_0_3 + EMIB_y_grid_var_0_3
   - EMIB_y_grid_var_0_4 + 210 p_EMIB_down_0_3_0_4 <= 210
 EMIB_non_overlap_down_rev_0_3_0_4: - EMIB_h_var_0_3 - EMIB_y_grid_var_0_3
   + EMIB_y_grid_var_0_4 - 210 p_EMIB_down_0_3_0_4 <= 0
 EMIB_non_overlap_up_0_3_0_4: EMIB_h_var_0_4 - EMIB_y_grid_var_0_3
   + EMIB_y_grid_var_0_4 + 210 p_EMIB_up_0_3_0_4 <= 210
 EMIB_non_overlap_up_rev_0_3_0_4: - EMIB_h_var_0_4 + EMIB_y_grid_var_0_3
   - EMIB_y_grid_var_0_4 - 210 p_EMIB_up_0_3_0_4 <= 0
 EMIB_non_overlap_any_0_3_2_3: p_EMIB_left_0_3_2_3 + p_EMIB_right_0_3_2_3
   + p_EMIB_down_0_3_2_3 + p_EMIB_up_0_3_2_3 >= 1
 EMIB_non_overlap_left_0_3_2_3: EMIB_w_var_0_3 + EMIB_x_grid_var_0_3
   - EMIB_x_grid_var_2_3 + 210 p_EMIB_left_0_3_2_3 <= 210
 EMIB_non_overlap_left_rev_0_3_2_3: - EMIB_w_var_0_3 - EMIB_x_grid_var_0_3
   + EMIB_x_grid_var_2_3 - 210 p_EMIB_left_0_3_2_3 <= 0
 EMIB_non_overlap_right_0_3_2_3: EMIB_w_var_2_3 - EMIB_x_grid_var_0_3
   + EMIB_x_grid_var_2_3 + 210 p_EMIB_right_0_3_2_3 <= 210
 EMIB_non_overlap_right_rev_0_3_2_3: - EMIB_w_var_2_3 + EMIB_x_grid_var_0_3
   - EMIB_x_grid_var_2_3 - 210 p_EMIB_right_0_3_2_3 <= 0
 EMIB_non_overlap_down_0_3_2_3: EMIB_h_var_0_3 + EMIB_y_grid_var_0_3
   - EMIB_y_grid_var_2_3 + 210 p_EMIB_down_0_3_2_3 <= 210
 EMIB_non_overlap_down_rev_0_3_2_3: - EMIB_h_var_0_3 - EMIB_y_grid_var_0_3
   + EMIB_y_grid_var_2_3 - 210 p_EMIB_down_0_3_2_3 <= 0
 EMIB_non_overlap_up_0_3_2_3: EMIB_h_var_2_3 - EMIB_y_grid_var_0_3
   + EMIB_y_grid_var_2_3 + 210 p_EMIB_up_0_3_2_3 <= 210
 EMIB_non_overlap_up_rev_0_3_2_3: - EMIB_h_var_2_3 + EMIB_y_grid_var_0_3
   - EMIB_y_grid_var_2_3 - 210 p_EMIB_up_0_3_2_3 <= 0
 EMIB_non_overlap_any_0_3_3_7: p_EMIB_left_0_3_3_7 + p_EMIB_right_0_3_3_7
   + p_EMIB_down_0_3_3_7 + p_EMIB_up_0_3_3_7 >= 1
 EMIB_non_overlap_left_0_3_3_7: EMIB_w_var_0_3 + EMIB_x_grid_var_0_3
   - EMIB_x_grid_var_3_7 + 210 p_EMIB_left_0_3_3_7 <= 210
 EMIB_non_overlap_left_rev_0_3_3_7: - EMIB_w_var_0_3 - EMIB_x_grid_var_0_3
   + EMIB_x_grid_var_3_7 - 210 p_EMIB_left_0_3_3_7 <= 0
 EMIB_non_overlap_right_0_3_3_7: EMIB_w_var_3_7 - EMIB_x_grid_var_0_3
   + EMIB_x_grid_var_3_7 + 210 p_EMIB_right_0_3_3_7 <= 210
 EMIB_non_overlap_right_rev_0_3_3_7: - EMIB_w_var_3_7 + EMIB_x_grid_var_0_3
   - EMIB_x_grid_var_3_7 - 210 p_EMIB_right_0_3_3_7 <= 0
 EMIB_non_overlap_down_0_3_3_7: EMIB_h_var_0_3 + EMIB_y_grid_var_0_3
   - EMIB_y_grid_var_3_7 + 210 p_EMIB_down_0_3_3_7 <= 210
 EMIB_non_overlap_down_rev_0_3_3_7: - EMIB_h_var_0_3 - EMIB_y_grid_var_0_3
   + EMIB_y_grid_var_3_7 - 210 p_EMIB_down_0_3_3_7 <= 0
 EMIB_non_overlap_up_0_3_3_7: EMIB_h_var_3_7 - EMIB_y_grid_var_0_3
   + EMIB_y_grid_var_3_7 + 210 p_EMIB_up_0_3_3_7 <= 210
 EMIB_non_overlap_up_rev_0_3_3_7: - EMIB_h_var_3_7 + EMIB_y_grid_var_0_3
   - EMIB_y_grid_var_3_7 - 210 p_EMIB_up_0_3_3_7 <= 0
 EMIB_non_overlap_any_1_2_1_5: p_EMIB_left_1_2_1_5 + p_EMIB_right_1_2_1_5
   + p_EMIB_down_1_2_1_5 + p_EMIB_up_1_2_1_5 >= 1
 EMIB_non_overlap_left_1_2_1_5: EMIB_w_var_1_2 + EMIB_x_grid_var_1_2
   - EMIB_x_grid_var_1_5 + 210 p_EMIB_left_1_2_1_5 <= 210
 EMIB_non_overlap_left_rev_1_2_1_5: - EMIB_w_var_1_2 - EMIB_x_grid_var_1_2
   + EMIB_x_grid_var_1_5 - 210 p_EMIB_left_1_2_1_5 <= 0
 EMIB_non_overlap_right_1_2_1_5: EMIB_w_var_1_5 - EMIB_x_grid_var_1_2
   + EMIB_x_grid_var_1_5 + 210 p_EMIB_right_1_2_1_5 <= 210
 EMIB_non_overlap_right_rev_1_2_1_5: - EMIB_w_var_1_5 + EMIB_x_grid_var_1_2
   - EMIB_x_grid_var_1_5 - 210 p_EMIB_right_1_2_1_5 <= 0
 EMIB_non_overlap_down_1_2_1_5: EMIB_h_var_1_2 + EMIB_y_grid_var_1_2
   - EMIB_y_grid_var_1_5 + 210 p_EMIB_down_1_2_1_5 <= 210
 EMIB_non_overlap_down_rev_1_2_1_5: - EMIB_h_var_1_2 - EMIB_y_grid_var_1_2
   + EMIB_y_grid_var_1_5 - 210 p_EMIB_down_1_2_1_5 <= 0
 EMIB_non_overlap_up_1_2_1_5: EMIB_h_var_1_5 - EMIB_y_grid_var_1_2
   + EMIB_y_grid_var_1_5 + 210 p_EMIB_up_1_2_1_5 <= 210
 EMIB_non_overlap_up_rev_1_2_1_5: - EMIB_h_var_1_5 + EMIB_y_grid_var_1_2
   - EMIB_y_grid_var_1_5 - 210 p_EMIB_up_1_2_1_5 <= 0
 EMIB_non_overlap_any_1_2_2_3: p_EMIB_left_1_2_2_3 + p_EMIB_right_1_2_2_3
   + p_EMIB_down_1_2_2_3 + p_EMIB_up_1_2_2_3 >= 1
 EMIB_non_overlap_left_1_2_2_3: EMIB_w_var_1_2 + EMIB_x_grid_var_1_2
   - EMIB_x_grid_var_2_3 + 210 p_EMIB_left_1_2_2_3 <= 210
 EMIB_non_overlap_left_rev_1_2_2_3: - EMIB_w_var_1_2 - EMIB_x_grid_var_1_2
   + EMIB_x_grid_var_2_3 - 210 p_EMIB_left_1_2_2_3 <= 0
 EMIB_non_overlap_right_1_2_2_3: EMIB_w_var_2_3 - EMIB_x_grid_var_1_2
   + EMIB_x_grid_var_2_3 + 210 p_EMIB_right_1_2_2_3 <= 210
 EMIB_non_overlap_right_rev_1_2_2_3: - EMIB_w_var_2_3 + EMIB_x_grid_var_1_2
   - EMIB_x_grid_var_2_3 - 210 p_EMIB_right_1_2_2_3 <= 0
 EMIB_non_overlap_down_1_2_2_3: EMIB_h_var_1_2 + EMIB_y_grid_var_1_2
   - EMIB_y_grid_var_2_3 + 210 p_EMIB_down_1_2_2_3 <= 210
 EMIB_non_overlap_down_rev_1_2_2_3: - EMIB_h_var_1_2 - EMIB_y_grid_var_1_2
   + EMIB_y_grid_var_2_3 - 210 p_EMIB_down_1_2_2_3 <= 0
 EMIB_non_overlap_up_1_2_2_3: EMIB_h_var_2_3 - EMIB_y_grid_var_1_2
   + EMIB_y_grid_var_2_3 + 210 p_EMIB_up_1_2_2_3 <= 210
 EMIB_non_overlap_up_rev_1_2_2_3: - EMIB_h_var_2_3 + EMIB_y_grid_var_1_2
   - EMIB_y_grid_var_2_3 - 210 p_EMIB_up_1_2_2_3 <= 0
 EMIB_non_overlap_any_1_2_2_6: p_EMIB_left_1_2_2_6 + p_EMIB_right_1_2_2_6
   + p_EMIB_down_1_2_2_6 + p_EMIB_up_1_2_2_6 >= 1
 EMIB_non_overlap_left_1_2_2_6: EMIB_w_var_1_2 + EMIB_x_grid_var_1_2
   - EMIB_x_grid_var_2_6 + 210 p_EMIB_left_1_2_2_6 <= 210
 EMIB_non_overlap_left_rev_1_2_2_6: - EMIB_w_var_1_2 - EMIB_x_grid_var_1_2
   + EMIB_x_grid_var_2_6 - 210 p_EMIB_left_1_2_2_6 <= 0
 EMIB_non_overlap_right_1_2_2_6: EMIB_w_var_2_6 - EMIB_x_grid_var_1_2
   + EMIB_x_grid_var_2_6 + 210 p_EMIB_right_1_2_2_6 <= 210
 EMIB_non_overlap_right_rev_1_2_2_6: - EMIB_w_var_2_6 + EMIB_x_grid_var_1_2
   - EMIB_x_grid_var_2_6 - 210 p_EMIB_right_1_2_2_6 <= 0
 EMIB_non_overlap_down_1_2_2_6: EMIB_h_var_1_2 + EMIB_y_grid_var_1_2
   - EMIB_y_grid_var_2_6 + 210 p_EMIB_down_1_2_2_6 <= 210
 EMIB_non_overlap_down_rev_1_2_2_6: - EMIB_h_var_1_2 - EMIB_y_grid_var_1_2
   + EMIB_y_grid_var_2_6 - 210 p_EMIB_down_1_2_2_6 <= 0
 EMIB_non_overlap_up_1_2_2_6: EMIB_h_var_2_6 - EMIB_y_grid_var_1_2
   + EMIB_y_grid_var_2_6 + 210 p_EMIB_up_1_2_2_6 <= 210
 EMIB_non_overlap_up_rev_1_2_2_6: - EMIB_h_var_2_6 + EMIB_y_grid_var_1_2
   - EMIB_y_grid_var_2_6 - 210 p_EMIB_up_1_2_2_6 <= 0
 EMIB_non_overlap_any_2_3_2_6: p_EMIB_left_2_3_2_6 + p_EMIB_right_2_3_2_6
   + p_EMIB_down_2_3_2_6 + p_EMIB_up_2_3_2_6 >= 1
 EMIB_non_overlap_left_2_3_2_6: EMIB_w_var_2_3 + EMIB_x_grid_var_2_3
   - EMIB_x_grid_var_2_6 + 210 p_EMIB_left_2_3_2_6 <= 210
 EMIB_non_overlap_left_rev_2_3_2_6: - EMIB_w_var_2_3 - EMIB_x_grid_var_2_3
   + EMIB_x_grid_var_2_6 - 210 p_EMIB_left_2_3_2_6 <= 0
 EMIB_non_overlap_right_2_3_2_6: EMIB_w_var_2_6 - EMIB_x_grid_var_2_3
   + EMIB_x_grid_var_2_6 + 210 p_EMIB_right_2_3_2_6 <= 210
 EMIB_non_overlap_right_rev_2_3_2_6: - EMIB_w_var_2_6 + EMIB_x_grid_var_2_3
   - EMIB_x_grid_var_2_6 - 210 p_EMIB_right_2_3_2_6 <= 0
 EMIB_non_overlap_down_2_3_2_6: EMIB_h_var_2_3 + EMIB_y_grid_var_2_3
   - EMIB_y_grid_var_2_6 + 210 p_EMIB_down_2_3_2_6 <= 210
 EMIB_non_overlap_down_rev_2_3_2_6: - EMIB_h_var_2_3 - EMIB_y_grid_var_2_3
   + EMIB_y_grid_var_2_6 - 210 p_EMIB_down_2_3_2_6 <= 0
 EMIB_non_overlap_up_2_3_2_6: EMIB_h_var_2_6 - EMIB_y_grid_var_2_3
   + EMIB_y_grid_var_2_6 + 210 p_EMIB_up_2_3_2_6 <= 210
 EMIB_non_overlap_up_rev_2_3_2_6: - EMIB_h_var_2_6 + EMIB_y_grid_var_2_3
   - EMIB_y_grid_var_2_6 - 210 p_EMIB_up_2_3_2_6 <= 0
 EMIB_non_overlap_any_2_3_3_7: p_EMIB_left_2_3_3_7 + p_EMIB_right_2_3_3_7
   + p_EMIB_down_2_3_3_7 + p_EMIB_up_2_3_3_7 >= 1
 EMIB_non_overlap_left_2_3_3_7: EMIB_w_var_2_3 + EMIB_x_grid_var_2_3
   - EMIB_x_grid_var_3_7 + 210 p_EMIB_left_2_3_3_7 <= 210
 EMIB_non_overlap_left_rev_2_3_3_7: - EMIB_w_var_2_3 - EMIB_x_grid_var_2_3
   + EMIB_x_grid_var_3_7 - 210 p_EMIB_left_2_3_3_7 <= 0
 EMIB_non_overlap_right_2_3_3_7: EMIB_w_var_3_7 - EMIB_x_grid_var_2_3
   + EMIB_x_grid_var_3_7 + 210 p_EMIB_right_2_3_3_7 <= 210
 EMIB_non_overlap_right_rev_2_3_3_7: - EMIB_w_var_3_7 + EMIB_x_grid_var_2_3
   - EMIB_x_grid_var_3_7 - 210 p_EMIB_right_2_3_3_7 <= 0
 EMIB_non_overlap_down_2_3_3_7: EMIB_h_var_2_3 + EMIB_y_grid_var_2_3
   - EMIB_y_grid_var_3_7 + 210 p_EMIB_down_2_3_3_7 <= 210
 EMIB_non_overlap_down_rev_2_3_3_7: - EMIB_h_var_2_3 - EMIB_y_grid_var_2_3
   + EMIB_y_grid_var_3_7 - 210 p_EMIB_down_2_3_3_7 <= 0
 EMIB_non_overlap_up_2_3_3_7: EMIB_h_var_3_7 - EMIB_y_grid_var_2_3
   + EMIB_y_grid_var_3_7 + 210 p_EMIB_up_2_3_3_7 <= 210
 EMIB_non_overlap_up_rev_2_3_3_7: - EMIB_h_var_3_7 + EMIB_y_grid_var_2_3
   - EMIB_y_grid_var_3_7 - 210 p_EMIB_up_2_3_3_7 <= 0
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
 bbox_min_x_6: - x_grid_var_6 + bbox_min_x <= 0
 bbox_max_x_6: - w_var_6 - x_grid_var_6 + bbox_max_x >= 0
 bbox_min_y_6: - y_grid_var_6 + bbox_min_y <= 0
 bbox_max_y_6: - h_var_6 - y_grid_var_6 + bbox_max_y >= 0
 bbox_min_x_7: - x_grid_var_7 + bbox_min_x <= 0
 bbox_max_x_7: - w_var_7 - x_grid_var_7 + bbox_max_x >= 0
 bbox_min_y_7: - y_grid_var_7 + bbox_min_y <= 0
 bbox_max_y_7: - h_var_7 - y_grid_var_7 + bbox_max_y >= 0
 bbox_w_def: bbox_min_x - bbox_max_x + bbox_w = 0
 bbox_h_def: bbox_min_y - bbox_max_y + bbox_h = 0
 cx_center_def: cx_center - 0.5 bbox_min_x - 0.5 bbox_max_x = 0
 cy_center_def: cy_center - 0.5 bbox_min_y - 0.5 bbox_max_y = 0
 aspect_ratio_diff_ge_w_minus_h: - bbox_w + bbox_h + aspect_ratio_penalty
   >= 0
 aspect_ratio_diff_ge_h_minus_w: bbox_w - bbox_h + aspect_ratio_penalty
   >= 0
 dx_grid_diff_def_0_1: - cx_grid_var_0 + cx_grid_var_1 + dx_grid_diff_0_1
   = 0
 dx_grid_abs_pair_0_1_abs_ge_orig: dx_grid_abs_pair_0_1 - dx_grid_diff_0_1
   - 210 dx_grid_abs_pair_0_1_is_positive >= -210
 dx_grid_abs_pair_0_1_abs_le_orig: dx_grid_abs_pair_0_1 - dx_grid_diff_0_1
   + 210 dx_grid_abs_pair_0_1_is_positive <= 210
 dx_grid_abs_pair_0_1_abs_ge_neg_orig: dx_grid_abs_pair_0_1
   + dx_grid_diff_0_1 + 210 dx_grid_abs_pair_0_1_is_positive >= 0
 dx_grid_abs_pair_0_1_abs_le_neg_orig: dx_grid_abs_pair_0_1
   + dx_grid_diff_0_1 - 210 dx_grid_abs_pair_0_1_is_positive <= 0
 dx_grid_abs_pair_0_1_force_positive: dx_grid_diff_0_1
   - 210 dx_grid_abs_pair_0_1_is_positive >= -210
 dx_grid_abs_pair_0_1_force_negative: dx_grid_diff_0_1
   - 210 dx_grid_abs_pair_0_1_is_positive <= 0
 dy_grid_diff_def_0_1: - cy_grid_var_0 + cy_grid_var_1 + dy_grid_diff_0_1
   = 0
 dy_grid_abs_pair_0_1_abs_ge_orig: dy_grid_abs_pair_0_1 - dy_grid_diff_0_1
   - 210 dy_grid_abs_pair_0_1_is_positive >= -210
 dy_grid_abs_pair_0_1_abs_le_orig: dy_grid_abs_pair_0_1 - dy_grid_diff_0_1
   + 210 dy_grid_abs_pair_0_1_is_positive <= 210
 dy_grid_abs_pair_0_1_abs_ge_neg_orig: dy_grid_abs_pair_0_1
   + dy_grid_diff_0_1 + 210 dy_grid_abs_pair_0_1_is_positive >= 0
 dy_grid_abs_pair_0_1_abs_le_neg_orig: dy_grid_abs_pair_0_1
   + dy_grid_diff_0_1 - 210 dy_grid_abs_pair_0_1_is_positive <= 0
 dy_grid_abs_pair_0_1_force_positive: dy_grid_diff_0_1
   - 210 dy_grid_abs_pair_0_1_is_positive >= -210
 dy_grid_abs_pair_0_1_force_negative: dy_grid_diff_0_1
   - 210 dy_grid_abs_pair_0_1_is_positive <= 0
 dist_curr_pair_def_0_1: - dx_grid_abs_pair_0_1 - dy_grid_abs_pair_0_1
   + dist_curr_pair_0_1 = 0
 dx_grid_diff_def_0_2: - cx_grid_var_0 + cx_grid_var_2 + dx_grid_diff_0_2
   = 0
 dx_grid_abs_pair_0_2_abs_ge_orig: dx_grid_abs_pair_0_2 - dx_grid_diff_0_2
   - 210 dx_grid_abs_pair_0_2_is_positive >= -210
 dx_grid_abs_pair_0_2_abs_le_orig: dx_grid_abs_pair_0_2 - dx_grid_diff_0_2
   + 210 dx_grid_abs_pair_0_2_is_positive <= 210
 dx_grid_abs_pair_0_2_abs_ge_neg_orig: dx_grid_abs_pair_0_2
   + dx_grid_diff_0_2 + 210 dx_grid_abs_pair_0_2_is_positive >= 0
 dx_grid_abs_pair_0_2_abs_le_neg_orig: dx_grid_abs_pair_0_2
   + dx_grid_diff_0_2 - 210 dx_grid_abs_pair_0_2_is_positive <= 0
 dx_grid_abs_pair_0_2_force_positive: dx_grid_diff_0_2
   - 210 dx_grid_abs_pair_0_2_is_positive >= -210
 dx_grid_abs_pair_0_2_force_negative: dx_grid_diff_0_2
   - 210 dx_grid_abs_pair_0_2_is_positive <= 0
 dy_grid_diff_def_0_2: - cy_grid_var_0 + cy_grid_var_2 + dy_grid_diff_0_2
   = 0
 dy_grid_abs_pair_0_2_abs_ge_orig: dy_grid_abs_pair_0_2 - dy_grid_diff_0_2
   - 210 dy_grid_abs_pair_0_2_is_positive >= -210
 dy_grid_abs_pair_0_2_abs_le_orig: dy_grid_abs_pair_0_2 - dy_grid_diff_0_2
   + 210 dy_grid_abs_pair_0_2_is_positive <= 210
 dy_grid_abs_pair_0_2_abs_ge_neg_orig: dy_grid_abs_pair_0_2
   + dy_grid_diff_0_2 + 210 dy_grid_abs_pair_0_2_is_positive >= 0
 dy_grid_abs_pair_0_2_abs_le_neg_orig: dy_grid_abs_pair_0_2
   + dy_grid_diff_0_2 - 210 dy_grid_abs_pair_0_2_is_positive <= 0
 dy_grid_abs_pair_0_2_force_positive: dy_grid_diff_0_2
   - 210 dy_grid_abs_pair_0_2_is_positive >= -210
 dy_grid_abs_pair_0_2_force_negative: dy_grid_diff_0_2
   - 210 dy_grid_abs_pair_0_2_is_positive <= 0
 dist_curr_pair_def_0_2: - dx_grid_abs_pair_0_2 - dy_grid_abs_pair_0_2
   + dist_curr_pair_0_2 = 0
 dx_grid_diff_def_0_3: - cx_grid_var_0 + cx_grid_var_3 + dx_grid_diff_0_3
   = 0
 dx_grid_abs_pair_0_3_abs_ge_orig: dx_grid_abs_pair_0_3 - dx_grid_diff_0_3
   - 210 dx_grid_abs_pair_0_3_is_positive >= -210
 dx_grid_abs_pair_0_3_abs_le_orig: dx_grid_abs_pair_0_3 - dx_grid_diff_0_3
   + 210 dx_grid_abs_pair_0_3_is_positive <= 210
 dx_grid_abs_pair_0_3_abs_ge_neg_orig: dx_grid_abs_pair_0_3
   + dx_grid_diff_0_3 + 210 dx_grid_abs_pair_0_3_is_positive >= 0
 dx_grid_abs_pair_0_3_abs_le_neg_orig: dx_grid_abs_pair_0_3
   + dx_grid_diff_0_3 - 210 dx_grid_abs_pair_0_3_is_positive <= 0
 dx_grid_abs_pair_0_3_force_positive: dx_grid_diff_0_3
   - 210 dx_grid_abs_pair_0_3_is_positive >= -210
 dx_grid_abs_pair_0_3_force_negative: dx_grid_diff_0_3
   - 210 dx_grid_abs_pair_0_3_is_positive <= 0
 dy_grid_diff_def_0_3: - cy_grid_var_0 + cy_grid_var_3 + dy_grid_diff_0_3
   = 0
 dy_grid_abs_pair_0_3_abs_ge_orig: dy_grid_abs_pair_0_3 - dy_grid_diff_0_3
   - 210 dy_grid_abs_pair_0_3_is_positive >= -210
 dy_grid_abs_pair_0_3_abs_le_orig: dy_grid_abs_pair_0_3 - dy_grid_diff_0_3
   + 210 dy_grid_abs_pair_0_3_is_positive <= 210
 dy_grid_abs_pair_0_3_abs_ge_neg_orig: dy_grid_abs_pair_0_3
   + dy_grid_diff_0_3 + 210 dy_grid_abs_pair_0_3_is_positive >= 0
 dy_grid_abs_pair_0_3_abs_le_neg_orig: dy_grid_abs_pair_0_3
   + dy_grid_diff_0_3 - 210 dy_grid_abs_pair_0_3_is_positive <= 0
 dy_grid_abs_pair_0_3_force_positive: dy_grid_diff_0_3
   - 210 dy_grid_abs_pair_0_3_is_positive >= -210
 dy_grid_abs_pair_0_3_force_negative: dy_grid_diff_0_3
   - 210 dy_grid_abs_pair_0_3_is_positive <= 0
 dist_curr_pair_def_0_3: - dx_grid_abs_pair_0_3 - dy_grid_abs_pair_0_3
   + dist_curr_pair_0_3 = 0
 dx_grid_diff_def_1_2: - cx_grid_var_1 + cx_grid_var_2 + dx_grid_diff_1_2
   = 0
 dx_grid_abs_pair_1_2_abs_ge_orig: dx_grid_abs_pair_1_2 - dx_grid_diff_1_2
   - 210 dx_grid_abs_pair_1_2_is_positive >= -210
 dx_grid_abs_pair_1_2_abs_le_orig: dx_grid_abs_pair_1_2 - dx_grid_diff_1_2
   + 210 dx_grid_abs_pair_1_2_is_positive <= 210
 dx_grid_abs_pair_1_2_abs_ge_neg_orig: dx_grid_abs_pair_1_2
   + dx_grid_diff_1_2 + 210 dx_grid_abs_pair_1_2_is_positive >= 0
 dx_grid_abs_pair_1_2_abs_le_neg_orig: dx_grid_abs_pair_1_2
   + dx_grid_diff_1_2 - 210 dx_grid_abs_pair_1_2_is_positive <= 0
 dx_grid_abs_pair_1_2_force_positive: dx_grid_diff_1_2
   - 210 dx_grid_abs_pair_1_2_is_positive >= -210
 dx_grid_abs_pair_1_2_force_negative: dx_grid_diff_1_2
   - 210 dx_grid_abs_pair_1_2_is_positive <= 0
 dy_grid_diff_def_1_2: - cy_grid_var_1 + cy_grid_var_2 + dy_grid_diff_1_2
   = 0
 dy_grid_abs_pair_1_2_abs_ge_orig: dy_grid_abs_pair_1_2 - dy_grid_diff_1_2
   - 210 dy_grid_abs_pair_1_2_is_positive >= -210
 dy_grid_abs_pair_1_2_abs_le_orig: dy_grid_abs_pair_1_2 - dy_grid_diff_1_2
   + 210 dy_grid_abs_pair_1_2_is_positive <= 210
 dy_grid_abs_pair_1_2_abs_ge_neg_orig: dy_grid_abs_pair_1_2
   + dy_grid_diff_1_2 + 210 dy_grid_abs_pair_1_2_is_positive >= 0
 dy_grid_abs_pair_1_2_abs_le_neg_orig: dy_grid_abs_pair_1_2
   + dy_grid_diff_1_2 - 210 dy_grid_abs_pair_1_2_is_positive <= 0
 dy_grid_abs_pair_1_2_force_positive: dy_grid_diff_1_2
   - 210 dy_grid_abs_pair_1_2_is_positive >= -210
 dy_grid_abs_pair_1_2_force_negative: dy_grid_diff_1_2
   - 210 dy_grid_abs_pair_1_2_is_positive <= 0
 dist_curr_pair_def_1_2: - dx_grid_abs_pair_1_2 - dy_grid_abs_pair_1_2
   + dist_curr_pair_1_2 = 0
 dx_grid_diff_def_1_3: - cx_grid_var_1 + cx_grid_var_3 + dx_grid_diff_1_3
   = 0
 dx_grid_abs_pair_1_3_abs_ge_orig: dx_grid_abs_pair_1_3 - dx_grid_diff_1_3
   - 210 dx_grid_abs_pair_1_3_is_positive >= -210
 dx_grid_abs_pair_1_3_abs_le_orig: dx_grid_abs_pair_1_3 - dx_grid_diff_1_3
   + 210 dx_grid_abs_pair_1_3_is_positive <= 210
 dx_grid_abs_pair_1_3_abs_ge_neg_orig: dx_grid_abs_pair_1_3
   + dx_grid_diff_1_3 + 210 dx_grid_abs_pair_1_3_is_positive >= 0
 dx_grid_abs_pair_1_3_abs_le_neg_orig: dx_grid_abs_pair_1_3
   + dx_grid_diff_1_3 - 210 dx_grid_abs_pair_1_3_is_positive <= 0
 dx_grid_abs_pair_1_3_force_positive: dx_grid_diff_1_3
   - 210 dx_grid_abs_pair_1_3_is_positive >= -210
 dx_grid_abs_pair_1_3_force_negative: dx_grid_diff_1_3
   - 210 dx_grid_abs_pair_1_3_is_positive <= 0
 dy_grid_diff_def_1_3: - cy_grid_var_1 + cy_grid_var_3 + dy_grid_diff_1_3
   = 0
 dy_grid_abs_pair_1_3_abs_ge_orig: dy_grid_abs_pair_1_3 - dy_grid_diff_1_3
   - 210 dy_grid_abs_pair_1_3_is_positive >= -210
 dy_grid_abs_pair_1_3_abs_le_orig: dy_grid_abs_pair_1_3 - dy_grid_diff_1_3
   + 210 dy_grid_abs_pair_1_3_is_positive <= 210
 dy_grid_abs_pair_1_3_abs_ge_neg_orig: dy_grid_abs_pair_1_3
   + dy_grid_diff_1_3 + 210 dy_grid_abs_pair_1_3_is_positive >= 0
 dy_grid_abs_pair_1_3_abs_le_neg_orig: dy_grid_abs_pair_1_3
   + dy_grid_diff_1_3 - 210 dy_grid_abs_pair_1_3_is_positive <= 0
 dy_grid_abs_pair_1_3_force_positive: dy_grid_diff_1_3
   - 210 dy_grid_abs_pair_1_3_is_positive >= -210
 dy_grid_abs_pair_1_3_force_negative: dy_grid_diff_1_3
   - 210 dy_grid_abs_pair_1_3_is_positive <= 0
 dist_curr_pair_def_1_3: - dx_grid_abs_pair_1_3 - dy_grid_abs_pair_1_3
   + dist_curr_pair_1_3 = 0
 dx_grid_diff_def_2_3: - cx_grid_var_2 + cx_grid_var_3 + dx_grid_diff_2_3
   = 0
 dx_grid_abs_pair_2_3_abs_ge_orig: dx_grid_abs_pair_2_3 - dx_grid_diff_2_3
   - 210 dx_grid_abs_pair_2_3_is_positive >= -210
 dx_grid_abs_pair_2_3_abs_le_orig: dx_grid_abs_pair_2_3 - dx_grid_diff_2_3
   + 210 dx_grid_abs_pair_2_3_is_positive <= 210
 dx_grid_abs_pair_2_3_abs_ge_neg_orig: dx_grid_abs_pair_2_3
   + dx_grid_diff_2_3 + 210 dx_grid_abs_pair_2_3_is_positive >= 0
 dx_grid_abs_pair_2_3_abs_le_neg_orig: dx_grid_abs_pair_2_3
   + dx_grid_diff_2_3 - 210 dx_grid_abs_pair_2_3_is_positive <= 0
 dx_grid_abs_pair_2_3_force_positive: dx_grid_diff_2_3
   - 210 dx_grid_abs_pair_2_3_is_positive >= -210
 dx_grid_abs_pair_2_3_force_negative: dx_grid_diff_2_3
   - 210 dx_grid_abs_pair_2_3_is_positive <= 0
 dy_grid_diff_def_2_3: - cy_grid_var_2 + cy_grid_var_3 + dy_grid_diff_2_3
   = 0
 dy_grid_abs_pair_2_3_abs_ge_orig: dy_grid_abs_pair_2_3 - dy_grid_diff_2_3
   - 210 dy_grid_abs_pair_2_3_is_positive >= -210
 dy_grid_abs_pair_2_3_abs_le_orig: dy_grid_abs_pair_2_3 - dy_grid_diff_2_3
   + 210 dy_grid_abs_pair_2_3_is_positive <= 210
 dy_grid_abs_pair_2_3_abs_ge_neg_orig: dy_grid_abs_pair_2_3
   + dy_grid_diff_2_3 + 210 dy_grid_abs_pair_2_3_is_positive >= 0
 dy_grid_abs_pair_2_3_abs_le_neg_orig: dy_grid_abs_pair_2_3
   + dy_grid_diff_2_3 - 210 dy_grid_abs_pair_2_3_is_positive <= 0
 dy_grid_abs_pair_2_3_force_positive: dy_grid_diff_2_3
   - 210 dy_grid_abs_pair_2_3_is_positive >= -210
 dy_grid_abs_pair_2_3_force_negative: dy_grid_diff_2_3
   - 210 dy_grid_abs_pair_2_3_is_positive <= 0
 dist_curr_pair_def_2_3: - dx_grid_abs_pair_2_3 - dy_grid_abs_pair_2_3
   + dist_curr_pair_2_3 = 0
 dx_center_diff_def_0: - cx_grid_var_0 + cx_center + dx_center_diff_0 = 0
 dx_center_abs_0_abs_ge_orig: - dx_center_diff_0 + dx_center_abs_0
   - 210 dx_center_abs_0_is_positive >= -210
 dx_center_abs_0_abs_le_orig: - dx_center_diff_0 + dx_center_abs_0
   + 210 dx_center_abs_0_is_positive <= 210
 dx_center_abs_0_abs_ge_neg_orig: dx_center_diff_0 + dx_center_abs_0
   + 210 dx_center_abs_0_is_positive >= 0
 dx_center_abs_0_abs_le_neg_orig: dx_center_diff_0 + dx_center_abs_0
   - 210 dx_center_abs_0_is_positive <= 0
 dx_center_abs_0_force_positive: dx_center_diff_0
   - 210 dx_center_abs_0_is_positive >= -210
 dx_center_abs_0_force_negative: dx_center_diff_0
   - 210 dx_center_abs_0_is_positive <= 0
 dy_center_diff_def_0: - cy_grid_var_0 + cy_center + dy_center_diff_0 = 0
 dy_center_abs_0_abs_ge_orig: - dy_center_diff_0 + dy_center_abs_0
   - 210 dy_center_abs_0_is_positive >= -210
 dy_center_abs_0_abs_le_orig: - dy_center_diff_0 + dy_center_abs_0
   + 210 dy_center_abs_0_is_positive <= 210
 dy_center_abs_0_abs_ge_neg_orig: dy_center_diff_0 + dy_center_abs_0
   + 210 dy_center_abs_0_is_positive >= 0
 dy_center_abs_0_abs_le_neg_orig: dy_center_diff_0 + dy_center_abs_0
   - 210 dy_center_abs_0_is_positive <= 0
 dy_center_abs_0_force_positive: dy_center_diff_0
   - 210 dy_center_abs_0_is_positive >= -210
 dy_center_abs_0_force_negative: dy_center_diff_0
   - 210 dy_center_abs_0_is_positive <= 0
 dist_center_def_0: - dx_center_abs_0 - dy_center_abs_0 + dist_center_0
   = 0
 dx_center_diff_def_1: - cx_grid_var_1 + cx_center + dx_center_diff_1 = 0
 dx_center_abs_1_abs_ge_orig: - dx_center_diff_1 + dx_center_abs_1
   - 210 dx_center_abs_1_is_positive >= -210
 dx_center_abs_1_abs_le_orig: - dx_center_diff_1 + dx_center_abs_1
   + 210 dx_center_abs_1_is_positive <= 210
 dx_center_abs_1_abs_ge_neg_orig: dx_center_diff_1 + dx_center_abs_1
   + 210 dx_center_abs_1_is_positive >= 0
 dx_center_abs_1_abs_le_neg_orig: dx_center_diff_1 + dx_center_abs_1
   - 210 dx_center_abs_1_is_positive <= 0
 dx_center_abs_1_force_positive: dx_center_diff_1
   - 210 dx_center_abs_1_is_positive >= -210
 dx_center_abs_1_force_negative: dx_center_diff_1
   - 210 dx_center_abs_1_is_positive <= 0
 dy_center_diff_def_1: - cy_grid_var_1 + cy_center + dy_center_diff_1 = 0
 dy_center_abs_1_abs_ge_orig: - dy_center_diff_1 + dy_center_abs_1
   - 210 dy_center_abs_1_is_positive >= -210
 dy_center_abs_1_abs_le_orig: - dy_center_diff_1 + dy_center_abs_1
   + 210 dy_center_abs_1_is_positive <= 210
 dy_center_abs_1_abs_ge_neg_orig: dy_center_diff_1 + dy_center_abs_1
   + 210 dy_center_abs_1_is_positive >= 0
 dy_center_abs_1_abs_le_neg_orig: dy_center_diff_1 + dy_center_abs_1
   - 210 dy_center_abs_1_is_positive <= 0
 dy_center_abs_1_force_positive: dy_center_diff_1
   - 210 dy_center_abs_1_is_positive >= -210
 dy_center_abs_1_force_negative: dy_center_diff_1
   - 210 dy_center_abs_1_is_positive <= 0
 dist_center_def_1: - dx_center_abs_1 - dy_center_abs_1 + dist_center_1
   = 0
 dx_center_diff_def_2: - cx_grid_var_2 + cx_center + dx_center_diff_2 = 0
 dx_center_abs_2_abs_ge_orig: - dx_center_diff_2 + dx_center_abs_2
   - 210 dx_center_abs_2_is_positive >= -210
 dx_center_abs_2_abs_le_orig: - dx_center_diff_2 + dx_center_abs_2
   + 210 dx_center_abs_2_is_positive <= 210
 dx_center_abs_2_abs_ge_neg_orig: dx_center_diff_2 + dx_center_abs_2
   + 210 dx_center_abs_2_is_positive >= 0
 dx_center_abs_2_abs_le_neg_orig: dx_center_diff_2 + dx_center_abs_2
   - 210 dx_center_abs_2_is_positive <= 0
 dx_center_abs_2_force_positive: dx_center_diff_2
   - 210 dx_center_abs_2_is_positive >= -210
 dx_center_abs_2_force_negative: dx_center_diff_2
   - 210 dx_center_abs_2_is_positive <= 0
 dy_center_diff_def_2: - cy_grid_var_2 + cy_center + dy_center_diff_2 = 0
 dy_center_abs_2_abs_ge_orig: - dy_center_diff_2 + dy_center_abs_2
   - 210 dy_center_abs_2_is_positive >= -210
 dy_center_abs_2_abs_le_orig: - dy_center_diff_2 + dy_center_abs_2
   + 210 dy_center_abs_2_is_positive <= 210
 dy_center_abs_2_abs_ge_neg_orig: dy_center_diff_2 + dy_center_abs_2
   + 210 dy_center_abs_2_is_positive >= 0
 dy_center_abs_2_abs_le_neg_orig: dy_center_diff_2 + dy_center_abs_2
   - 210 dy_center_abs_2_is_positive <= 0
 dy_center_abs_2_force_positive: dy_center_diff_2
   - 210 dy_center_abs_2_is_positive >= -210
 dy_center_abs_2_force_negative: dy_center_diff_2
   - 210 dy_center_abs_2_is_positive <= 0
 dist_center_def_2: - dx_center_abs_2 - dy_center_abs_2 + dist_center_2
   = 0
 dx_center_diff_def_3: - cx_grid_var_3 + cx_center + dx_center_diff_3 = 0
 dx_center_abs_3_abs_ge_orig: - dx_center_diff_3 + dx_center_abs_3
   - 210 dx_center_abs_3_is_positive >= -210
 dx_center_abs_3_abs_le_orig: - dx_center_diff_3 + dx_center_abs_3
   + 210 dx_center_abs_3_is_positive <= 210
 dx_center_abs_3_abs_ge_neg_orig: dx_center_diff_3 + dx_center_abs_3
   + 210 dx_center_abs_3_is_positive >= 0
 dx_center_abs_3_abs_le_neg_orig: dx_center_diff_3 + dx_center_abs_3
   - 210 dx_center_abs_3_is_positive <= 0
 dx_center_abs_3_force_positive: dx_center_diff_3
   - 210 dx_center_abs_3_is_positive >= -210
 dx_center_abs_3_force_negative: dx_center_diff_3
   - 210 dx_center_abs_3_is_positive <= 0
 dy_center_diff_def_3: - cy_grid_var_3 + cy_center + dy_center_diff_3 = 0
 dy_center_abs_3_abs_ge_orig: - dy_center_diff_3 + dy_center_abs_3
   - 210 dy_center_abs_3_is_positive >= -210
 dy_center_abs_3_abs_le_orig: - dy_center_diff_3 + dy_center_abs_3
   + 210 dy_center_abs_3_is_positive <= 210
 dy_center_abs_3_abs_ge_neg_orig: dy_center_diff_3 + dy_center_abs_3
   + 210 dy_center_abs_3_is_positive >= 0
 dy_center_abs_3_abs_le_neg_orig: dy_center_diff_3 + dy_center_abs_3
   - 210 dy_center_abs_3_is_positive <= 0
 dy_center_abs_3_force_positive: dy_center_diff_3
   - 210 dy_center_abs_3_is_positive >= -210
 dy_center_abs_3_force_negative: dy_center_diff_3
   - 210 dy_center_abs_3_is_positive <= 0
 dist_center_def_3: - dx_center_abs_3 - dy_center_abs_3 + dist_center_3
   = 0
 power_aware_penalty_def: power_aware_penalty - 22500 dist_curr_pair_0_1
   - 22500 dist_curr_pair_0_2 - 22500 dist_curr_pair_0_3
   - 22500 dist_curr_pair_1_2 - 22500 dist_curr_pair_1_3
   - 22500 dist_curr_pair_2_3 - 22500 dist_center_0 - 22500 dist_center_1
   - 22500 dist_center_2 - 22500 dist_center_3 = 0
 dx_diff_def_i_0_1: EMIB_cx_grid_var_0_1 - cx_grid_var_0 + dx_diff_i_0_1
   = 0
 dx_diff_def_j_0_1: EMIB_cx_grid_var_0_1 - cx_grid_var_1 + dx_diff_j_0_1
   = 0
 dy_diff_def_i_0_1: EMIB_cy_grid_var_0_1 - cy_grid_var_0 + dy_diff_i_0_1
   = 0
 dy_diff_def_j_0_1: EMIB_cy_grid_var_0_1 - cy_grid_var_1 + dy_diff_j_0_1
   = 0
 dx_abs_i_0_1_abs_ge_orig: dx_abs_i_0_1 - dx_diff_i_0_1
   - 210 dx_abs_i_0_1_is_positive >= -210
 dx_abs_i_0_1_abs_le_orig: dx_abs_i_0_1 - dx_diff_i_0_1
   + 210 dx_abs_i_0_1_is_positive <= 210
 dx_abs_i_0_1_abs_ge_neg_orig: dx_abs_i_0_1 + dx_diff_i_0_1
   + 210 dx_abs_i_0_1_is_positive >= 0
 dx_abs_i_0_1_abs_le_neg_orig: dx_abs_i_0_1 + dx_diff_i_0_1
   - 210 dx_abs_i_0_1_is_positive <= 0
 dx_abs_i_0_1_force_positive: dx_diff_i_0_1 - 210 dx_abs_i_0_1_is_positive
   >= -210
 dx_abs_i_0_1_force_negative: dx_diff_i_0_1 - 210 dx_abs_i_0_1_is_positive
   <= 0
 dy_abs_i_0_1_abs_ge_orig: dy_abs_i_0_1 - dy_diff_i_0_1
   - 210 dy_abs_i_0_1_is_positive >= -210
 dy_abs_i_0_1_abs_le_orig: dy_abs_i_0_1 - dy_diff_i_0_1
   + 210 dy_abs_i_0_1_is_positive <= 210
 dy_abs_i_0_1_abs_ge_neg_orig: dy_abs_i_0_1 + dy_diff_i_0_1
   + 210 dy_abs_i_0_1_is_positive >= 0
 dy_abs_i_0_1_abs_le_neg_orig: dy_abs_i_0_1 + dy_diff_i_0_1
   - 210 dy_abs_i_0_1_is_positive <= 0
 dy_abs_i_0_1_force_positive: dy_diff_i_0_1 - 210 dy_abs_i_0_1_is_positive
   >= -210
 dy_abs_i_0_1_force_negative: dy_diff_i_0_1 - 210 dy_abs_i_0_1_is_positive
   <= 0
 dx_abs_j_0_1_abs_ge_orig: dx_abs_j_0_1 - dx_diff_j_0_1
   - 210 dx_abs_j_0_1_is_positive >= -210
 dx_abs_j_0_1_abs_le_orig: dx_abs_j_0_1 - dx_diff_j_0_1
   + 210 dx_abs_j_0_1_is_positive <= 210
 dx_abs_j_0_1_abs_ge_neg_orig: dx_abs_j_0_1 + dx_diff_j_0_1
   + 210 dx_abs_j_0_1_is_positive >= 0
 dx_abs_j_0_1_abs_le_neg_orig: dx_abs_j_0_1 + dx_diff_j_0_1
   - 210 dx_abs_j_0_1_is_positive <= 0
 dx_abs_j_0_1_force_positive: dx_diff_j_0_1 - 210 dx_abs_j_0_1_is_positive
   >= -210
 dx_abs_j_0_1_force_negative: dx_diff_j_0_1 - 210 dx_abs_j_0_1_is_positive
   <= 0
 dy_abs_j_0_1_abs_ge_orig: dy_abs_j_0_1 - dy_diff_j_0_1
   - 210 dy_abs_j_0_1_is_positive >= -210
 dy_abs_j_0_1_abs_le_orig: dy_abs_j_0_1 - dy_diff_j_0_1
   + 210 dy_abs_j_0_1_is_positive <= 210
 dy_abs_j_0_1_abs_ge_neg_orig: dy_abs_j_0_1 + dy_diff_j_0_1
   + 210 dy_abs_j_0_1_is_positive >= 0
 dy_abs_j_0_1_abs_le_neg_orig: dy_abs_j_0_1 + dy_diff_j_0_1
   - 210 dy_abs_j_0_1_is_positive <= 0
 dy_abs_j_0_1_force_positive: dy_diff_j_0_1 - 210 dy_abs_j_0_1_is_positive
   >= -210
 dy_abs_j_0_1_force_negative: dy_diff_j_0_1 - 210 dy_abs_j_0_1_is_positive
   <= 0
 dx_diff_def_i_0_3: EMIB_cx_grid_var_0_3 - cx_grid_var_0 + dx_diff_i_0_3
   = 0
 dx_diff_def_j_0_3: EMIB_cx_grid_var_0_3 - cx_grid_var_3 + dx_diff_j_0_3
   = 0
 dy_diff_def_i_0_3: EMIB_cy_grid_var_0_3 - cy_grid_var_0 + dy_diff_i_0_3
   = 0
 dy_diff_def_j_0_3: EMIB_cy_grid_var_0_3 - cy_grid_var_3 + dy_diff_j_0_3
   = 0
 dx_abs_i_0_3_abs_ge_orig: dx_abs_i_0_3 - dx_diff_i_0_3
   - 210 dx_abs_i_0_3_is_positive >= -210
 dx_abs_i_0_3_abs_le_orig: dx_abs_i_0_3 - dx_diff_i_0_3
   + 210 dx_abs_i_0_3_is_positive <= 210
 dx_abs_i_0_3_abs_ge_neg_orig: dx_abs_i_0_3 + dx_diff_i_0_3
   + 210 dx_abs_i_0_3_is_positive >= 0
 dx_abs_i_0_3_abs_le_neg_orig: dx_abs_i_0_3 + dx_diff_i_0_3
   - 210 dx_abs_i_0_3_is_positive <= 0
 dx_abs_i_0_3_force_positive: dx_diff_i_0_3 - 210 dx_abs_i_0_3_is_positive
   >= -210
 dx_abs_i_0_3_force_negative: dx_diff_i_0_3 - 210 dx_abs_i_0_3_is_positive
   <= 0
 dy_abs_i_0_3_abs_ge_orig: dy_abs_i_0_3 - dy_diff_i_0_3
   - 210 dy_abs_i_0_3_is_positive >= -210
 dy_abs_i_0_3_abs_le_orig: dy_abs_i_0_3 - dy_diff_i_0_3
   + 210 dy_abs_i_0_3_is_positive <= 210
 dy_abs_i_0_3_abs_ge_neg_orig: dy_abs_i_0_3 + dy_diff_i_0_3
   + 210 dy_abs_i_0_3_is_positive >= 0
 dy_abs_i_0_3_abs_le_neg_orig: dy_abs_i_0_3 + dy_diff_i_0_3
   - 210 dy_abs_i_0_3_is_positive <= 0
 dy_abs_i_0_3_force_positive: dy_diff_i_0_3 - 210 dy_abs_i_0_3_is_positive
   >= -210
 dy_abs_i_0_3_force_negative: dy_diff_i_0_3 - 210 dy_abs_i_0_3_is_positive
   <= 0
 dx_abs_j_0_3_abs_ge_orig: dx_abs_j_0_3 - dx_diff_j_0_3
   - 210 dx_abs_j_0_3_is_positive >= -210
 dx_abs_j_0_3_abs_le_orig: dx_abs_j_0_3 - dx_diff_j_0_3
   + 210 dx_abs_j_0_3_is_positive <= 210
 dx_abs_j_0_3_abs_ge_neg_orig: dx_abs_j_0_3 + dx_diff_j_0_3
   + 210 dx_abs_j_0_3_is_positive >= 0
 dx_abs_j_0_3_abs_le_neg_orig: dx_abs_j_0_3 + dx_diff_j_0_3
   - 210 dx_abs_j_0_3_is_positive <= 0
 dx_abs_j_0_3_force_positive: dx_diff_j_0_3 - 210 dx_abs_j_0_3_is_positive
   >= -210
 dx_abs_j_0_3_force_negative: dx_diff_j_0_3 - 210 dx_abs_j_0_3_is_positive
   <= 0
 dy_abs_j_0_3_abs_ge_orig: dy_abs_j_0_3 - dy_diff_j_0_3
   - 210 dy_abs_j_0_3_is_positive >= -210
 dy_abs_j_0_3_abs_le_orig: dy_abs_j_0_3 - dy_diff_j_0_3
   + 210 dy_abs_j_0_3_is_positive <= 210
 dy_abs_j_0_3_abs_ge_neg_orig: dy_abs_j_0_3 + dy_diff_j_0_3
   + 210 dy_abs_j_0_3_is_positive >= 0
 dy_abs_j_0_3_abs_le_neg_orig: dy_abs_j_0_3 + dy_diff_j_0_3
   - 210 dy_abs_j_0_3_is_positive <= 0
 dy_abs_j_0_3_force_positive: dy_diff_j_0_3 - 210 dy_abs_j_0_3_is_positive
   >= -210
 dy_abs_j_0_3_force_negative: dy_diff_j_0_3 - 210 dy_abs_j_0_3_is_positive
   <= 0
 dx_diff_def_i_0_4: EMIB_cx_grid_var_0_4 - cx_grid_var_0 + dx_diff_i_0_4
   = 0
 dx_diff_def_j_0_4: EMIB_cx_grid_var_0_4 - cx_grid_var_4 + dx_diff_j_0_4
   = 0
 dy_diff_def_i_0_4: EMIB_cy_grid_var_0_4 - cy_grid_var_0 + dy_diff_i_0_4
   = 0
 dy_diff_def_j_0_4: EMIB_cy_grid_var_0_4 - cy_grid_var_4 + dy_diff_j_0_4
   = 0
 dx_abs_i_0_4_abs_ge_orig: dx_abs_i_0_4 - dx_diff_i_0_4
   - 210 dx_abs_i_0_4_is_positive >= -210
 dx_abs_i_0_4_abs_le_orig: dx_abs_i_0_4 - dx_diff_i_0_4
   + 210 dx_abs_i_0_4_is_positive <= 210
 dx_abs_i_0_4_abs_ge_neg_orig: dx_abs_i_0_4 + dx_diff_i_0_4
   + 210 dx_abs_i_0_4_is_positive >= 0
 dx_abs_i_0_4_abs_le_neg_orig: dx_abs_i_0_4 + dx_diff_i_0_4
   - 210 dx_abs_i_0_4_is_positive <= 0
 dx_abs_i_0_4_force_positive: dx_diff_i_0_4 - 210 dx_abs_i_0_4_is_positive
   >= -210
 dx_abs_i_0_4_force_negative: dx_diff_i_0_4 - 210 dx_abs_i_0_4_is_positive
   <= 0
 dy_abs_i_0_4_abs_ge_orig: dy_abs_i_0_4 - dy_diff_i_0_4
   - 210 dy_abs_i_0_4_is_positive >= -210
 dy_abs_i_0_4_abs_le_orig: dy_abs_i_0_4 - dy_diff_i_0_4
   + 210 dy_abs_i_0_4_is_positive <= 210
 dy_abs_i_0_4_abs_ge_neg_orig: dy_abs_i_0_4 + dy_diff_i_0_4
   + 210 dy_abs_i_0_4_is_positive >= 0
 dy_abs_i_0_4_abs_le_neg_orig: dy_abs_i_0_4 + dy_diff_i_0_4
   - 210 dy_abs_i_0_4_is_positive <= 0
 dy_abs_i_0_4_force_positive: dy_diff_i_0_4 - 210 dy_abs_i_0_4_is_positive
   >= -210
 dy_abs_i_0_4_force_negative: dy_diff_i_0_4 - 210 dy_abs_i_0_4_is_positive
   <= 0
 dx_abs_j_0_4_abs_ge_orig: dx_abs_j_0_4 - dx_diff_j_0_4
   - 210 dx_abs_j_0_4_is_positive >= -210
 dx_abs_j_0_4_abs_le_orig: dx_abs_j_0_4 - dx_diff_j_0_4
   + 210 dx_abs_j_0_4_is_positive <= 210
 dx_abs_j_0_4_abs_ge_neg_orig: dx_abs_j_0_4 + dx_diff_j_0_4
   + 210 dx_abs_j_0_4_is_positive >= 0
 dx_abs_j_0_4_abs_le_neg_orig: dx_abs_j_0_4 + dx_diff_j_0_4
   - 210 dx_abs_j_0_4_is_positive <= 0
 dx_abs_j_0_4_force_positive: dx_diff_j_0_4 - 210 dx_abs_j_0_4_is_positive
   >= -210
 dx_abs_j_0_4_force_negative: dx_diff_j_0_4 - 210 dx_abs_j_0_4_is_positive
   <= 0
 dy_abs_j_0_4_abs_ge_orig: dy_abs_j_0_4 - dy_diff_j_0_4
   - 210 dy_abs_j_0_4_is_positive >= -210
 dy_abs_j_0_4_abs_le_orig: dy_abs_j_0_4 - dy_diff_j_0_4
   + 210 dy_abs_j_0_4_is_positive <= 210
 dy_abs_j_0_4_abs_ge_neg_orig: dy_abs_j_0_4 + dy_diff_j_0_4
   + 210 dy_abs_j_0_4_is_positive >= 0
 dy_abs_j_0_4_abs_le_neg_orig: dy_abs_j_0_4 + dy_diff_j_0_4
   - 210 dy_abs_j_0_4_is_positive <= 0
 dy_abs_j_0_4_force_positive: dy_diff_j_0_4 - 210 dy_abs_j_0_4_is_positive
   >= -210
 dy_abs_j_0_4_force_negative: dy_diff_j_0_4 - 210 dy_abs_j_0_4_is_positive
   <= 0
 dx_diff_def_i_1_2: EMIB_cx_grid_var_1_2 - cx_grid_var_1 + dx_diff_i_1_2
   = 0
 dx_diff_def_j_1_2: EMIB_cx_grid_var_1_2 - cx_grid_var_2 + dx_diff_j_1_2
   = 0
 dy_diff_def_i_1_2: EMIB_cy_grid_var_1_2 - cy_grid_var_1 + dy_diff_i_1_2
   = 0
 dy_diff_def_j_1_2: EMIB_cy_grid_var_1_2 - cy_grid_var_2 + dy_diff_j_1_2
   = 0
 dx_abs_i_1_2_abs_ge_orig: dx_abs_i_1_2 - dx_diff_i_1_2
   - 210 dx_abs_i_1_2_is_positive >= -210
 dx_abs_i_1_2_abs_le_orig: dx_abs_i_1_2 - dx_diff_i_1_2
   + 210 dx_abs_i_1_2_is_positive <= 210
 dx_abs_i_1_2_abs_ge_neg_orig: dx_abs_i_1_2 + dx_diff_i_1_2
   + 210 dx_abs_i_1_2_is_positive >= 0
 dx_abs_i_1_2_abs_le_neg_orig: dx_abs_i_1_2 + dx_diff_i_1_2
   - 210 dx_abs_i_1_2_is_positive <= 0
 dx_abs_i_1_2_force_positive: dx_diff_i_1_2 - 210 dx_abs_i_1_2_is_positive
   >= -210
 dx_abs_i_1_2_force_negative: dx_diff_i_1_2 - 210 dx_abs_i_1_2_is_positive
   <= 0
 dy_abs_i_1_2_abs_ge_orig: dy_abs_i_1_2 - dy_diff_i_1_2
   - 210 dy_abs_i_1_2_is_positive >= -210
 dy_abs_i_1_2_abs_le_orig: dy_abs_i_1_2 - dy_diff_i_1_2
   + 210 dy_abs_i_1_2_is_positive <= 210
 dy_abs_i_1_2_abs_ge_neg_orig: dy_abs_i_1_2 + dy_diff_i_1_2
   + 210 dy_abs_i_1_2_is_positive >= 0
 dy_abs_i_1_2_abs_le_neg_orig: dy_abs_i_1_2 + dy_diff_i_1_2
   - 210 dy_abs_i_1_2_is_positive <= 0
 dy_abs_i_1_2_force_positive: dy_diff_i_1_2 - 210 dy_abs_i_1_2_is_positive
   >= -210
 dy_abs_i_1_2_force_negative: dy_diff_i_1_2 - 210 dy_abs_i_1_2_is_positive
   <= 0
 dx_abs_j_1_2_abs_ge_orig: dx_abs_j_1_2 - dx_diff_j_1_2
   - 210 dx_abs_j_1_2_is_positive >= -210
 dx_abs_j_1_2_abs_le_orig: dx_abs_j_1_2 - dx_diff_j_1_2
   + 210 dx_abs_j_1_2_is_positive <= 210
 dx_abs_j_1_2_abs_ge_neg_orig: dx_abs_j_1_2 + dx_diff_j_1_2
   + 210 dx_abs_j_1_2_is_positive >= 0
 dx_abs_j_1_2_abs_le_neg_orig: dx_abs_j_1_2 + dx_diff_j_1_2
   - 210 dx_abs_j_1_2_is_positive <= 0
 dx_abs_j_1_2_force_positive: dx_diff_j_1_2 - 210 dx_abs_j_1_2_is_positive
   >= -210
 dx_abs_j_1_2_force_negative: dx_diff_j_1_2 - 210 dx_abs_j_1_2_is_positive
   <= 0
 dy_abs_j_1_2_abs_ge_orig: dy_abs_j_1_2 - dy_diff_j_1_2
   - 210 dy_abs_j_1_2_is_positive >= -210
 dy_abs_j_1_2_abs_le_orig: dy_abs_j_1_2 - dy_diff_j_1_2
   + 210 dy_abs_j_1_2_is_positive <= 210
 dy_abs_j_1_2_abs_ge_neg_orig: dy_abs_j_1_2 + dy_diff_j_1_2
   + 210 dy_abs_j_1_2_is_positive >= 0
 dy_abs_j_1_2_abs_le_neg_orig: dy_abs_j_1_2 + dy_diff_j_1_2
   - 210 dy_abs_j_1_2_is_positive <= 0
 dy_abs_j_1_2_force_positive: dy_diff_j_1_2 - 210 dy_abs_j_1_2_is_positive
   >= -210
 dy_abs_j_1_2_force_negative: dy_diff_j_1_2 - 210 dy_abs_j_1_2_is_positive
   <= 0
 dx_diff_def_i_1_5: EMIB_cx_grid_var_1_5 - cx_grid_var_1 + dx_diff_i_1_5
   = 0
 dx_diff_def_j_1_5: EMIB_cx_grid_var_1_5 - cx_grid_var_5 + dx_diff_j_1_5
   = 0
 dy_diff_def_i_1_5: EMIB_cy_grid_var_1_5 - cy_grid_var_1 + dy_diff_i_1_5
   = 0
 dy_diff_def_j_1_5: EMIB_cy_grid_var_1_5 - cy_grid_var_5 + dy_diff_j_1_5
   = 0
 dx_abs_i_1_5_abs_ge_orig: dx_abs_i_1_5 - dx_diff_i_1_5
   - 210 dx_abs_i_1_5_is_positive >= -210
 dx_abs_i_1_5_abs_le_orig: dx_abs_i_1_5 - dx_diff_i_1_5
   + 210 dx_abs_i_1_5_is_positive <= 210
 dx_abs_i_1_5_abs_ge_neg_orig: dx_abs_i_1_5 + dx_diff_i_1_5
   + 210 dx_abs_i_1_5_is_positive >= 0
 dx_abs_i_1_5_abs_le_neg_orig: dx_abs_i_1_5 + dx_diff_i_1_5
   - 210 dx_abs_i_1_5_is_positive <= 0
 dx_abs_i_1_5_force_positive: dx_diff_i_1_5 - 210 dx_abs_i_1_5_is_positive
   >= -210
 dx_abs_i_1_5_force_negative: dx_diff_i_1_5 - 210 dx_abs_i_1_5_is_positive
   <= 0
 dy_abs_i_1_5_abs_ge_orig: dy_abs_i_1_5 - dy_diff_i_1_5
   - 210 dy_abs_i_1_5_is_positive >= -210
 dy_abs_i_1_5_abs_le_orig: dy_abs_i_1_5 - dy_diff_i_1_5
   + 210 dy_abs_i_1_5_is_positive <= 210
 dy_abs_i_1_5_abs_ge_neg_orig: dy_abs_i_1_5 + dy_diff_i_1_5
   + 210 dy_abs_i_1_5_is_positive >= 0
 dy_abs_i_1_5_abs_le_neg_orig: dy_abs_i_1_5 + dy_diff_i_1_5
   - 210 dy_abs_i_1_5_is_positive <= 0
 dy_abs_i_1_5_force_positive: dy_diff_i_1_5 - 210 dy_abs_i_1_5_is_positive
   >= -210
 dy_abs_i_1_5_force_negative: dy_diff_i_1_5 - 210 dy_abs_i_1_5_is_positive
   <= 0
 dx_abs_j_1_5_abs_ge_orig: dx_abs_j_1_5 - dx_diff_j_1_5
   - 210 dx_abs_j_1_5_is_positive >= -210
 dx_abs_j_1_5_abs_le_orig: dx_abs_j_1_5 - dx_diff_j_1_5
   + 210 dx_abs_j_1_5_is_positive <= 210
 dx_abs_j_1_5_abs_ge_neg_orig: dx_abs_j_1_5 + dx_diff_j_1_5
   + 210 dx_abs_j_1_5_is_positive >= 0
 dx_abs_j_1_5_abs_le_neg_orig: dx_abs_j_1_5 + dx_diff_j_1_5
   - 210 dx_abs_j_1_5_is_positive <= 0
 dx_abs_j_1_5_force_positive: dx_diff_j_1_5 - 210 dx_abs_j_1_5_is_positive
   >= -210
 dx_abs_j_1_5_force_negative: dx_diff_j_1_5 - 210 dx_abs_j_1_5_is_positive
   <= 0
 dy_abs_j_1_5_abs_ge_orig: dy_abs_j_1_5 - dy_diff_j_1_5
   - 210 dy_abs_j_1_5_is_positive >= -210
 dy_abs_j_1_5_abs_le_orig: dy_abs_j_1_5 - dy_diff_j_1_5
   + 210 dy_abs_j_1_5_is_positive <= 210
 dy_abs_j_1_5_abs_ge_neg_orig: dy_abs_j_1_5 + dy_diff_j_1_5
   + 210 dy_abs_j_1_5_is_positive >= 0
 dy_abs_j_1_5_abs_le_neg_orig: dy_abs_j_1_5 + dy_diff_j_1_5
   - 210 dy_abs_j_1_5_is_positive <= 0
 dy_abs_j_1_5_force_positive: dy_diff_j_1_5 - 210 dy_abs_j_1_5_is_positive
   >= -210
 dy_abs_j_1_5_force_negative: dy_diff_j_1_5 - 210 dy_abs_j_1_5_is_positive
   <= 0
 dx_diff_def_i_2_3: EMIB_cx_grid_var_2_3 - cx_grid_var_2 + dx_diff_i_2_3
   = 0
 dx_diff_def_j_2_3: EMIB_cx_grid_var_2_3 - cx_grid_var_3 + dx_diff_j_2_3
   = 0
 dy_diff_def_i_2_3: EMIB_cy_grid_var_2_3 - cy_grid_var_2 + dy_diff_i_2_3
   = 0
 dy_diff_def_j_2_3: EMIB_cy_grid_var_2_3 - cy_grid_var_3 + dy_diff_j_2_3
   = 0
 dx_abs_i_2_3_abs_ge_orig: dx_abs_i_2_3 - dx_diff_i_2_3
   - 210 dx_abs_i_2_3_is_positive >= -210
 dx_abs_i_2_3_abs_le_orig: dx_abs_i_2_3 - dx_diff_i_2_3
   + 210 dx_abs_i_2_3_is_positive <= 210
 dx_abs_i_2_3_abs_ge_neg_orig: dx_abs_i_2_3 + dx_diff_i_2_3
   + 210 dx_abs_i_2_3_is_positive >= 0
 dx_abs_i_2_3_abs_le_neg_orig: dx_abs_i_2_3 + dx_diff_i_2_3
   - 210 dx_abs_i_2_3_is_positive <= 0
 dx_abs_i_2_3_force_positive: dx_diff_i_2_3 - 210 dx_abs_i_2_3_is_positive
   >= -210
 dx_abs_i_2_3_force_negative: dx_diff_i_2_3 - 210 dx_abs_i_2_3_is_positive
   <= 0
 dy_abs_i_2_3_abs_ge_orig: dy_abs_i_2_3 - dy_diff_i_2_3
   - 210 dy_abs_i_2_3_is_positive >= -210
 dy_abs_i_2_3_abs_le_orig: dy_abs_i_2_3 - dy_diff_i_2_3
   + 210 dy_abs_i_2_3_is_positive <= 210
 dy_abs_i_2_3_abs_ge_neg_orig: dy_abs_i_2_3 + dy_diff_i_2_3
   + 210 dy_abs_i_2_3_is_positive >= 0
 dy_abs_i_2_3_abs_le_neg_orig: dy_abs_i_2_3 + dy_diff_i_2_3
   - 210 dy_abs_i_2_3_is_positive <= 0
 dy_abs_i_2_3_force_positive: dy_diff_i_2_3 - 210 dy_abs_i_2_3_is_positive
   >= -210
 dy_abs_i_2_3_force_negative: dy_diff_i_2_3 - 210 dy_abs_i_2_3_is_positive
   <= 0
 dx_abs_j_2_3_abs_ge_orig: dx_abs_j_2_3 - dx_diff_j_2_3
   - 210 dx_abs_j_2_3_is_positive >= -210
 dx_abs_j_2_3_abs_le_orig: dx_abs_j_2_3 - dx_diff_j_2_3
   + 210 dx_abs_j_2_3_is_positive <= 210
 dx_abs_j_2_3_abs_ge_neg_orig: dx_abs_j_2_3 + dx_diff_j_2_3
   + 210 dx_abs_j_2_3_is_positive >= 0
 dx_abs_j_2_3_abs_le_neg_orig: dx_abs_j_2_3 + dx_diff_j_2_3
   - 210 dx_abs_j_2_3_is_positive <= 0
 dx_abs_j_2_3_force_positive: dx_diff_j_2_3 - 210 dx_abs_j_2_3_is_positive
   >= -210
 dx_abs_j_2_3_force_negative: dx_diff_j_2_3 - 210 dx_abs_j_2_3_is_positive
   <= 0
 dy_abs_j_2_3_abs_ge_orig: dy_abs_j_2_3 - dy_diff_j_2_3
   - 210 dy_abs_j_2_3_is_positive >= -210
 dy_abs_j_2_3_abs_le_orig: dy_abs_j_2_3 - dy_diff_j_2_3
   + 210 dy_abs_j_2_3_is_positive <= 210
 dy_abs_j_2_3_abs_ge_neg_orig: dy_abs_j_2_3 + dy_diff_j_2_3
   + 210 dy_abs_j_2_3_is_positive >= 0
 dy_abs_j_2_3_abs_le_neg_orig: dy_abs_j_2_3 + dy_diff_j_2_3
   - 210 dy_abs_j_2_3_is_positive <= 0
 dy_abs_j_2_3_force_positive: dy_diff_j_2_3 - 210 dy_abs_j_2_3_is_positive
   >= -210
 dy_abs_j_2_3_force_negative: dy_diff_j_2_3 - 210 dy_abs_j_2_3_is_positive
   <= 0
 dx_diff_def_i_2_6: EMIB_cx_grid_var_2_6 - cx_grid_var_2 + dx_diff_i_2_6
   = 0
 dx_diff_def_j_2_6: EMIB_cx_grid_var_2_6 - cx_grid_var_6 + dx_diff_j_2_6
   = 0
 dy_diff_def_i_2_6: EMIB_cy_grid_var_2_6 - cy_grid_var_2 + dy_diff_i_2_6
   = 0
 dy_diff_def_j_2_6: EMIB_cy_grid_var_2_6 - cy_grid_var_6 + dy_diff_j_2_6
   = 0
 dx_abs_i_2_6_abs_ge_orig: dx_abs_i_2_6 - dx_diff_i_2_6
   - 210 dx_abs_i_2_6_is_positive >= -210
 dx_abs_i_2_6_abs_le_orig: dx_abs_i_2_6 - dx_diff_i_2_6
   + 210 dx_abs_i_2_6_is_positive <= 210
 dx_abs_i_2_6_abs_ge_neg_orig: dx_abs_i_2_6 + dx_diff_i_2_6
   + 210 dx_abs_i_2_6_is_positive >= 0
 dx_abs_i_2_6_abs_le_neg_orig: dx_abs_i_2_6 + dx_diff_i_2_6
   - 210 dx_abs_i_2_6_is_positive <= 0
 dx_abs_i_2_6_force_positive: dx_diff_i_2_6 - 210 dx_abs_i_2_6_is_positive
   >= -210
 dx_abs_i_2_6_force_negative: dx_diff_i_2_6 - 210 dx_abs_i_2_6_is_positive
   <= 0
 dy_abs_i_2_6_abs_ge_orig: dy_abs_i_2_6 - dy_diff_i_2_6
   - 210 dy_abs_i_2_6_is_positive >= -210
 dy_abs_i_2_6_abs_le_orig: dy_abs_i_2_6 - dy_diff_i_2_6
   + 210 dy_abs_i_2_6_is_positive <= 210
 dy_abs_i_2_6_abs_ge_neg_orig: dy_abs_i_2_6 + dy_diff_i_2_6
   + 210 dy_abs_i_2_6_is_positive >= 0
 dy_abs_i_2_6_abs_le_neg_orig: dy_abs_i_2_6 + dy_diff_i_2_6
   - 210 dy_abs_i_2_6_is_positive <= 0
 dy_abs_i_2_6_force_positive: dy_diff_i_2_6 - 210 dy_abs_i_2_6_is_positive
   >= -210
 dy_abs_i_2_6_force_negative: dy_diff_i_2_6 - 210 dy_abs_i_2_6_is_positive
   <= 0
 dx_abs_j_2_6_abs_ge_orig: dx_abs_j_2_6 - dx_diff_j_2_6
   - 210 dx_abs_j_2_6_is_positive >= -210
 dx_abs_j_2_6_abs_le_orig: dx_abs_j_2_6 - dx_diff_j_2_6
   + 210 dx_abs_j_2_6_is_positive <= 210
 dx_abs_j_2_6_abs_ge_neg_orig: dx_abs_j_2_6 + dx_diff_j_2_6
   + 210 dx_abs_j_2_6_is_positive >= 0
 dx_abs_j_2_6_abs_le_neg_orig: dx_abs_j_2_6 + dx_diff_j_2_6
   - 210 dx_abs_j_2_6_is_positive <= 0
 dx_abs_j_2_6_force_positive: dx_diff_j_2_6 - 210 dx_abs_j_2_6_is_positive
   >= -210
 dx_abs_j_2_6_force_negative: dx_diff_j_2_6 - 210 dx_abs_j_2_6_is_positive
   <= 0
 dy_abs_j_2_6_abs_ge_orig: dy_abs_j_2_6 - dy_diff_j_2_6
   - 210 dy_abs_j_2_6_is_positive >= -210
 dy_abs_j_2_6_abs_le_orig: dy_abs_j_2_6 - dy_diff_j_2_6
   + 210 dy_abs_j_2_6_is_positive <= 210
 dy_abs_j_2_6_abs_ge_neg_orig: dy_abs_j_2_6 + dy_diff_j_2_6
   + 210 dy_abs_j_2_6_is_positive >= 0
 dy_abs_j_2_6_abs_le_neg_orig: dy_abs_j_2_6 + dy_diff_j_2_6
   - 210 dy_abs_j_2_6_is_positive <= 0
 dy_abs_j_2_6_force_positive: dy_diff_j_2_6 - 210 dy_abs_j_2_6_is_positive
   >= -210
 dy_abs_j_2_6_force_negative: dy_diff_j_2_6 - 210 dy_abs_j_2_6_is_positive
   <= 0
 dx_diff_def_i_3_7: EMIB_cx_grid_var_3_7 - cx_grid_var_3 + dx_diff_i_3_7
   = 0
 dx_diff_def_j_3_7: EMIB_cx_grid_var_3_7 - cx_grid_var_7 + dx_diff_j_3_7
   = 0
 dy_diff_def_i_3_7: EMIB_cy_grid_var_3_7 - cy_grid_var_3 + dy_diff_i_3_7
   = 0
 dy_diff_def_j_3_7: EMIB_cy_grid_var_3_7 - cy_grid_var_7 + dy_diff_j_3_7
   = 0
 dx_abs_i_3_7_abs_ge_orig: dx_abs_i_3_7 - dx_diff_i_3_7
   - 210 dx_abs_i_3_7_is_positive >= -210
 dx_abs_i_3_7_abs_le_orig: dx_abs_i_3_7 - dx_diff_i_3_7
   + 210 dx_abs_i_3_7_is_positive <= 210
 dx_abs_i_3_7_abs_ge_neg_orig: dx_abs_i_3_7 + dx_diff_i_3_7
   + 210 dx_abs_i_3_7_is_positive >= 0
 dx_abs_i_3_7_abs_le_neg_orig: dx_abs_i_3_7 + dx_diff_i_3_7
   - 210 dx_abs_i_3_7_is_positive <= 0
 dx_abs_i_3_7_force_positive: dx_diff_i_3_7 - 210 dx_abs_i_3_7_is_positive
   >= -210
 dx_abs_i_3_7_force_negative: dx_diff_i_3_7 - 210 dx_abs_i_3_7_is_positive
   <= 0
 dy_abs_i_3_7_abs_ge_orig: dy_abs_i_3_7 - dy_diff_i_3_7
   - 210 dy_abs_i_3_7_is_positive >= -210
 dy_abs_i_3_7_abs_le_orig: dy_abs_i_3_7 - dy_diff_i_3_7
   + 210 dy_abs_i_3_7_is_positive <= 210
 dy_abs_i_3_7_abs_ge_neg_orig: dy_abs_i_3_7 + dy_diff_i_3_7
   + 210 dy_abs_i_3_7_is_positive >= 0
 dy_abs_i_3_7_abs_le_neg_orig: dy_abs_i_3_7 + dy_diff_i_3_7
   - 210 dy_abs_i_3_7_is_positive <= 0
 dy_abs_i_3_7_force_positive: dy_diff_i_3_7 - 210 dy_abs_i_3_7_is_positive
   >= -210
 dy_abs_i_3_7_force_negative: dy_diff_i_3_7 - 210 dy_abs_i_3_7_is_positive
   <= 0
 dx_abs_j_3_7_abs_ge_orig: dx_abs_j_3_7 - dx_diff_j_3_7
   - 210 dx_abs_j_3_7_is_positive >= -210
 dx_abs_j_3_7_abs_le_orig: dx_abs_j_3_7 - dx_diff_j_3_7
   + 210 dx_abs_j_3_7_is_positive <= 210
 dx_abs_j_3_7_abs_ge_neg_orig: dx_abs_j_3_7 + dx_diff_j_3_7
   + 210 dx_abs_j_3_7_is_positive >= 0
 dx_abs_j_3_7_abs_le_neg_orig: dx_abs_j_3_7 + dx_diff_j_3_7
   - 210 dx_abs_j_3_7_is_positive <= 0
 dx_abs_j_3_7_force_positive: dx_diff_j_3_7 - 210 dx_abs_j_3_7_is_positive
   >= -210
 dx_abs_j_3_7_force_negative: dx_diff_j_3_7 - 210 dx_abs_j_3_7_is_positive
   <= 0
 dy_abs_j_3_7_abs_ge_orig: dy_abs_j_3_7 - dy_diff_j_3_7
   - 210 dy_abs_j_3_7_is_positive >= -210
 dy_abs_j_3_7_abs_le_orig: dy_abs_j_3_7 - dy_diff_j_3_7
   + 210 dy_abs_j_3_7_is_positive <= 210
 dy_abs_j_3_7_abs_ge_neg_orig: dy_abs_j_3_7 + dy_diff_j_3_7
   + 210 dy_abs_j_3_7_is_positive >= 0
 dy_abs_j_3_7_abs_le_neg_orig: dy_abs_j_3_7 + dy_diff_j_3_7
   - 210 dy_abs_j_3_7_is_positive <= 0
 dy_abs_j_3_7_force_positive: dy_diff_j_3_7 - 210 dy_abs_j_3_7_is_positive
   >= -210
 dy_abs_j_3_7_force_negative: dy_diff_j_3_7 - 210 dy_abs_j_3_7_is_positive
   <= 0
 wirelength_def: wirelength - 256 dx_abs_i_0_1 - 256 dy_abs_i_0_1
   - 256 dx_abs_j_0_1 - 256 dy_abs_j_0_1 - 256 dx_abs_i_0_3
   - 256 dy_abs_i_0_3 - 256 dx_abs_j_0_3 - 256 dy_abs_j_0_3
   - 1024 dx_abs_i_0_4 - 1024 dy_abs_i_0_4 - 1024 dx_abs_j_0_4
   - 1024 dy_abs_j_0_4 - 256 dx_abs_i_1_2 - 256 dy_abs_i_1_2
   - 256 dx_abs_j_1_2 - 256 dy_abs_j_1_2 - 1024 dx_abs_i_1_5
   - 1024 dy_abs_i_1_5 - 1024 dx_abs_j_1_5 - 1024 dy_abs_j_1_5
   - 256 dx_abs_i_2_3 - 256 dy_abs_i_2_3 - 256 dx_abs_j_2_3
   - 256 dy_abs_j_2_3 - 1024 dx_abs_i_2_6 - 1024 dy_abs_i_2_6
   - 1024 dx_abs_j_2_6 - 1024 dy_abs_j_2_6 - 1024 dx_abs_i_3_7
   - 1024 dy_abs_i_3_7 - 1024 dx_abs_j_3_7 - 1024 dy_abs_j_3_7 = 0
 t_ge_scaled_mean: - 0.8 bbox_w - 0.8 bbox_h + bbox_area_proxy_t >= 0
Bounds
 8.25 <= w_var_0 <= 9
 8.25 <= h_var_0 <= 9
 8.25 <= w_var_1 <= 9
 8.25 <= h_var_1 <= 9
 8.25 <= w_var_2 <= 9
 8.25 <= h_var_2 <= 9
 8.25 <= w_var_3 <= 9
 8.25 <= h_var_3 <= 9
 w_var_4 = 8.75
 h_var_4 = 8.75
 w_var_5 = 8.75
 h_var_5 = 8.75
 w_var_6 = 8.75
 h_var_6 = 8.75
 w_var_7 = 8.75
 h_var_7 = 8.75
 0.8533 <= EMIB_w_var_0_1 <= 2
 0.8533 <= EMIB_h_var_0_1 <= 2
 0.8533 <= EMIB_w_var_0_3 <= 2
 0.8533 <= EMIB_h_var_0_3 <= 2
 2 <= EMIB_w_var_0_4 <= 3.4133
 2 <= EMIB_h_var_0_4 <= 3.4133
 0.8533 <= EMIB_w_var_1_2 <= 2
 0.8533 <= EMIB_h_var_1_2 <= 2
 2 <= EMIB_w_var_1_5 <= 3.4133
 2 <= EMIB_h_var_1_5 <= 3.4133
 0.8533 <= EMIB_w_var_2_3 <= 2
 0.8533 <= EMIB_h_var_2_3 <= 2
 2 <= EMIB_w_var_2_6 <= 3.4133
 2 <= EMIB_h_var_2_6 <= 3.4133
 2 <= EMIB_w_var_3_7 <= 3.4133
 2 <= EMIB_h_var_3_7 <= 3.4133
 x_grid_var_0 <= 105
 y_grid_var_0 <= 105
 x_grid_var_1 <= 105
 y_grid_var_1 <= 105
 x_grid_var_2 <= 105
 y_grid_var_2 <= 105
 x_grid_var_3 <= 105
 y_grid_var_3 <= 105
 x_grid_var_4 <= 105
 y_grid_var_4 <= 105
 x_grid_var_5 <= 105
 y_grid_var_5 <= 105
 x_grid_var_6 <= 105
 y_grid_var_6 <= 105
 x_grid_var_7 <= 105
 y_grid_var_7 <= 105
 EMIB_x_grid_var_0_1 <= 105
 EMIB_y_grid_var_0_1 <= 105
 EMIB_x_grid_var_0_3 <= 105
 EMIB_y_grid_var_0_3 <= 105
 EMIB_x_grid_var_0_4 <= 105
 EMIB_y_grid_var_0_4 <= 105
 EMIB_x_grid_var_1_2 <= 105
 EMIB_y_grid_var_1_2 <= 105
 EMIB_x_grid_var_1_5 <= 105
 EMIB_y_grid_var_1_5 <= 105
 EMIB_x_grid_var_2_3 <= 105
 EMIB_y_grid_var_2_3 <= 105
 EMIB_x_grid_var_2_6 <= 105
 EMIB_y_grid_var_2_6 <= 105
 EMIB_x_grid_var_3_7 <= 105
 EMIB_y_grid_var_3_7 <= 105
 EMIB_cx_grid_var_0_1 <= 210
 EMIB_cy_grid_var_0_1 <= 210
 EMIB_cx_grid_var_0_3 <= 210
 EMIB_cy_grid_var_0_3 <= 210
 EMIB_cx_grid_var_0_4 <= 210
 EMIB_cy_grid_var_0_4 <= 210
 EMIB_cx_grid_var_1_2 <= 210
 EMIB_cy_grid_var_1_2 <= 210
 EMIB_cx_grid_var_1_5 <= 210
 EMIB_cy_grid_var_1_5 <= 210
 EMIB_cx_grid_var_2_3 <= 210
 EMIB_cy_grid_var_2_3 <= 210
 EMIB_cx_grid_var_2_6 <= 210
 EMIB_cy_grid_var_2_6 <= 210
 EMIB_cx_grid_var_3_7 <= 210
 EMIB_cy_grid_var_3_7 <= 210
 cx_grid_var_0 <= 210
 cy_grid_var_0 <= 210
 cx_grid_var_1 <= 210
 cy_grid_var_1 <= 210
 cx_grid_var_2 <= 210
 cy_grid_var_2 <= 210
 cx_grid_var_3 <= 210
 cy_grid_var_3 <= 210
 cx_grid_var_4 <= 210
 cy_grid_var_4 <= 210
 cx_grid_var_5 <= 210
 cy_grid_var_5 <= 210
 cx_grid_var_6 <= 210
 cy_grid_var_6 <= 210
 cx_grid_var_7 <= 210
 cy_grid_var_7 <= 210
 cx_center <= 105
 cy_center <= 105
 bbox_min_x <= 105
 bbox_max_x <= 105
 bbox_min_y <= 105
 bbox_max_y <= 105
 bbox_w <= 105
 bbox_h <= 105
 aspect_ratio_penalty <= 105
 dx_grid_abs_pair_0_1 <= 105
 dy_grid_abs_pair_0_1 <= 105
 -105 <= dx_grid_diff_0_1 <= 105
 -105 <= dy_grid_diff_0_1 <= 105
 dist_curr_pair_0_1 <= 210
 dx_grid_abs_pair_0_2 <= 105
 dy_grid_abs_pair_0_2 <= 105
 -105 <= dx_grid_diff_0_2 <= 105
 -105 <= dy_grid_diff_0_2 <= 105
 dist_curr_pair_0_2 <= 210
 dx_grid_abs_pair_0_3 <= 105
 dy_grid_abs_pair_0_3 <= 105
 -105 <= dx_grid_diff_0_3 <= 105
 -105 <= dy_grid_diff_0_3 <= 105
 dist_curr_pair_0_3 <= 210
 dx_grid_abs_pair_1_2 <= 105
 dy_grid_abs_pair_1_2 <= 105
 -105 <= dx_grid_diff_1_2 <= 105
 -105 <= dy_grid_diff_1_2 <= 105
 dist_curr_pair_1_2 <= 210
 dx_grid_abs_pair_1_3 <= 105
 dy_grid_abs_pair_1_3 <= 105
 -105 <= dx_grid_diff_1_3 <= 105
 -105 <= dy_grid_diff_1_3 <= 105
 dist_curr_pair_1_3 <= 210
 dx_grid_abs_pair_2_3 <= 105
 dy_grid_abs_pair_2_3 <= 105
 -105 <= dx_grid_diff_2_3 <= 105
 -105 <= dy_grid_diff_2_3 <= 105
 dist_curr_pair_2_3 <= 210
 -105 <= dx_center_diff_0 <= 105
 dx_center_abs_0 <= 105
 -105 <= dy_center_diff_0 <= 105
 dy_center_abs_0 <= 105
 dist_center_0 <= 210
 -105 <= dx_center_diff_1 <= 105
 dx_center_abs_1 <= 105
 -105 <= dy_center_diff_1 <= 105
 dy_center_abs_1 <= 105
 dist_center_1 <= 210
 -105 <= dx_center_diff_2 <= 105
 dx_center_abs_2 <= 105
 -105 <= dy_center_diff_2 <= 105
 dy_center_abs_2 <= 105
 dist_center_2 <= 210
 -105 <= dx_center_diff_3 <= 105
 dx_center_abs_3 <= 105
 -105 <= dy_center_diff_3 <= 105
 dy_center_abs_3 <= 105
 dist_center_3 <= 210
 wirelength <= 6.88128e+06
 -105 <= dx_diff_i_0_1 <= 105
 -105 <= dy_diff_i_0_1 <= 105
 -105 <= dx_diff_j_0_1 <= 105
 -105 <= dy_diff_j_0_1 <= 105
 -105 <= dx_diff_i_0_3 <= 105
 -105 <= dy_diff_i_0_3 <= 105
 -105 <= dx_diff_j_0_3 <= 105
 -105 <= dy_diff_j_0_3 <= 105
 -105 <= dx_diff_i_0_4 <= 105
 -105 <= dy_diff_i_0_4 <= 105
 -105 <= dx_diff_j_0_4 <= 105
 -105 <= dy_diff_j_0_4 <= 105
 -105 <= dx_diff_i_1_2 <= 105
 -105 <= dy_diff_i_1_2 <= 105
 -105 <= dx_diff_j_1_2 <= 105
 -105 <= dy_diff_j_1_2 <= 105
 -105 <= dx_diff_i_1_5 <= 105
 -105 <= dy_diff_i_1_5 <= 105
 -105 <= dx_diff_j_1_5 <= 105
 -105 <= dy_diff_j_1_5 <= 105
 -105 <= dx_diff_i_2_3 <= 105
 -105 <= dy_diff_i_2_3 <= 105
 -105 <= dx_diff_j_2_3 <= 105
 -105 <= dy_diff_j_2_3 <= 105
 -105 <= dx_diff_i_2_6 <= 105
 -105 <= dy_diff_i_2_6 <= 105
 -105 <= dx_diff_j_2_6 <= 105
 -105 <= dy_diff_j_2_6 <= 105
 -105 <= dx_diff_i_3_7 <= 105
 -105 <= dy_diff_i_3_7 <= 105
 -105 <= dx_diff_j_3_7 <= 105
 -105 <= dy_diff_j_3_7 <= 105
 bbox_area_proxy_t <= 210
Binaries
 r_0 r_1 r_2 r_3 r_4 r_5 r_6 r_7 r_EMIB_0_1 r_EMIB_0_3 r_EMIB_0_4
 r_EMIB_1_2 r_EMIB_1_5 r_EMIB_2_3 r_EMIB_2_6 r_EMIB_3_7 z1_0_1 z2_0_1
 z1L_0_1 z1R_0_1 z2D_0_1 z2U_0_1 z1_0_3 z2_0_3 z1L_0_3 z1R_0_3 z2D_0_3
 z2U_0_3 z1_0_4 z2_0_4 z1L_0_4 z1R_0_4 z2D_0_4 z2U_0_4 z1_1_2 z2_1_2
 z1L_1_2 z1R_1_2 z2D_1_2 z2U_1_2 z1_1_5 z2_1_5 z1L_1_5 z1R_1_5 z2D_1_5
 z2U_1_5 z1_2_3 z2_2_3 z1L_2_3 z1R_2_3 z2D_2_3 z2U_2_3 z1_2_6 z2_2_6
 z1L_2_6 z1R_2_6 z2D_2_6 z2U_2_6 z1_3_7 z2_3_7 z1L_3_7 z1R_3_7 z2D_3_7
 z2U_3_7 p_left_0_1 p_right_0_1 p_down_0_1 p_up_0_1 p_left_0_2 p_right_0_2
 p_down_0_2 p_up_0_2 p_left_0_3 p_right_0_3 p_down_0_3 p_up_0_3 p_left_0_4
 p_right_0_4 p_down_0_4 p_up_0_4 p_left_0_5 p_right_0_5 p_down_0_5 p_up_0_5
 p_left_0_6 p_right_0_6 p_down_0_6 p_up_0_6 p_left_0_7 p_right_0_7
 p_down_0_7 p_up_0_7 p_left_1_2 p_right_1_2 p_down_1_2 p_up_1_2 p_left_1_3
 p_right_1_3 p_down_1_3 p_up_1_3 p_left_1_4 p_right_1_4 p_down_1_4 p_up_1_4
 p_left_1_5 p_right_1_5 p_down_1_5 p_up_1_5 p_left_1_6 p_right_1_6
 p_down_1_6 p_up_1_6 p_left_1_7 p_right_1_7 p_down_1_7 p_up_1_7 p_left_2_3
 p_right_2_3 p_down_2_3 p_up_2_3 p_left_2_4 p_right_2_4 p_down_2_4 p_up_2_4
 p_left_2_5 p_right_2_5 p_down_2_5 p_up_2_5 p_left_2_6 p_right_2_6
 p_down_2_6 p_up_2_6 p_left_2_7 p_right_2_7 p_down_2_7 p_up_2_7 p_left_3_4
 p_right_3_4 p_down_3_4 p_up_3_4 p_left_3_5 p_right_3_5 p_down_3_5 p_up_3_5
 p_left_3_6 p_right_3_6 p_down_3_6 p_up_3_6 p_left_3_7 p_right_3_7
 p_down_3_7 p_up_3_7 p_left_4_5 p_right_4_5 p_down_4_5 p_up_4_5 p_left_4_6
 p_right_4_6 p_down_4_6 p_up_4_6 p_left_4_7 p_right_4_7 p_down_4_7 p_up_4_7
 p_left_5_6 p_right_5_6 p_down_5_6 p_up_5_6 p_left_5_7 p_right_5_7
 p_down_5_7 p_up_5_7 p_left_6_7 p_right_6_7 p_down_6_7 p_up_6_7
 p_EMIB_left_0_1_0_3 p_EMIB_right_0_1_0_3 p_EMIB_down_0_1_0_3
 p_EMIB_up_0_1_0_3 p_EMIB_left_0_1_0_4 p_EMIB_right_0_1_0_4
 p_EMIB_down_0_1_0_4 p_EMIB_up_0_1_0_4 p_EMIB_left_0_1_1_2
 p_EMIB_right_0_1_1_2 p_EMIB_down_0_1_1_2 p_EMIB_up_0_1_1_2
 p_EMIB_left_0_1_1_5 p_EMIB_right_0_1_1_5 p_EMIB_down_0_1_1_5
 p_EMIB_up_0_1_1_5 p_EMIB_left_0_3_0_4 p_EMIB_right_0_3_0_4
 p_EMIB_down_0_3_0_4 p_EMIB_up_0_3_0_4 p_EMIB_left_0_3_2_3
 p_EMIB_right_0_3_2_3 p_EMIB_down_0_3_2_3 p_EMIB_up_0_3_2_3
 p_EMIB_left_0_3_3_7 p_EMIB_right_0_3_3_7 p_EMIB_down_0_3_3_7
 p_EMIB_up_0_3_3_7 p_EMIB_left_1_2_1_5 p_EMIB_right_1_2_1_5
 p_EMIB_down_1_2_1_5 p_EMIB_up_1_2_1_5 p_EMIB_left_1_2_2_3
 p_EMIB_right_1_2_2_3 p_EMIB_down_1_2_2_3 p_EMIB_up_1_2_2_3
 p_EMIB_left_1_2_2_6 p_EMIB_right_1_2_2_6 p_EMIB_down_1_2_2_6
 p_EMIB_up_1_2_2_6 p_EMIB_left_2_3_2_6 p_EMIB_right_2_3_2_6
 p_EMIB_down_2_3_2_6 p_EMIB_up_2_3_2_6 p_EMIB_left_2_3_3_7
 p_EMIB_right_2_3_3_7 p_EMIB_down_2_3_3_7 p_EMIB_up_2_3_3_7
 dx_grid_abs_pair_0_1_is_positive dy_grid_abs_pair_0_1_is_positive
 dx_grid_abs_pair_0_2_is_positive dy_grid_abs_pair_0_2_is_positive
 dx_grid_abs_pair_0_3_is_positive dy_grid_abs_pair_0_3_is_positive
 dx_grid_abs_pair_1_2_is_positive dy_grid_abs_pair_1_2_is_positive
 dx_grid_abs_pair_1_3_is_positive dy_grid_abs_pair_1_3_is_positive
 dx_grid_abs_pair_2_3_is_positive dy_grid_abs_pair_2_3_is_positive
 dx_center_abs_0_is_positive dy_center_abs_0_is_positive
 dx_center_abs_1_is_positive dy_center_abs_1_is_positive
 dx_center_abs_2_is_positive dy_center_abs_2_is_positive
 dx_center_abs_3_is_positive dy_center_abs_3_is_positive
 dx_abs_i_0_1_is_positive dy_abs_i_0_1_is_positive dx_abs_j_0_1_is_positive
 dy_abs_j_0_1_is_positive dx_abs_i_0_3_is_positive dy_abs_i_0_3_is_positive
 dx_abs_j_0_3_is_positive dy_abs_j_0_3_is_positive dx_abs_i_0_4_is_positive
 dy_abs_i_0_4_is_positive dx_abs_j_0_4_is_positive dy_abs_j_0_4_is_positive
 dx_abs_i_1_2_is_positive dy_abs_i_1_2_is_positive dx_abs_j_1_2_is_positive
 dy_abs_j_1_2_is_positive dx_abs_i_1_5_is_positive dy_abs_i_1_5_is_positive
 dx_abs_j_1_5_is_positive dy_abs_j_1_5_is_positive dx_abs_i_2_3_is_positive
 dy_abs_i_2_3_is_positive dx_abs_j_2_3_is_positive dy_abs_j_2_3_is_positive
 dx_abs_i_2_6_is_positive dy_abs_i_2_6_is_positive dx_abs_j_2_6_is_positive
 dy_abs_j_2_6_is_positive dx_abs_i_3_7_is_positive dy_abs_i_3_7_is_positive
 dx_abs_j_3_7_is_positive dy_abs_j_3_7_is_positive
End

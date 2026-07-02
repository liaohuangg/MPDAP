\ Model ChipletPlacementGrid
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0xc35174e4dc7c223d
Minimize
  0 r_6 + 0.00181818181818182 aspect_ratio_penalty
   - 6.01652e-06 power_aware_penalty + 9.19563e-05 wirelength
   + 0.1059336827319673 bbox_area_proxy_t
Subject To
 width_rotation_0: r_0 + w_var_0 = 11
 height_rotation_0: - r_0 + h_var_0 = 10
 x_grid_var_ub_0: w_var_0 + x_grid_var_0 <= 123
 y_grid_var_ub_0: h_var_0 + y_grid_var_0 <= 123
 width_rotation_1: 2 r_1 + w_var_1 = 12
 height_rotation_1: - 2 r_1 + h_var_1 = 10
 x_grid_var_ub_1: w_var_1 + x_grid_var_1 <= 123
 y_grid_var_ub_1: h_var_1 + y_grid_var_1 <= 123
 width_rotation_2: - 9 r_2 + w_var_2 = 6
 height_rotation_2: 9 r_2 + h_var_2 = 15
 x_grid_var_ub_2: w_var_2 + x_grid_var_2 <= 123
 y_grid_var_ub_2: h_var_2 + y_grid_var_2 <= 123
 width_rotation_3: 7 r_3 + w_var_3 = 13
 height_rotation_3: - 7 r_3 + h_var_3 = 6
 x_grid_var_ub_3: w_var_3 + x_grid_var_3 <= 123
 y_grid_var_ub_3: h_var_3 + y_grid_var_3 <= 123
 width_rotation_4: 6 r_4 + w_var_4 = 11
 height_rotation_4: - 6 r_4 + h_var_4 = 5
 x_grid_var_ub_4: w_var_4 + x_grid_var_4 <= 123
 y_grid_var_ub_4: h_var_4 + y_grid_var_4 <= 123
 width_rotation_5: 9 r_5 + w_var_5 = 15
 height_rotation_5: - 9 r_5 + h_var_5 = 6
 x_grid_var_ub_5: w_var_5 + x_grid_var_5 <= 123
 y_grid_var_ub_5: h_var_5 + y_grid_var_5 <= 123
 width_rotation_6: w_var_6 = 5
 height_rotation_6: h_var_6 = 5
 x_grid_var_ub_6: w_var_6 + x_grid_var_6 <= 123
 y_grid_var_ub_6: h_var_6 + y_grid_var_6 <= 123
 width_rotation_7: - 8 r_7 + w_var_7 = 6
 height_rotation_7: 8 r_7 + h_var_7 = 14
 x_grid_var_ub_7: w_var_7 + x_grid_var_7 <= 123
 y_grid_var_ub_7: h_var_7 + y_grid_var_7 <= 123
 width_rotation_8: - 6 r_8 + w_var_8 = 6
 height_rotation_8: 6 r_8 + h_var_8 = 12
 x_grid_var_ub_8: w_var_8 + x_grid_var_8 <= 123
 y_grid_var_ub_8: h_var_8 + y_grid_var_8 <= 123
 width_rotation_9: 7 r_9 + w_var_9 = 13
 height_rotation_9: - 7 r_9 + h_var_9 = 6
 x_grid_var_ub_9: w_var_9 + x_grid_var_9 <= 123
 y_grid_var_ub_9: h_var_9 + y_grid_var_9 <= 123
 EMIB_width_rotation_0_7: 1.1467 r_EMIB_0_7 + EMIB_w_var_0_7 = 2
 EMIB_height_rotation_0_7: - 1.1467 r_EMIB_0_7 + EMIB_h_var_0_7 = 0.8533
 EMIB_x_grid_var_ub_0_7: EMIB_w_var_0_7 + EMIB_x_grid_var_0_7 <= 123
 EMIB_y_grid_var_ub_0_7: EMIB_h_var_0_7 + EMIB_y_grid_var_0_7 <= 123
 EMIB_width_rotation_1_4: 0.2933 r_EMIB_1_4 + EMIB_w_var_1_4 = 2
 EMIB_height_rotation_1_4: - 0.2933 r_EMIB_1_4 + EMIB_h_var_1_4 = 1.7067
 EMIB_x_grid_var_ub_1_4: EMIB_w_var_1_4 + EMIB_x_grid_var_1_4 <= 123
 EMIB_y_grid_var_ub_1_4: EMIB_h_var_1_4 + EMIB_y_grid_var_1_4 <= 123
 EMIB_width_rotation_1_8: 1.1467 r_EMIB_1_8 + EMIB_w_var_1_8 = 2
 EMIB_height_rotation_1_8: - 1.1467 r_EMIB_1_8 + EMIB_h_var_1_8 = 0.8533
 EMIB_x_grid_var_ub_1_8: EMIB_w_var_1_8 + EMIB_x_grid_var_1_8 <= 123
 EMIB_y_grid_var_ub_1_8: EMIB_h_var_1_8 + EMIB_y_grid_var_1_8 <= 123
 EMIB_width_rotation_1_9: 0.2933 r_EMIB_1_9 + EMIB_w_var_1_9 = 2
 EMIB_height_rotation_1_9: - 0.2933 r_EMIB_1_9 + EMIB_h_var_1_9 = 1.7067
 EMIB_x_grid_var_ub_1_9: EMIB_w_var_1_9 + EMIB_x_grid_var_1_9 <= 123
 EMIB_y_grid_var_ub_1_9: EMIB_h_var_1_9 + EMIB_y_grid_var_1_9 <= 123
 EMIB_width_rotation_2_6: 0.2933 r_EMIB_2_6 + EMIB_w_var_2_6 = 2
 EMIB_height_rotation_2_6: - 0.2933 r_EMIB_2_6 + EMIB_h_var_2_6 = 1.7067
 EMIB_x_grid_var_ub_2_6: EMIB_w_var_2_6 + EMIB_x_grid_var_2_6 <= 123
 EMIB_y_grid_var_ub_2_6: EMIB_h_var_2_6 + EMIB_y_grid_var_2_6 <= 123
 EMIB_width_rotation_4_6: 1.1467 r_EMIB_4_6 + EMIB_w_var_4_6 = 2
 EMIB_height_rotation_4_6: - 1.1467 r_EMIB_4_6 + EMIB_h_var_4_6 = 0.8533
 EMIB_x_grid_var_ub_4_6: EMIB_w_var_4_6 + EMIB_x_grid_var_4_6 <= 123
 EMIB_y_grid_var_ub_4_6: EMIB_h_var_4_6 + EMIB_y_grid_var_4_6 <= 123
 EMIB_width_rotation_8_9: 1.1467 r_EMIB_8_9 + EMIB_w_var_8_9 = 2
 EMIB_height_rotation_8_9: - 1.1467 r_EMIB_8_9 + EMIB_h_var_8_9 = 0.8533
 EMIB_x_grid_var_ub_8_9: EMIB_w_var_8_9 + EMIB_x_grid_var_8_9 <= 123
 EMIB_y_grid_var_ub_8_9: EMIB_h_var_8_9 + EMIB_y_grid_var_8_9 <= 123
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
 cx_def_8: - 0.5 w_var_8 - x_grid_var_8 + cx_grid_var_8 = 0
 cy_def_8: - 0.5 h_var_8 - y_grid_var_8 + cy_grid_var_8 = 0
 cx_def_9: - 0.5 w_var_9 - x_grid_var_9 + cx_grid_var_9 = 0
 cy_def_9: - 0.5 h_var_9 - y_grid_var_9 + cy_grid_var_9 = 0
 EMIB_cx_def_0_7: - 0.5 EMIB_w_var_0_7 - EMIB_x_grid_var_0_7
   + EMIB_cx_grid_var_0_7 = 0
 EMIB_cy_def_0_7: - 0.5 EMIB_h_var_0_7 - EMIB_y_grid_var_0_7
   + EMIB_cy_grid_var_0_7 = 0
 EMIB_cx_def_1_4: - 0.5 EMIB_w_var_1_4 - EMIB_x_grid_var_1_4
   + EMIB_cx_grid_var_1_4 = 0
 EMIB_cy_def_1_4: - 0.5 EMIB_h_var_1_4 - EMIB_y_grid_var_1_4
   + EMIB_cy_grid_var_1_4 = 0
 EMIB_cx_def_1_8: - 0.5 EMIB_w_var_1_8 - EMIB_x_grid_var_1_8
   + EMIB_cx_grid_var_1_8 = 0
 EMIB_cy_def_1_8: - 0.5 EMIB_h_var_1_8 - EMIB_y_grid_var_1_8
   + EMIB_cy_grid_var_1_8 = 0
 EMIB_cx_def_1_9: - 0.5 EMIB_w_var_1_9 - EMIB_x_grid_var_1_9
   + EMIB_cx_grid_var_1_9 = 0
 EMIB_cy_def_1_9: - 0.5 EMIB_h_var_1_9 - EMIB_y_grid_var_1_9
   + EMIB_cy_grid_var_1_9 = 0
 EMIB_cx_def_2_6: - 0.5 EMIB_w_var_2_6 - EMIB_x_grid_var_2_6
   + EMIB_cx_grid_var_2_6 = 0
 EMIB_cy_def_2_6: - 0.5 EMIB_h_var_2_6 - EMIB_y_grid_var_2_6
   + EMIB_cy_grid_var_2_6 = 0
 EMIB_cx_def_4_6: - 0.5 EMIB_w_var_4_6 - EMIB_x_grid_var_4_6
   + EMIB_cx_grid_var_4_6 = 0
 EMIB_cy_def_4_6: - 0.5 EMIB_h_var_4_6 - EMIB_y_grid_var_4_6
   + EMIB_cy_grid_var_4_6 = 0
 EMIB_cx_def_8_9: - 0.5 EMIB_w_var_8_9 - EMIB_x_grid_var_8_9
   + EMIB_cx_grid_var_8_9 = 0
 EMIB_cy_def_8_9: - 0.5 EMIB_h_var_8_9 - EMIB_y_grid_var_8_9
   + EMIB_cy_grid_var_8_9 = 0
 must_adjacent_sb_0_7: z1_0_7 + z2_0_7 = 1
 horizontal_direction_sb_0_7: - z1_0_7 + z1L_0_7 + z1R_0_7 = 0
 vertical_direction_sb_0_7: - z2_0_7 + z2D_0_7 + z2U_0_7 = 0
 EMIB_rotate_eq_z2_0_7: r_EMIB_0_7 - z2_0_7 = 0
 horizontal_left_dist_lb_0_7: - w_var_0 - x_grid_var_0 + x_grid_var_7
   - 246 z1L_0_7 >= -246
 EMIB_left_overlap_0_7: w_var_0 + x_grid_var_0 - EMIB_x_grid_var_0_7
   - 246 z1L_0_7 >= -245.001
 EMIB_right_overlap_0_7: EMIB_w_var_0_7 - x_grid_var_7
   + EMIB_x_grid_var_0_7 - 246 z1L_0_7 >= -245.001
 horizontal_right_dist_lb_0_7: - w_var_7 + x_grid_var_0 - x_grid_var_7
   - 246 z1R_0_7 >= -246
 EMIB_left_overlap_right_0_7: w_var_7 + x_grid_var_7 - EMIB_x_grid_var_0_7
   - 246 z1R_0_7 >= -245.001
 EMIB_right_overlap_right_0_7: EMIB_w_var_0_7 - x_grid_var_0
   + EMIB_x_grid_var_0_7 - 246 z1R_0_7 >= -245.001
 vertical_down_dist_lb_0_7: - h_var_0 - y_grid_var_0 + y_grid_var_7
   - 246 z2D_0_7 >= -246
 EMIB_bottom_overlap_down_0_7: h_var_0 + y_grid_var_0 - EMIB_y_grid_var_0_7
   - 246 z2D_0_7 >= -245.001
 EMIB_top_overlap_down_0_7: EMIB_h_var_0_7 - y_grid_var_7
   + EMIB_y_grid_var_0_7 - 246 z2D_0_7 >= -245.001
 vertical_up_dist_lb_0_7: - h_var_7 + y_grid_var_0 - y_grid_var_7
   - 246 z2U_0_7 >= -246
 EMIB_bottom_overlap_up_0_7: h_var_7 + y_grid_var_7 - EMIB_y_grid_var_0_7
   - 246 z2U_0_7 >= -245.001
 EMIB_top_overlap_up_0_7: EMIB_h_var_0_7 - y_grid_var_0
   + EMIB_y_grid_var_0_7 - 246 z2U_0_7 >= -245.001
 shared_yi_ub1_0_7: h_var_0 - EMIB_h_var_0_7 + y_grid_var_0
   - EMIB_y_grid_var_0_7 - 246 z1_0_7 >= -246
 shared_yi_ub2_0_7: y_grid_var_0 - EMIB_y_grid_var_0_7 + 246 z1_0_7 <= 246
 shared_yj_ub1_0_7: h_var_7 - EMIB_h_var_0_7 + y_grid_var_7
   - EMIB_y_grid_var_0_7 - 246 z1_0_7 >= -246
 shared_yj_ub2_0_7: y_grid_var_7 - EMIB_y_grid_var_0_7 + 246 z1_0_7 <= 246
 shared_xi_ub1_0_7: w_var_0 - EMIB_w_var_0_7 + x_grid_var_0
   - EMIB_x_grid_var_0_7 - 246 z2_0_7 >= -246
 shared_xi_ub2_0_7: x_grid_var_0 - EMIB_x_grid_var_0_7 + 246 z2_0_7 <= 246
 shared_xj_ub1_0_7: w_var_7 - EMIB_w_var_0_7 + x_grid_var_7
   - EMIB_x_grid_var_0_7 - 246 z2_0_7 >= -246
 shared_xj_ub2_0_7: x_grid_var_7 - EMIB_x_grid_var_0_7 + 246 z2_0_7 <= 246
 must_adjacent_sb_1_4: z1_1_4 + z2_1_4 = 1
 horizontal_direction_sb_1_4: - z1_1_4 + z1L_1_4 + z1R_1_4 = 0
 vertical_direction_sb_1_4: - z2_1_4 + z2D_1_4 + z2U_1_4 = 0
 EMIB_rotate_eq_z2_1_4: r_EMIB_1_4 - z2_1_4 = 0
 horizontal_left_dist_lb_1_4: - w_var_1 - x_grid_var_1 + x_grid_var_4
   - 246 z1L_1_4 >= -246
 EMIB_left_overlap_1_4: w_var_1 + x_grid_var_1 - EMIB_x_grid_var_1_4
   - 246 z1L_1_4 >= -245.001
 EMIB_right_overlap_1_4: EMIB_w_var_1_4 - x_grid_var_4
   + EMIB_x_grid_var_1_4 - 246 z1L_1_4 >= -245.001
 horizontal_right_dist_lb_1_4: - w_var_4 + x_grid_var_1 - x_grid_var_4
   - 246 z1R_1_4 >= -246
 EMIB_left_overlap_right_1_4: w_var_4 + x_grid_var_4 - EMIB_x_grid_var_1_4
   - 246 z1R_1_4 >= -245.001
 EMIB_right_overlap_right_1_4: EMIB_w_var_1_4 - x_grid_var_1
   + EMIB_x_grid_var_1_4 - 246 z1R_1_4 >= -245.001
 vertical_down_dist_lb_1_4: - h_var_1 - y_grid_var_1 + y_grid_var_4
   - 246 z2D_1_4 >= -246
 EMIB_bottom_overlap_down_1_4: h_var_1 + y_grid_var_1 - EMIB_y_grid_var_1_4
   - 246 z2D_1_4 >= -245.001
 EMIB_top_overlap_down_1_4: EMIB_h_var_1_4 - y_grid_var_4
   + EMIB_y_grid_var_1_4 - 246 z2D_1_4 >= -245.001
 vertical_up_dist_lb_1_4: - h_var_4 + y_grid_var_1 - y_grid_var_4
   - 246 z2U_1_4 >= -246
 EMIB_bottom_overlap_up_1_4: h_var_4 + y_grid_var_4 - EMIB_y_grid_var_1_4
   - 246 z2U_1_4 >= -245.001
 EMIB_top_overlap_up_1_4: EMIB_h_var_1_4 - y_grid_var_1
   + EMIB_y_grid_var_1_4 - 246 z2U_1_4 >= -245.001
 shared_yi_ub1_1_4: h_var_1 - EMIB_h_var_1_4 + y_grid_var_1
   - EMIB_y_grid_var_1_4 - 246 z1_1_4 >= -246
 shared_yi_ub2_1_4: y_grid_var_1 - EMIB_y_grid_var_1_4 + 246 z1_1_4 <= 246
 shared_yj_ub1_1_4: h_var_4 - EMIB_h_var_1_4 + y_grid_var_4
   - EMIB_y_grid_var_1_4 - 246 z1_1_4 >= -246
 shared_yj_ub2_1_4: y_grid_var_4 - EMIB_y_grid_var_1_4 + 246 z1_1_4 <= 246
 shared_xi_ub1_1_4: w_var_1 - EMIB_w_var_1_4 + x_grid_var_1
   - EMIB_x_grid_var_1_4 - 246 z2_1_4 >= -246
 shared_xi_ub2_1_4: x_grid_var_1 - EMIB_x_grid_var_1_4 + 246 z2_1_4 <= 246
 shared_xj_ub1_1_4: w_var_4 - EMIB_w_var_1_4 + x_grid_var_4
   - EMIB_x_grid_var_1_4 - 246 z2_1_4 >= -246
 shared_xj_ub2_1_4: x_grid_var_4 - EMIB_x_grid_var_1_4 + 246 z2_1_4 <= 246
 must_adjacent_sb_1_8: z1_1_8 + z2_1_8 = 1
 horizontal_direction_sb_1_8: - z1_1_8 + z1L_1_8 + z1R_1_8 = 0
 vertical_direction_sb_1_8: - z2_1_8 + z2D_1_8 + z2U_1_8 = 0
 EMIB_rotate_eq_z2_1_8: r_EMIB_1_8 - z2_1_8 = 0
 horizontal_left_dist_lb_1_8: - w_var_1 - x_grid_var_1 + x_grid_var_8
   - 246 z1L_1_8 >= -246
 EMIB_left_overlap_1_8: w_var_1 + x_grid_var_1 - EMIB_x_grid_var_1_8
   - 246 z1L_1_8 >= -245.001
 EMIB_right_overlap_1_8: EMIB_w_var_1_8 - x_grid_var_8
   + EMIB_x_grid_var_1_8 - 246 z1L_1_8 >= -245.001
 horizontal_right_dist_lb_1_8: - w_var_8 + x_grid_var_1 - x_grid_var_8
   - 246 z1R_1_8 >= -246
 EMIB_left_overlap_right_1_8: w_var_8 + x_grid_var_8 - EMIB_x_grid_var_1_8
   - 246 z1R_1_8 >= -245.001
 EMIB_right_overlap_right_1_8: EMIB_w_var_1_8 - x_grid_var_1
   + EMIB_x_grid_var_1_8 - 246 z1R_1_8 >= -245.001
 vertical_down_dist_lb_1_8: - h_var_1 - y_grid_var_1 + y_grid_var_8
   - 246 z2D_1_8 >= -246
 EMIB_bottom_overlap_down_1_8: h_var_1 + y_grid_var_1 - EMIB_y_grid_var_1_8
   - 246 z2D_1_8 >= -245.001
 EMIB_top_overlap_down_1_8: EMIB_h_var_1_8 - y_grid_var_8
   + EMIB_y_grid_var_1_8 - 246 z2D_1_8 >= -245.001
 vertical_up_dist_lb_1_8: - h_var_8 + y_grid_var_1 - y_grid_var_8
   - 246 z2U_1_8 >= -246
 EMIB_bottom_overlap_up_1_8: h_var_8 + y_grid_var_8 - EMIB_y_grid_var_1_8
   - 246 z2U_1_8 >= -245.001
 EMIB_top_overlap_up_1_8: EMIB_h_var_1_8 - y_grid_var_1
   + EMIB_y_grid_var_1_8 - 246 z2U_1_8 >= -245.001
 shared_yi_ub1_1_8: h_var_1 - EMIB_h_var_1_8 + y_grid_var_1
   - EMIB_y_grid_var_1_8 - 246 z1_1_8 >= -246
 shared_yi_ub2_1_8: y_grid_var_1 - EMIB_y_grid_var_1_8 + 246 z1_1_8 <= 246
 shared_yj_ub1_1_8: h_var_8 - EMIB_h_var_1_8 + y_grid_var_8
   - EMIB_y_grid_var_1_8 - 246 z1_1_8 >= -246
 shared_yj_ub2_1_8: y_grid_var_8 - EMIB_y_grid_var_1_8 + 246 z1_1_8 <= 246
 shared_xi_ub1_1_8: w_var_1 - EMIB_w_var_1_8 + x_grid_var_1
   - EMIB_x_grid_var_1_8 - 246 z2_1_8 >= -246
 shared_xi_ub2_1_8: x_grid_var_1 - EMIB_x_grid_var_1_8 + 246 z2_1_8 <= 246
 shared_xj_ub1_1_8: w_var_8 - EMIB_w_var_1_8 + x_grid_var_8
   - EMIB_x_grid_var_1_8 - 246 z2_1_8 >= -246
 shared_xj_ub2_1_8: x_grid_var_8 - EMIB_x_grid_var_1_8 + 246 z2_1_8 <= 246
 must_adjacent_sb_1_9: z1_1_9 + z2_1_9 = 1
 horizontal_direction_sb_1_9: - z1_1_9 + z1L_1_9 + z1R_1_9 = 0
 vertical_direction_sb_1_9: - z2_1_9 + z2D_1_9 + z2U_1_9 = 0
 EMIB_rotate_eq_z2_1_9: r_EMIB_1_9 - z2_1_9 = 0
 horizontal_left_dist_lb_1_9: - w_var_1 - x_grid_var_1 + x_grid_var_9
   - 246 z1L_1_9 >= -246
 EMIB_left_overlap_1_9: w_var_1 + x_grid_var_1 - EMIB_x_grid_var_1_9
   - 246 z1L_1_9 >= -245.001
 EMIB_right_overlap_1_9: EMIB_w_var_1_9 - x_grid_var_9
   + EMIB_x_grid_var_1_9 - 246 z1L_1_9 >= -245.001
 horizontal_right_dist_lb_1_9: - w_var_9 + x_grid_var_1 - x_grid_var_9
   - 246 z1R_1_9 >= -246
 EMIB_left_overlap_right_1_9: w_var_9 + x_grid_var_9 - EMIB_x_grid_var_1_9
   - 246 z1R_1_9 >= -245.001
 EMIB_right_overlap_right_1_9: EMIB_w_var_1_9 - x_grid_var_1
   + EMIB_x_grid_var_1_9 - 246 z1R_1_9 >= -245.001
 vertical_down_dist_lb_1_9: - h_var_1 - y_grid_var_1 + y_grid_var_9
   - 246 z2D_1_9 >= -246
 EMIB_bottom_overlap_down_1_9: h_var_1 + y_grid_var_1 - EMIB_y_grid_var_1_9
   - 246 z2D_1_9 >= -245.001
 EMIB_top_overlap_down_1_9: EMIB_h_var_1_9 - y_grid_var_9
   + EMIB_y_grid_var_1_9 - 246 z2D_1_9 >= -245.001
 vertical_up_dist_lb_1_9: - h_var_9 + y_grid_var_1 - y_grid_var_9
   - 246 z2U_1_9 >= -246
 EMIB_bottom_overlap_up_1_9: h_var_9 + y_grid_var_9 - EMIB_y_grid_var_1_9
   - 246 z2U_1_9 >= -245.001
 EMIB_top_overlap_up_1_9: EMIB_h_var_1_9 - y_grid_var_1
   + EMIB_y_grid_var_1_9 - 246 z2U_1_9 >= -245.001
 shared_yi_ub1_1_9: h_var_1 - EMIB_h_var_1_9 + y_grid_var_1
   - EMIB_y_grid_var_1_9 - 246 z1_1_9 >= -246
 shared_yi_ub2_1_9: y_grid_var_1 - EMIB_y_grid_var_1_9 + 246 z1_1_9 <= 246
 shared_yj_ub1_1_9: h_var_9 - EMIB_h_var_1_9 + y_grid_var_9
   - EMIB_y_grid_var_1_9 - 246 z1_1_9 >= -246
 shared_yj_ub2_1_9: y_grid_var_9 - EMIB_y_grid_var_1_9 + 246 z1_1_9 <= 246
 shared_xi_ub1_1_9: w_var_1 - EMIB_w_var_1_9 + x_grid_var_1
   - EMIB_x_grid_var_1_9 - 246 z2_1_9 >= -246
 shared_xi_ub2_1_9: x_grid_var_1 - EMIB_x_grid_var_1_9 + 246 z2_1_9 <= 246
 shared_xj_ub1_1_9: w_var_9 - EMIB_w_var_1_9 + x_grid_var_9
   - EMIB_x_grid_var_1_9 - 246 z2_1_9 >= -246
 shared_xj_ub2_1_9: x_grid_var_9 - EMIB_x_grid_var_1_9 + 246 z2_1_9 <= 246
 must_adjacent_sb_2_6: z1_2_6 + z2_2_6 = 1
 horizontal_direction_sb_2_6: - z1_2_6 + z1L_2_6 + z1R_2_6 = 0
 vertical_direction_sb_2_6: - z2_2_6 + z2D_2_6 + z2U_2_6 = 0
 EMIB_rotate_eq_z2_2_6: r_EMIB_2_6 - z2_2_6 = 0
 horizontal_left_dist_lb_2_6: - w_var_2 - x_grid_var_2 + x_grid_var_6
   - 246 z1L_2_6 >= -246
 EMIB_left_overlap_2_6: w_var_2 + x_grid_var_2 - EMIB_x_grid_var_2_6
   - 246 z1L_2_6 >= -245.001
 EMIB_right_overlap_2_6: EMIB_w_var_2_6 - x_grid_var_6
   + EMIB_x_grid_var_2_6 - 246 z1L_2_6 >= -245.001
 horizontal_right_dist_lb_2_6: - w_var_6 + x_grid_var_2 - x_grid_var_6
   - 246 z1R_2_6 >= -246
 EMIB_left_overlap_right_2_6: w_var_6 + x_grid_var_6 - EMIB_x_grid_var_2_6
   - 246 z1R_2_6 >= -245.001
 EMIB_right_overlap_right_2_6: EMIB_w_var_2_6 - x_grid_var_2
   + EMIB_x_grid_var_2_6 - 246 z1R_2_6 >= -245.001
 vertical_down_dist_lb_2_6: - h_var_2 - y_grid_var_2 + y_grid_var_6
   - 246 z2D_2_6 >= -246
 EMIB_bottom_overlap_down_2_6: h_var_2 + y_grid_var_2 - EMIB_y_grid_var_2_6
   - 246 z2D_2_6 >= -245.001
 EMIB_top_overlap_down_2_6: EMIB_h_var_2_6 - y_grid_var_6
   + EMIB_y_grid_var_2_6 - 246 z2D_2_6 >= -245.001
 vertical_up_dist_lb_2_6: - h_var_6 + y_grid_var_2 - y_grid_var_6
   - 246 z2U_2_6 >= -246
 EMIB_bottom_overlap_up_2_6: h_var_6 + y_grid_var_6 - EMIB_y_grid_var_2_6
   - 246 z2U_2_6 >= -245.001
 EMIB_top_overlap_up_2_6: EMIB_h_var_2_6 - y_grid_var_2
   + EMIB_y_grid_var_2_6 - 246 z2U_2_6 >= -245.001
 shared_yi_ub1_2_6: h_var_2 - EMIB_h_var_2_6 + y_grid_var_2
   - EMIB_y_grid_var_2_6 - 246 z1_2_6 >= -246
 shared_yi_ub2_2_6: y_grid_var_2 - EMIB_y_grid_var_2_6 + 246 z1_2_6 <= 246
 shared_yj_ub1_2_6: h_var_6 - EMIB_h_var_2_6 + y_grid_var_6
   - EMIB_y_grid_var_2_6 - 246 z1_2_6 >= -246
 shared_yj_ub2_2_6: y_grid_var_6 - EMIB_y_grid_var_2_6 + 246 z1_2_6 <= 246
 shared_xi_ub1_2_6: w_var_2 - EMIB_w_var_2_6 + x_grid_var_2
   - EMIB_x_grid_var_2_6 - 246 z2_2_6 >= -246
 shared_xi_ub2_2_6: x_grid_var_2 - EMIB_x_grid_var_2_6 + 246 z2_2_6 <= 246
 shared_xj_ub1_2_6: w_var_6 - EMIB_w_var_2_6 + x_grid_var_6
   - EMIB_x_grid_var_2_6 - 246 z2_2_6 >= -246
 shared_xj_ub2_2_6: x_grid_var_6 - EMIB_x_grid_var_2_6 + 246 z2_2_6 <= 246
 must_adjacent_sb_4_6: z1_4_6 + z2_4_6 = 1
 horizontal_direction_sb_4_6: - z1_4_6 + z1L_4_6 + z1R_4_6 = 0
 vertical_direction_sb_4_6: - z2_4_6 + z2D_4_6 + z2U_4_6 = 0
 EMIB_rotate_eq_z2_4_6: r_EMIB_4_6 - z2_4_6 = 0
 horizontal_left_dist_lb_4_6: - w_var_4 - x_grid_var_4 + x_grid_var_6
   - 246 z1L_4_6 >= -246
 EMIB_left_overlap_4_6: w_var_4 + x_grid_var_4 - EMIB_x_grid_var_4_6
   - 246 z1L_4_6 >= -245.001
 EMIB_right_overlap_4_6: EMIB_w_var_4_6 - x_grid_var_6
   + EMIB_x_grid_var_4_6 - 246 z1L_4_6 >= -245.001
 horizontal_right_dist_lb_4_6: - w_var_6 + x_grid_var_4 - x_grid_var_6
   - 246 z1R_4_6 >= -246
 EMIB_left_overlap_right_4_6: w_var_6 + x_grid_var_6 - EMIB_x_grid_var_4_6
   - 246 z1R_4_6 >= -245.001
 EMIB_right_overlap_right_4_6: EMIB_w_var_4_6 - x_grid_var_4
   + EMIB_x_grid_var_4_6 - 246 z1R_4_6 >= -245.001
 vertical_down_dist_lb_4_6: - h_var_4 - y_grid_var_4 + y_grid_var_6
   - 246 z2D_4_6 >= -246
 EMIB_bottom_overlap_down_4_6: h_var_4 + y_grid_var_4 - EMIB_y_grid_var_4_6
   - 246 z2D_4_6 >= -245.001
 EMIB_top_overlap_down_4_6: EMIB_h_var_4_6 - y_grid_var_6
   + EMIB_y_grid_var_4_6 - 246 z2D_4_6 >= -245.001
 vertical_up_dist_lb_4_6: - h_var_6 + y_grid_var_4 - y_grid_var_6
   - 246 z2U_4_6 >= -246
 EMIB_bottom_overlap_up_4_6: h_var_6 + y_grid_var_6 - EMIB_y_grid_var_4_6
   - 246 z2U_4_6 >= -245.001
 EMIB_top_overlap_up_4_6: EMIB_h_var_4_6 - y_grid_var_4
   + EMIB_y_grid_var_4_6 - 246 z2U_4_6 >= -245.001
 shared_yi_ub1_4_6: h_var_4 - EMIB_h_var_4_6 + y_grid_var_4
   - EMIB_y_grid_var_4_6 - 246 z1_4_6 >= -246
 shared_yi_ub2_4_6: y_grid_var_4 - EMIB_y_grid_var_4_6 + 246 z1_4_6 <= 246
 shared_yj_ub1_4_6: h_var_6 - EMIB_h_var_4_6 + y_grid_var_6
   - EMIB_y_grid_var_4_6 - 246 z1_4_6 >= -246
 shared_yj_ub2_4_6: y_grid_var_6 - EMIB_y_grid_var_4_6 + 246 z1_4_6 <= 246
 shared_xi_ub1_4_6: w_var_4 - EMIB_w_var_4_6 + x_grid_var_4
   - EMIB_x_grid_var_4_6 - 246 z2_4_6 >= -246
 shared_xi_ub2_4_6: x_grid_var_4 - EMIB_x_grid_var_4_6 + 246 z2_4_6 <= 246
 shared_xj_ub1_4_6: w_var_6 - EMIB_w_var_4_6 + x_grid_var_6
   - EMIB_x_grid_var_4_6 - 246 z2_4_6 >= -246
 shared_xj_ub2_4_6: x_grid_var_6 - EMIB_x_grid_var_4_6 + 246 z2_4_6 <= 246
 must_adjacent_sb_8_9: z1_8_9 + z2_8_9 = 1
 horizontal_direction_sb_8_9: - z1_8_9 + z1L_8_9 + z1R_8_9 = 0
 vertical_direction_sb_8_9: - z2_8_9 + z2D_8_9 + z2U_8_9 = 0
 EMIB_rotate_eq_z2_8_9: r_EMIB_8_9 - z2_8_9 = 0
 horizontal_left_dist_lb_8_9: - w_var_8 - x_grid_var_8 + x_grid_var_9
   - 246 z1L_8_9 >= -246
 EMIB_left_overlap_8_9: w_var_8 + x_grid_var_8 - EMIB_x_grid_var_8_9
   - 246 z1L_8_9 >= -245.001
 EMIB_right_overlap_8_9: EMIB_w_var_8_9 - x_grid_var_9
   + EMIB_x_grid_var_8_9 - 246 z1L_8_9 >= -245.001
 horizontal_right_dist_lb_8_9: - w_var_9 + x_grid_var_8 - x_grid_var_9
   - 246 z1R_8_9 >= -246
 EMIB_left_overlap_right_8_9: w_var_9 + x_grid_var_9 - EMIB_x_grid_var_8_9
   - 246 z1R_8_9 >= -245.001
 EMIB_right_overlap_right_8_9: EMIB_w_var_8_9 - x_grid_var_8
   + EMIB_x_grid_var_8_9 - 246 z1R_8_9 >= -245.001
 vertical_down_dist_lb_8_9: - h_var_8 - y_grid_var_8 + y_grid_var_9
   - 246 z2D_8_9 >= -246
 EMIB_bottom_overlap_down_8_9: h_var_8 + y_grid_var_8 - EMIB_y_grid_var_8_9
   - 246 z2D_8_9 >= -245.001
 EMIB_top_overlap_down_8_9: EMIB_h_var_8_9 - y_grid_var_9
   + EMIB_y_grid_var_8_9 - 246 z2D_8_9 >= -245.001
 vertical_up_dist_lb_8_9: - h_var_9 + y_grid_var_8 - y_grid_var_9
   - 246 z2U_8_9 >= -246
 EMIB_bottom_overlap_up_8_9: h_var_9 + y_grid_var_9 - EMIB_y_grid_var_8_9
   - 246 z2U_8_9 >= -245.001
 EMIB_top_overlap_up_8_9: EMIB_h_var_8_9 - y_grid_var_8
   + EMIB_y_grid_var_8_9 - 246 z2U_8_9 >= -245.001
 shared_yi_ub1_8_9: h_var_8 - EMIB_h_var_8_9 + y_grid_var_8
   - EMIB_y_grid_var_8_9 - 246 z1_8_9 >= -246
 shared_yi_ub2_8_9: y_grid_var_8 - EMIB_y_grid_var_8_9 + 246 z1_8_9 <= 246
 shared_yj_ub1_8_9: h_var_9 - EMIB_h_var_8_9 + y_grid_var_9
   - EMIB_y_grid_var_8_9 - 246 z1_8_9 >= -246
 shared_yj_ub2_8_9: y_grid_var_9 - EMIB_y_grid_var_8_9 + 246 z1_8_9 <= 246
 shared_xi_ub1_8_9: w_var_8 - EMIB_w_var_8_9 + x_grid_var_8
   - EMIB_x_grid_var_8_9 - 246 z2_8_9 >= -246
 shared_xi_ub2_8_9: x_grid_var_8 - EMIB_x_grid_var_8_9 + 246 z2_8_9 <= 246
 shared_xj_ub1_8_9: w_var_9 - EMIB_w_var_8_9 + x_grid_var_9
   - EMIB_x_grid_var_8_9 - 246 z2_8_9 >= -246
 shared_xj_ub2_8_9: x_grid_var_9 - EMIB_x_grid_var_8_9 + 246 z2_8_9 <= 246
 non_overlap_any_0_1: p_left_0_1 + p_right_0_1 + p_down_0_1 + p_up_0_1
   >= 1
 non_overlap_left_0_1: w_var_0 + x_grid_var_0 - x_grid_var_1
   + 246 p_left_0_1 <= 246
 non_overlap_left_rev_0_1: - w_var_0 - x_grid_var_0 + x_grid_var_1
   - 246 p_left_0_1 <= 0
 non_overlap_right_0_1: w_var_1 - x_grid_var_0 + x_grid_var_1
   + 246 p_right_0_1 <= 246
 non_overlap_right_rev_0_1: - w_var_1 + x_grid_var_0 - x_grid_var_1
   - 246 p_right_0_1 <= 0
 non_overlap_down_0_1: h_var_0 + y_grid_var_0 - y_grid_var_1
   + 246 p_down_0_1 <= 246
 non_overlap_down_rev_0_1: - h_var_0 - y_grid_var_0 + y_grid_var_1
   - 246 p_down_0_1 <= 0
 non_overlap_up_0_1: h_var_1 - y_grid_var_0 + y_grid_var_1 + 246 p_up_0_1
   <= 246
 non_overlap_up_rev_0_1: - h_var_1 + y_grid_var_0 - y_grid_var_1
   - 246 p_up_0_1 <= 0
 non_overlap_any_0_2: p_left_0_2 + p_right_0_2 + p_down_0_2 + p_up_0_2
   >= 1
 non_overlap_left_0_2: w_var_0 + x_grid_var_0 - x_grid_var_2
   + 246 p_left_0_2 <= 246
 non_overlap_left_rev_0_2: - w_var_0 - x_grid_var_0 + x_grid_var_2
   - 246 p_left_0_2 <= 0
 non_overlap_right_0_2: w_var_2 - x_grid_var_0 + x_grid_var_2
   + 246 p_right_0_2 <= 246
 non_overlap_right_rev_0_2: - w_var_2 + x_grid_var_0 - x_grid_var_2
   - 246 p_right_0_2 <= 0
 non_overlap_down_0_2: h_var_0 + y_grid_var_0 - y_grid_var_2
   + 246 p_down_0_2 <= 246
 non_overlap_down_rev_0_2: - h_var_0 - y_grid_var_0 + y_grid_var_2
   - 246 p_down_0_2 <= 0
 non_overlap_up_0_2: h_var_2 - y_grid_var_0 + y_grid_var_2 + 246 p_up_0_2
   <= 246
 non_overlap_up_rev_0_2: - h_var_2 + y_grid_var_0 - y_grid_var_2
   - 246 p_up_0_2 <= 0
 non_overlap_any_0_3: p_left_0_3 + p_right_0_3 + p_down_0_3 + p_up_0_3
   >= 1
 non_overlap_left_0_3: w_var_0 + x_grid_var_0 - x_grid_var_3
   + 246 p_left_0_3 <= 246
 non_overlap_left_rev_0_3: - w_var_0 - x_grid_var_0 + x_grid_var_3
   - 246 p_left_0_3 <= 0
 non_overlap_right_0_3: w_var_3 - x_grid_var_0 + x_grid_var_3
   + 246 p_right_0_3 <= 246
 non_overlap_right_rev_0_3: - w_var_3 + x_grid_var_0 - x_grid_var_3
   - 246 p_right_0_3 <= 0
 non_overlap_down_0_3: h_var_0 + y_grid_var_0 - y_grid_var_3
   + 246 p_down_0_3 <= 246
 non_overlap_down_rev_0_3: - h_var_0 - y_grid_var_0 + y_grid_var_3
   - 246 p_down_0_3 <= 0
 non_overlap_up_0_3: h_var_3 - y_grid_var_0 + y_grid_var_3 + 246 p_up_0_3
   <= 246
 non_overlap_up_rev_0_3: - h_var_3 + y_grid_var_0 - y_grid_var_3
   - 246 p_up_0_3 <= 0
 non_overlap_any_0_4: p_left_0_4 + p_right_0_4 + p_down_0_4 + p_up_0_4
   >= 1
 non_overlap_left_0_4: w_var_0 + x_grid_var_0 - x_grid_var_4
   + 246 p_left_0_4 <= 246
 non_overlap_left_rev_0_4: - w_var_0 - x_grid_var_0 + x_grid_var_4
   - 246 p_left_0_4 <= 0
 non_overlap_right_0_4: w_var_4 - x_grid_var_0 + x_grid_var_4
   + 246 p_right_0_4 <= 246
 non_overlap_right_rev_0_4: - w_var_4 + x_grid_var_0 - x_grid_var_4
   - 246 p_right_0_4 <= 0
 non_overlap_down_0_4: h_var_0 + y_grid_var_0 - y_grid_var_4
   + 246 p_down_0_4 <= 246
 non_overlap_down_rev_0_4: - h_var_0 - y_grid_var_0 + y_grid_var_4
   - 246 p_down_0_4 <= 0
 non_overlap_up_0_4: h_var_4 - y_grid_var_0 + y_grid_var_4 + 246 p_up_0_4
   <= 246
 non_overlap_up_rev_0_4: - h_var_4 + y_grid_var_0 - y_grid_var_4
   - 246 p_up_0_4 <= 0
 non_overlap_any_0_5: p_left_0_5 + p_right_0_5 + p_down_0_5 + p_up_0_5
   >= 1
 non_overlap_left_0_5: w_var_0 + x_grid_var_0 - x_grid_var_5
   + 246 p_left_0_5 <= 246
 non_overlap_left_rev_0_5: - w_var_0 - x_grid_var_0 + x_grid_var_5
   - 246 p_left_0_5 <= 0
 non_overlap_right_0_5: w_var_5 - x_grid_var_0 + x_grid_var_5
   + 246 p_right_0_5 <= 246
 non_overlap_right_rev_0_5: - w_var_5 + x_grid_var_0 - x_grid_var_5
   - 246 p_right_0_5 <= 0
 non_overlap_down_0_5: h_var_0 + y_grid_var_0 - y_grid_var_5
   + 246 p_down_0_5 <= 246
 non_overlap_down_rev_0_5: - h_var_0 - y_grid_var_0 + y_grid_var_5
   - 246 p_down_0_5 <= 0
 non_overlap_up_0_5: h_var_5 - y_grid_var_0 + y_grid_var_5 + 246 p_up_0_5
   <= 246
 non_overlap_up_rev_0_5: - h_var_5 + y_grid_var_0 - y_grid_var_5
   - 246 p_up_0_5 <= 0
 non_overlap_any_0_6: p_left_0_6 + p_right_0_6 + p_down_0_6 + p_up_0_6
   >= 1
 non_overlap_left_0_6: w_var_0 + x_grid_var_0 - x_grid_var_6
   + 246 p_left_0_6 <= 246
 non_overlap_left_rev_0_6: - w_var_0 - x_grid_var_0 + x_grid_var_6
   - 246 p_left_0_6 <= 0
 non_overlap_right_0_6: w_var_6 - x_grid_var_0 + x_grid_var_6
   + 246 p_right_0_6 <= 246
 non_overlap_right_rev_0_6: - w_var_6 + x_grid_var_0 - x_grid_var_6
   - 246 p_right_0_6 <= 0
 non_overlap_down_0_6: h_var_0 + y_grid_var_0 - y_grid_var_6
   + 246 p_down_0_6 <= 246
 non_overlap_down_rev_0_6: - h_var_0 - y_grid_var_0 + y_grid_var_6
   - 246 p_down_0_6 <= 0
 non_overlap_up_0_6: h_var_6 - y_grid_var_0 + y_grid_var_6 + 246 p_up_0_6
   <= 246
 non_overlap_up_rev_0_6: - h_var_6 + y_grid_var_0 - y_grid_var_6
   - 246 p_up_0_6 <= 0
 non_overlap_any_0_7: p_left_0_7 + p_right_0_7 + p_down_0_7 + p_up_0_7
   >= 1
 non_overlap_left_0_7: w_var_0 + x_grid_var_0 - x_grid_var_7
   + 246 p_left_0_7 <= 246
 non_overlap_left_rev_0_7: - w_var_0 - x_grid_var_0 + x_grid_var_7
   - 246 p_left_0_7 <= 0
 non_overlap_right_0_7: w_var_7 - x_grid_var_0 + x_grid_var_7
   + 246 p_right_0_7 <= 246
 non_overlap_right_rev_0_7: - w_var_7 + x_grid_var_0 - x_grid_var_7
   - 246 p_right_0_7 <= 0
 non_overlap_down_0_7: h_var_0 + y_grid_var_0 - y_grid_var_7
   + 246 p_down_0_7 <= 246
 non_overlap_down_rev_0_7: - h_var_0 - y_grid_var_0 + y_grid_var_7
   - 246 p_down_0_7 <= 0
 non_overlap_up_0_7: h_var_7 - y_grid_var_0 + y_grid_var_7 + 246 p_up_0_7
   <= 246
 non_overlap_up_rev_0_7: - h_var_7 + y_grid_var_0 - y_grid_var_7
   - 246 p_up_0_7 <= 0
 non_overlap_any_0_8: p_left_0_8 + p_right_0_8 + p_down_0_8 + p_up_0_8
   >= 1
 non_overlap_left_0_8: w_var_0 + x_grid_var_0 - x_grid_var_8
   + 246 p_left_0_8 <= 246
 non_overlap_left_rev_0_8: - w_var_0 - x_grid_var_0 + x_grid_var_8
   - 246 p_left_0_8 <= 0
 non_overlap_right_0_8: w_var_8 - x_grid_var_0 + x_grid_var_8
   + 246 p_right_0_8 <= 246
 non_overlap_right_rev_0_8: - w_var_8 + x_grid_var_0 - x_grid_var_8
   - 246 p_right_0_8 <= 0
 non_overlap_down_0_8: h_var_0 + y_grid_var_0 - y_grid_var_8
   + 246 p_down_0_8 <= 246
 non_overlap_down_rev_0_8: - h_var_0 - y_grid_var_0 + y_grid_var_8
   - 246 p_down_0_8 <= 0
 non_overlap_up_0_8: h_var_8 - y_grid_var_0 + y_grid_var_8 + 246 p_up_0_8
   <= 246
 non_overlap_up_rev_0_8: - h_var_8 + y_grid_var_0 - y_grid_var_8
   - 246 p_up_0_8 <= 0
 non_overlap_any_0_9: p_left_0_9 + p_right_0_9 + p_down_0_9 + p_up_0_9
   >= 1
 non_overlap_left_0_9: w_var_0 + x_grid_var_0 - x_grid_var_9
   + 246 p_left_0_9 <= 246
 non_overlap_left_rev_0_9: - w_var_0 - x_grid_var_0 + x_grid_var_9
   - 246 p_left_0_9 <= 0
 non_overlap_right_0_9: w_var_9 - x_grid_var_0 + x_grid_var_9
   + 246 p_right_0_9 <= 246
 non_overlap_right_rev_0_9: - w_var_9 + x_grid_var_0 - x_grid_var_9
   - 246 p_right_0_9 <= 0
 non_overlap_down_0_9: h_var_0 + y_grid_var_0 - y_grid_var_9
   + 246 p_down_0_9 <= 246
 non_overlap_down_rev_0_9: - h_var_0 - y_grid_var_0 + y_grid_var_9
   - 246 p_down_0_9 <= 0
 non_overlap_up_0_9: h_var_9 - y_grid_var_0 + y_grid_var_9 + 246 p_up_0_9
   <= 246
 non_overlap_up_rev_0_9: - h_var_9 + y_grid_var_0 - y_grid_var_9
   - 246 p_up_0_9 <= 0
 non_overlap_any_1_2: p_left_1_2 + p_right_1_2 + p_down_1_2 + p_up_1_2
   >= 1
 non_overlap_left_1_2: w_var_1 + x_grid_var_1 - x_grid_var_2
   + 246 p_left_1_2 <= 246
 non_overlap_left_rev_1_2: - w_var_1 - x_grid_var_1 + x_grid_var_2
   - 246 p_left_1_2 <= 0
 non_overlap_right_1_2: w_var_2 - x_grid_var_1 + x_grid_var_2
   + 246 p_right_1_2 <= 246
 non_overlap_right_rev_1_2: - w_var_2 + x_grid_var_1 - x_grid_var_2
   - 246 p_right_1_2 <= 0
 non_overlap_down_1_2: h_var_1 + y_grid_var_1 - y_grid_var_2
   + 246 p_down_1_2 <= 246
 non_overlap_down_rev_1_2: - h_var_1 - y_grid_var_1 + y_grid_var_2
   - 246 p_down_1_2 <= 0
 non_overlap_up_1_2: h_var_2 - y_grid_var_1 + y_grid_var_2 + 246 p_up_1_2
   <= 246
 non_overlap_up_rev_1_2: - h_var_2 + y_grid_var_1 - y_grid_var_2
   - 246 p_up_1_2 <= 0
 non_overlap_any_1_3: p_left_1_3 + p_right_1_3 + p_down_1_3 + p_up_1_3
   >= 1
 non_overlap_left_1_3: w_var_1 + x_grid_var_1 - x_grid_var_3
   + 246 p_left_1_3 <= 246
 non_overlap_left_rev_1_3: - w_var_1 - x_grid_var_1 + x_grid_var_3
   - 246 p_left_1_3 <= 0
 non_overlap_right_1_3: w_var_3 - x_grid_var_1 + x_grid_var_3
   + 246 p_right_1_3 <= 246
 non_overlap_right_rev_1_3: - w_var_3 + x_grid_var_1 - x_grid_var_3
   - 246 p_right_1_3 <= 0
 non_overlap_down_1_3: h_var_1 + y_grid_var_1 - y_grid_var_3
   + 246 p_down_1_3 <= 246
 non_overlap_down_rev_1_3: - h_var_1 - y_grid_var_1 + y_grid_var_3
   - 246 p_down_1_3 <= 0
 non_overlap_up_1_3: h_var_3 - y_grid_var_1 + y_grid_var_3 + 246 p_up_1_3
   <= 246
 non_overlap_up_rev_1_3: - h_var_3 + y_grid_var_1 - y_grid_var_3
   - 246 p_up_1_3 <= 0
 non_overlap_any_1_4: p_left_1_4 + p_right_1_4 + p_down_1_4 + p_up_1_4
   >= 1
 non_overlap_left_1_4: w_var_1 + x_grid_var_1 - x_grid_var_4
   + 246 p_left_1_4 <= 246
 non_overlap_left_rev_1_4: - w_var_1 - x_grid_var_1 + x_grid_var_4
   - 246 p_left_1_4 <= 0
 non_overlap_right_1_4: w_var_4 - x_grid_var_1 + x_grid_var_4
   + 246 p_right_1_4 <= 246
 non_overlap_right_rev_1_4: - w_var_4 + x_grid_var_1 - x_grid_var_4
   - 246 p_right_1_4 <= 0
 non_overlap_down_1_4: h_var_1 + y_grid_var_1 - y_grid_var_4
   + 246 p_down_1_4 <= 246
 non_overlap_down_rev_1_4: - h_var_1 - y_grid_var_1 + y_grid_var_4
   - 246 p_down_1_4 <= 0
 non_overlap_up_1_4: h_var_4 - y_grid_var_1 + y_grid_var_4 + 246 p_up_1_4
   <= 246
 non_overlap_up_rev_1_4: - h_var_4 + y_grid_var_1 - y_grid_var_4
   - 246 p_up_1_4 <= 0
 non_overlap_any_1_5: p_left_1_5 + p_right_1_5 + p_down_1_5 + p_up_1_5
   >= 1
 non_overlap_left_1_5: w_var_1 + x_grid_var_1 - x_grid_var_5
   + 246 p_left_1_5 <= 246
 non_overlap_left_rev_1_5: - w_var_1 - x_grid_var_1 + x_grid_var_5
   - 246 p_left_1_5 <= 0
 non_overlap_right_1_5: w_var_5 - x_grid_var_1 + x_grid_var_5
   + 246 p_right_1_5 <= 246
 non_overlap_right_rev_1_5: - w_var_5 + x_grid_var_1 - x_grid_var_5
   - 246 p_right_1_5 <= 0
 non_overlap_down_1_5: h_var_1 + y_grid_var_1 - y_grid_var_5
   + 246 p_down_1_5 <= 246
 non_overlap_down_rev_1_5: - h_var_1 - y_grid_var_1 + y_grid_var_5
   - 246 p_down_1_5 <= 0
 non_overlap_up_1_5: h_var_5 - y_grid_var_1 + y_grid_var_5 + 246 p_up_1_5
   <= 246
 non_overlap_up_rev_1_5: - h_var_5 + y_grid_var_1 - y_grid_var_5
   - 246 p_up_1_5 <= 0
 non_overlap_any_1_6: p_left_1_6 + p_right_1_6 + p_down_1_6 + p_up_1_6
   >= 1
 non_overlap_left_1_6: w_var_1 + x_grid_var_1 - x_grid_var_6
   + 246 p_left_1_6 <= 246
 non_overlap_left_rev_1_6: - w_var_1 - x_grid_var_1 + x_grid_var_6
   - 246 p_left_1_6 <= 0
 non_overlap_right_1_6: w_var_6 - x_grid_var_1 + x_grid_var_6
   + 246 p_right_1_6 <= 246
 non_overlap_right_rev_1_6: - w_var_6 + x_grid_var_1 - x_grid_var_6
   - 246 p_right_1_6 <= 0
 non_overlap_down_1_6: h_var_1 + y_grid_var_1 - y_grid_var_6
   + 246 p_down_1_6 <= 246
 non_overlap_down_rev_1_6: - h_var_1 - y_grid_var_1 + y_grid_var_6
   - 246 p_down_1_6 <= 0
 non_overlap_up_1_6: h_var_6 - y_grid_var_1 + y_grid_var_6 + 246 p_up_1_6
   <= 246
 non_overlap_up_rev_1_6: - h_var_6 + y_grid_var_1 - y_grid_var_6
   - 246 p_up_1_6 <= 0
 non_overlap_any_1_7: p_left_1_7 + p_right_1_7 + p_down_1_7 + p_up_1_7
   >= 1
 non_overlap_left_1_7: w_var_1 + x_grid_var_1 - x_grid_var_7
   + 246 p_left_1_7 <= 246
 non_overlap_left_rev_1_7: - w_var_1 - x_grid_var_1 + x_grid_var_7
   - 246 p_left_1_7 <= 0
 non_overlap_right_1_7: w_var_7 - x_grid_var_1 + x_grid_var_7
   + 246 p_right_1_7 <= 246
 non_overlap_right_rev_1_7: - w_var_7 + x_grid_var_1 - x_grid_var_7
   - 246 p_right_1_7 <= 0
 non_overlap_down_1_7: h_var_1 + y_grid_var_1 - y_grid_var_7
   + 246 p_down_1_7 <= 246
 non_overlap_down_rev_1_7: - h_var_1 - y_grid_var_1 + y_grid_var_7
   - 246 p_down_1_7 <= 0
 non_overlap_up_1_7: h_var_7 - y_grid_var_1 + y_grid_var_7 + 246 p_up_1_7
   <= 246
 non_overlap_up_rev_1_7: - h_var_7 + y_grid_var_1 - y_grid_var_7
   - 246 p_up_1_7 <= 0
 non_overlap_any_1_8: p_left_1_8 + p_right_1_8 + p_down_1_8 + p_up_1_8
   >= 1
 non_overlap_left_1_8: w_var_1 + x_grid_var_1 - x_grid_var_8
   + 246 p_left_1_8 <= 246
 non_overlap_left_rev_1_8: - w_var_1 - x_grid_var_1 + x_grid_var_8
   - 246 p_left_1_8 <= 0
 non_overlap_right_1_8: w_var_8 - x_grid_var_1 + x_grid_var_8
   + 246 p_right_1_8 <= 246
 non_overlap_right_rev_1_8: - w_var_8 + x_grid_var_1 - x_grid_var_8
   - 246 p_right_1_8 <= 0
 non_overlap_down_1_8: h_var_1 + y_grid_var_1 - y_grid_var_8
   + 246 p_down_1_8 <= 246
 non_overlap_down_rev_1_8: - h_var_1 - y_grid_var_1 + y_grid_var_8
   - 246 p_down_1_8 <= 0
 non_overlap_up_1_8: h_var_8 - y_grid_var_1 + y_grid_var_8 + 246 p_up_1_8
   <= 246
 non_overlap_up_rev_1_8: - h_var_8 + y_grid_var_1 - y_grid_var_8
   - 246 p_up_1_8 <= 0
 non_overlap_any_1_9: p_left_1_9 + p_right_1_9 + p_down_1_9 + p_up_1_9
   >= 1
 non_overlap_left_1_9: w_var_1 + x_grid_var_1 - x_grid_var_9
   + 246 p_left_1_9 <= 246
 non_overlap_left_rev_1_9: - w_var_1 - x_grid_var_1 + x_grid_var_9
   - 246 p_left_1_9 <= 0
 non_overlap_right_1_9: w_var_9 - x_grid_var_1 + x_grid_var_9
   + 246 p_right_1_9 <= 246
 non_overlap_right_rev_1_9: - w_var_9 + x_grid_var_1 - x_grid_var_9
   - 246 p_right_1_9 <= 0
 non_overlap_down_1_9: h_var_1 + y_grid_var_1 - y_grid_var_9
   + 246 p_down_1_9 <= 246
 non_overlap_down_rev_1_9: - h_var_1 - y_grid_var_1 + y_grid_var_9
   - 246 p_down_1_9 <= 0
 non_overlap_up_1_9: h_var_9 - y_grid_var_1 + y_grid_var_9 + 246 p_up_1_9
   <= 246
 non_overlap_up_rev_1_9: - h_var_9 + y_grid_var_1 - y_grid_var_9
   - 246 p_up_1_9 <= 0
 non_overlap_any_2_3: p_left_2_3 + p_right_2_3 + p_down_2_3 + p_up_2_3
   >= 1
 non_overlap_left_2_3: w_var_2 + x_grid_var_2 - x_grid_var_3
   + 246 p_left_2_3 <= 246
 non_overlap_left_rev_2_3: - w_var_2 - x_grid_var_2 + x_grid_var_3
   - 246 p_left_2_3 <= 0
 non_overlap_right_2_3: w_var_3 - x_grid_var_2 + x_grid_var_3
   + 246 p_right_2_3 <= 246
 non_overlap_right_rev_2_3: - w_var_3 + x_grid_var_2 - x_grid_var_3
   - 246 p_right_2_3 <= 0
 non_overlap_down_2_3: h_var_2 + y_grid_var_2 - y_grid_var_3
   + 246 p_down_2_3 <= 246
 non_overlap_down_rev_2_3: - h_var_2 - y_grid_var_2 + y_grid_var_3
   - 246 p_down_2_3 <= 0
 non_overlap_up_2_3: h_var_3 - y_grid_var_2 + y_grid_var_3 + 246 p_up_2_3
   <= 246
 non_overlap_up_rev_2_3: - h_var_3 + y_grid_var_2 - y_grid_var_3
   - 246 p_up_2_3 <= 0
 non_overlap_any_2_4: p_left_2_4 + p_right_2_4 + p_down_2_4 + p_up_2_4
   >= 1
 non_overlap_left_2_4: w_var_2 + x_grid_var_2 - x_grid_var_4
   + 246 p_left_2_4 <= 246
 non_overlap_left_rev_2_4: - w_var_2 - x_grid_var_2 + x_grid_var_4
   - 246 p_left_2_4 <= 0
 non_overlap_right_2_4: w_var_4 - x_grid_var_2 + x_grid_var_4
   + 246 p_right_2_4 <= 246
 non_overlap_right_rev_2_4: - w_var_4 + x_grid_var_2 - x_grid_var_4
   - 246 p_right_2_4 <= 0
 non_overlap_down_2_4: h_var_2 + y_grid_var_2 - y_grid_var_4
   + 246 p_down_2_4 <= 246
 non_overlap_down_rev_2_4: - h_var_2 - y_grid_var_2 + y_grid_var_4
   - 246 p_down_2_4 <= 0
 non_overlap_up_2_4: h_var_4 - y_grid_var_2 + y_grid_var_4 + 246 p_up_2_4
   <= 246
 non_overlap_up_rev_2_4: - h_var_4 + y_grid_var_2 - y_grid_var_4
   - 246 p_up_2_4 <= 0
 non_overlap_any_2_5: p_left_2_5 + p_right_2_5 + p_down_2_5 + p_up_2_5
   >= 1
 non_overlap_left_2_5: w_var_2 + x_grid_var_2 - x_grid_var_5
   + 246 p_left_2_5 <= 246
 non_overlap_left_rev_2_5: - w_var_2 - x_grid_var_2 + x_grid_var_5
   - 246 p_left_2_5 <= 0
 non_overlap_right_2_5: w_var_5 - x_grid_var_2 + x_grid_var_5
   + 246 p_right_2_5 <= 246
 non_overlap_right_rev_2_5: - w_var_5 + x_grid_var_2 - x_grid_var_5
   - 246 p_right_2_5 <= 0
 non_overlap_down_2_5: h_var_2 + y_grid_var_2 - y_grid_var_5
   + 246 p_down_2_5 <= 246
 non_overlap_down_rev_2_5: - h_var_2 - y_grid_var_2 + y_grid_var_5
   - 246 p_down_2_5 <= 0
 non_overlap_up_2_5: h_var_5 - y_grid_var_2 + y_grid_var_5 + 246 p_up_2_5
   <= 246
 non_overlap_up_rev_2_5: - h_var_5 + y_grid_var_2 - y_grid_var_5
   - 246 p_up_2_5 <= 0
 non_overlap_any_2_6: p_left_2_6 + p_right_2_6 + p_down_2_6 + p_up_2_6
   >= 1
 non_overlap_left_2_6: w_var_2 + x_grid_var_2 - x_grid_var_6
   + 246 p_left_2_6 <= 246
 non_overlap_left_rev_2_6: - w_var_2 - x_grid_var_2 + x_grid_var_6
   - 246 p_left_2_6 <= 0
 non_overlap_right_2_6: w_var_6 - x_grid_var_2 + x_grid_var_6
   + 246 p_right_2_6 <= 246
 non_overlap_right_rev_2_6: - w_var_6 + x_grid_var_2 - x_grid_var_6
   - 246 p_right_2_6 <= 0
 non_overlap_down_2_6: h_var_2 + y_grid_var_2 - y_grid_var_6
   + 246 p_down_2_6 <= 246
 non_overlap_down_rev_2_6: - h_var_2 - y_grid_var_2 + y_grid_var_6
   - 246 p_down_2_6 <= 0
 non_overlap_up_2_6: h_var_6 - y_grid_var_2 + y_grid_var_6 + 246 p_up_2_6
   <= 246
 non_overlap_up_rev_2_6: - h_var_6 + y_grid_var_2 - y_grid_var_6
   - 246 p_up_2_6 <= 0
 non_overlap_any_2_7: p_left_2_7 + p_right_2_7 + p_down_2_7 + p_up_2_7
   >= 1
 non_overlap_left_2_7: w_var_2 + x_grid_var_2 - x_grid_var_7
   + 246 p_left_2_7 <= 246
 non_overlap_left_rev_2_7: - w_var_2 - x_grid_var_2 + x_grid_var_7
   - 246 p_left_2_7 <= 0
 non_overlap_right_2_7: w_var_7 - x_grid_var_2 + x_grid_var_7
   + 246 p_right_2_7 <= 246
 non_overlap_right_rev_2_7: - w_var_7 + x_grid_var_2 - x_grid_var_7
   - 246 p_right_2_7 <= 0
 non_overlap_down_2_7: h_var_2 + y_grid_var_2 - y_grid_var_7
   + 246 p_down_2_7 <= 246
 non_overlap_down_rev_2_7: - h_var_2 - y_grid_var_2 + y_grid_var_7
   - 246 p_down_2_7 <= 0
 non_overlap_up_2_7: h_var_7 - y_grid_var_2 + y_grid_var_7 + 246 p_up_2_7
   <= 246
 non_overlap_up_rev_2_7: - h_var_7 + y_grid_var_2 - y_grid_var_7
   - 246 p_up_2_7 <= 0
 non_overlap_any_2_8: p_left_2_8 + p_right_2_8 + p_down_2_8 + p_up_2_8
   >= 1
 non_overlap_left_2_8: w_var_2 + x_grid_var_2 - x_grid_var_8
   + 246 p_left_2_8 <= 246
 non_overlap_left_rev_2_8: - w_var_2 - x_grid_var_2 + x_grid_var_8
   - 246 p_left_2_8 <= 0
 non_overlap_right_2_8: w_var_8 - x_grid_var_2 + x_grid_var_8
   + 246 p_right_2_8 <= 246
 non_overlap_right_rev_2_8: - w_var_8 + x_grid_var_2 - x_grid_var_8
   - 246 p_right_2_8 <= 0
 non_overlap_down_2_8: h_var_2 + y_grid_var_2 - y_grid_var_8
   + 246 p_down_2_8 <= 246
 non_overlap_down_rev_2_8: - h_var_2 - y_grid_var_2 + y_grid_var_8
   - 246 p_down_2_8 <= 0
 non_overlap_up_2_8: h_var_8 - y_grid_var_2 + y_grid_var_8 + 246 p_up_2_8
   <= 246
 non_overlap_up_rev_2_8: - h_var_8 + y_grid_var_2 - y_grid_var_8
   - 246 p_up_2_8 <= 0
 non_overlap_any_2_9: p_left_2_9 + p_right_2_9 + p_down_2_9 + p_up_2_9
   >= 1
 non_overlap_left_2_9: w_var_2 + x_grid_var_2 - x_grid_var_9
   + 246 p_left_2_9 <= 246
 non_overlap_left_rev_2_9: - w_var_2 - x_grid_var_2 + x_grid_var_9
   - 246 p_left_2_9 <= 0
 non_overlap_right_2_9: w_var_9 - x_grid_var_2 + x_grid_var_9
   + 246 p_right_2_9 <= 246
 non_overlap_right_rev_2_9: - w_var_9 + x_grid_var_2 - x_grid_var_9
   - 246 p_right_2_9 <= 0
 non_overlap_down_2_9: h_var_2 + y_grid_var_2 - y_grid_var_9
   + 246 p_down_2_9 <= 246
 non_overlap_down_rev_2_9: - h_var_2 - y_grid_var_2 + y_grid_var_9
   - 246 p_down_2_9 <= 0
 non_overlap_up_2_9: h_var_9 - y_grid_var_2 + y_grid_var_9 + 246 p_up_2_9
   <= 246
 non_overlap_up_rev_2_9: - h_var_9 + y_grid_var_2 - y_grid_var_9
   - 246 p_up_2_9 <= 0
 non_overlap_any_3_4: p_left_3_4 + p_right_3_4 + p_down_3_4 + p_up_3_4
   >= 1
 non_overlap_left_3_4: w_var_3 + x_grid_var_3 - x_grid_var_4
   + 246 p_left_3_4 <= 246
 non_overlap_left_rev_3_4: - w_var_3 - x_grid_var_3 + x_grid_var_4
   - 246 p_left_3_4 <= 0
 non_overlap_right_3_4: w_var_4 - x_grid_var_3 + x_grid_var_4
   + 246 p_right_3_4 <= 246
 non_overlap_right_rev_3_4: - w_var_4 + x_grid_var_3 - x_grid_var_4
   - 246 p_right_3_4 <= 0
 non_overlap_down_3_4: h_var_3 + y_grid_var_3 - y_grid_var_4
   + 246 p_down_3_4 <= 246
 non_overlap_down_rev_3_4: - h_var_3 - y_grid_var_3 + y_grid_var_4
   - 246 p_down_3_4 <= 0
 non_overlap_up_3_4: h_var_4 - y_grid_var_3 + y_grid_var_4 + 246 p_up_3_4
   <= 246
 non_overlap_up_rev_3_4: - h_var_4 + y_grid_var_3 - y_grid_var_4
   - 246 p_up_3_4 <= 0
 non_overlap_any_3_5: p_left_3_5 + p_right_3_5 + p_down_3_5 + p_up_3_5
   >= 1
 non_overlap_left_3_5: w_var_3 + x_grid_var_3 - x_grid_var_5
   + 246 p_left_3_5 <= 246
 non_overlap_left_rev_3_5: - w_var_3 - x_grid_var_3 + x_grid_var_5
   - 246 p_left_3_5 <= 0
 non_overlap_right_3_5: w_var_5 - x_grid_var_3 + x_grid_var_5
   + 246 p_right_3_5 <= 246
 non_overlap_right_rev_3_5: - w_var_5 + x_grid_var_3 - x_grid_var_5
   - 246 p_right_3_5 <= 0
 non_overlap_down_3_5: h_var_3 + y_grid_var_3 - y_grid_var_5
   + 246 p_down_3_5 <= 246
 non_overlap_down_rev_3_5: - h_var_3 - y_grid_var_3 + y_grid_var_5
   - 246 p_down_3_5 <= 0
 non_overlap_up_3_5: h_var_5 - y_grid_var_3 + y_grid_var_5 + 246 p_up_3_5
   <= 246
 non_overlap_up_rev_3_5: - h_var_5 + y_grid_var_3 - y_grid_var_5
   - 246 p_up_3_5 <= 0
 non_overlap_any_3_6: p_left_3_6 + p_right_3_6 + p_down_3_6 + p_up_3_6
   >= 1
 non_overlap_left_3_6: w_var_3 + x_grid_var_3 - x_grid_var_6
   + 246 p_left_3_6 <= 246
 non_overlap_left_rev_3_6: - w_var_3 - x_grid_var_3 + x_grid_var_6
   - 246 p_left_3_6 <= 0
 non_overlap_right_3_6: w_var_6 - x_grid_var_3 + x_grid_var_6
   + 246 p_right_3_6 <= 246
 non_overlap_right_rev_3_6: - w_var_6 + x_grid_var_3 - x_grid_var_6
   - 246 p_right_3_6 <= 0
 non_overlap_down_3_6: h_var_3 + y_grid_var_3 - y_grid_var_6
   + 246 p_down_3_6 <= 246
 non_overlap_down_rev_3_6: - h_var_3 - y_grid_var_3 + y_grid_var_6
   - 246 p_down_3_6 <= 0
 non_overlap_up_3_6: h_var_6 - y_grid_var_3 + y_grid_var_6 + 246 p_up_3_6
   <= 246
 non_overlap_up_rev_3_6: - h_var_6 + y_grid_var_3 - y_grid_var_6
   - 246 p_up_3_6 <= 0
 non_overlap_any_3_7: p_left_3_7 + p_right_3_7 + p_down_3_7 + p_up_3_7
   >= 1
 non_overlap_left_3_7: w_var_3 + x_grid_var_3 - x_grid_var_7
   + 246 p_left_3_7 <= 246
 non_overlap_left_rev_3_7: - w_var_3 - x_grid_var_3 + x_grid_var_7
   - 246 p_left_3_7 <= 0
 non_overlap_right_3_7: w_var_7 - x_grid_var_3 + x_grid_var_7
   + 246 p_right_3_7 <= 246
 non_overlap_right_rev_3_7: - w_var_7 + x_grid_var_3 - x_grid_var_7
   - 246 p_right_3_7 <= 0
 non_overlap_down_3_7: h_var_3 + y_grid_var_3 - y_grid_var_7
   + 246 p_down_3_7 <= 246
 non_overlap_down_rev_3_7: - h_var_3 - y_grid_var_3 + y_grid_var_7
   - 246 p_down_3_7 <= 0
 non_overlap_up_3_7: h_var_7 - y_grid_var_3 + y_grid_var_7 + 246 p_up_3_7
   <= 246
 non_overlap_up_rev_3_7: - h_var_7 + y_grid_var_3 - y_grid_var_7
   - 246 p_up_3_7 <= 0
 non_overlap_any_3_8: p_left_3_8 + p_right_3_8 + p_down_3_8 + p_up_3_8
   >= 1
 non_overlap_left_3_8: w_var_3 + x_grid_var_3 - x_grid_var_8
   + 246 p_left_3_8 <= 246
 non_overlap_left_rev_3_8: - w_var_3 - x_grid_var_3 + x_grid_var_8
   - 246 p_left_3_8 <= 0
 non_overlap_right_3_8: w_var_8 - x_grid_var_3 + x_grid_var_8
   + 246 p_right_3_8 <= 246
 non_overlap_right_rev_3_8: - w_var_8 + x_grid_var_3 - x_grid_var_8
   - 246 p_right_3_8 <= 0
 non_overlap_down_3_8: h_var_3 + y_grid_var_3 - y_grid_var_8
   + 246 p_down_3_8 <= 246
 non_overlap_down_rev_3_8: - h_var_3 - y_grid_var_3 + y_grid_var_8
   - 246 p_down_3_8 <= 0
 non_overlap_up_3_8: h_var_8 - y_grid_var_3 + y_grid_var_8 + 246 p_up_3_8
   <= 246
 non_overlap_up_rev_3_8: - h_var_8 + y_grid_var_3 - y_grid_var_8
   - 246 p_up_3_8 <= 0
 non_overlap_any_3_9: p_left_3_9 + p_right_3_9 + p_down_3_9 + p_up_3_9
   >= 1
 non_overlap_left_3_9: w_var_3 + x_grid_var_3 - x_grid_var_9
   + 246 p_left_3_9 <= 246
 non_overlap_left_rev_3_9: - w_var_3 - x_grid_var_3 + x_grid_var_9
   - 246 p_left_3_9 <= 0
 non_overlap_right_3_9: w_var_9 - x_grid_var_3 + x_grid_var_9
   + 246 p_right_3_9 <= 246
 non_overlap_right_rev_3_9: - w_var_9 + x_grid_var_3 - x_grid_var_9
   - 246 p_right_3_9 <= 0
 non_overlap_down_3_9: h_var_3 + y_grid_var_3 - y_grid_var_9
   + 246 p_down_3_9 <= 246
 non_overlap_down_rev_3_9: - h_var_3 - y_grid_var_3 + y_grid_var_9
   - 246 p_down_3_9 <= 0
 non_overlap_up_3_9: h_var_9 - y_grid_var_3 + y_grid_var_9 + 246 p_up_3_9
   <= 246
 non_overlap_up_rev_3_9: - h_var_9 + y_grid_var_3 - y_grid_var_9
   - 246 p_up_3_9 <= 0
 non_overlap_any_4_5: p_left_4_5 + p_right_4_5 + p_down_4_5 + p_up_4_5
   >= 1
 non_overlap_left_4_5: w_var_4 + x_grid_var_4 - x_grid_var_5
   + 246 p_left_4_5 <= 246
 non_overlap_left_rev_4_5: - w_var_4 - x_grid_var_4 + x_grid_var_5
   - 246 p_left_4_5 <= 0
 non_overlap_right_4_5: w_var_5 - x_grid_var_4 + x_grid_var_5
   + 246 p_right_4_5 <= 246
 non_overlap_right_rev_4_5: - w_var_5 + x_grid_var_4 - x_grid_var_5
   - 246 p_right_4_5 <= 0
 non_overlap_down_4_5: h_var_4 + y_grid_var_4 - y_grid_var_5
   + 246 p_down_4_5 <= 246
 non_overlap_down_rev_4_5: - h_var_4 - y_grid_var_4 + y_grid_var_5
   - 246 p_down_4_5 <= 0
 non_overlap_up_4_5: h_var_5 - y_grid_var_4 + y_grid_var_5 + 246 p_up_4_5
   <= 246
 non_overlap_up_rev_4_5: - h_var_5 + y_grid_var_4 - y_grid_var_5
   - 246 p_up_4_5 <= 0
 non_overlap_any_4_6: p_left_4_6 + p_right_4_6 + p_down_4_6 + p_up_4_6
   >= 1
 non_overlap_left_4_6: w_var_4 + x_grid_var_4 - x_grid_var_6
   + 246 p_left_4_6 <= 246
 non_overlap_left_rev_4_6: - w_var_4 - x_grid_var_4 + x_grid_var_6
   - 246 p_left_4_6 <= 0
 non_overlap_right_4_6: w_var_6 - x_grid_var_4 + x_grid_var_6
   + 246 p_right_4_6 <= 246
 non_overlap_right_rev_4_6: - w_var_6 + x_grid_var_4 - x_grid_var_6
   - 246 p_right_4_6 <= 0
 non_overlap_down_4_6: h_var_4 + y_grid_var_4 - y_grid_var_6
   + 246 p_down_4_6 <= 246
 non_overlap_down_rev_4_6: - h_var_4 - y_grid_var_4 + y_grid_var_6
   - 246 p_down_4_6 <= 0
 non_overlap_up_4_6: h_var_6 - y_grid_var_4 + y_grid_var_6 + 246 p_up_4_6
   <= 246
 non_overlap_up_rev_4_6: - h_var_6 + y_grid_var_4 - y_grid_var_6
   - 246 p_up_4_6 <= 0
 non_overlap_any_4_7: p_left_4_7 + p_right_4_7 + p_down_4_7 + p_up_4_7
   >= 1
 non_overlap_left_4_7: w_var_4 + x_grid_var_4 - x_grid_var_7
   + 246 p_left_4_7 <= 246
 non_overlap_left_rev_4_7: - w_var_4 - x_grid_var_4 + x_grid_var_7
   - 246 p_left_4_7 <= 0
 non_overlap_right_4_7: w_var_7 - x_grid_var_4 + x_grid_var_7
   + 246 p_right_4_7 <= 246
 non_overlap_right_rev_4_7: - w_var_7 + x_grid_var_4 - x_grid_var_7
   - 246 p_right_4_7 <= 0
 non_overlap_down_4_7: h_var_4 + y_grid_var_4 - y_grid_var_7
   + 246 p_down_4_7 <= 246
 non_overlap_down_rev_4_7: - h_var_4 - y_grid_var_4 + y_grid_var_7
   - 246 p_down_4_7 <= 0
 non_overlap_up_4_7: h_var_7 - y_grid_var_4 + y_grid_var_7 + 246 p_up_4_7
   <= 246
 non_overlap_up_rev_4_7: - h_var_7 + y_grid_var_4 - y_grid_var_7
   - 246 p_up_4_7 <= 0
 non_overlap_any_4_8: p_left_4_8 + p_right_4_8 + p_down_4_8 + p_up_4_8
   >= 1
 non_overlap_left_4_8: w_var_4 + x_grid_var_4 - x_grid_var_8
   + 246 p_left_4_8 <= 246
 non_overlap_left_rev_4_8: - w_var_4 - x_grid_var_4 + x_grid_var_8
   - 246 p_left_4_8 <= 0
 non_overlap_right_4_8: w_var_8 - x_grid_var_4 + x_grid_var_8
   + 246 p_right_4_8 <= 246
 non_overlap_right_rev_4_8: - w_var_8 + x_grid_var_4 - x_grid_var_8
   - 246 p_right_4_8 <= 0
 non_overlap_down_4_8: h_var_4 + y_grid_var_4 - y_grid_var_8
   + 246 p_down_4_8 <= 246
 non_overlap_down_rev_4_8: - h_var_4 - y_grid_var_4 + y_grid_var_8
   - 246 p_down_4_8 <= 0
 non_overlap_up_4_8: h_var_8 - y_grid_var_4 + y_grid_var_8 + 246 p_up_4_8
   <= 246
 non_overlap_up_rev_4_8: - h_var_8 + y_grid_var_4 - y_grid_var_8
   - 246 p_up_4_8 <= 0
 non_overlap_any_4_9: p_left_4_9 + p_right_4_9 + p_down_4_9 + p_up_4_9
   >= 1
 non_overlap_left_4_9: w_var_4 + x_grid_var_4 - x_grid_var_9
   + 246 p_left_4_9 <= 246
 non_overlap_left_rev_4_9: - w_var_4 - x_grid_var_4 + x_grid_var_9
   - 246 p_left_4_9 <= 0
 non_overlap_right_4_9: w_var_9 - x_grid_var_4 + x_grid_var_9
   + 246 p_right_4_9 <= 246
 non_overlap_right_rev_4_9: - w_var_9 + x_grid_var_4 - x_grid_var_9
   - 246 p_right_4_9 <= 0
 non_overlap_down_4_9: h_var_4 + y_grid_var_4 - y_grid_var_9
   + 246 p_down_4_9 <= 246
 non_overlap_down_rev_4_9: - h_var_4 - y_grid_var_4 + y_grid_var_9
   - 246 p_down_4_9 <= 0
 non_overlap_up_4_9: h_var_9 - y_grid_var_4 + y_grid_var_9 + 246 p_up_4_9
   <= 246
 non_overlap_up_rev_4_9: - h_var_9 + y_grid_var_4 - y_grid_var_9
   - 246 p_up_4_9 <= 0
 non_overlap_any_5_6: p_left_5_6 + p_right_5_6 + p_down_5_6 + p_up_5_6
   >= 1
 non_overlap_left_5_6: w_var_5 + x_grid_var_5 - x_grid_var_6
   + 246 p_left_5_6 <= 246
 non_overlap_left_rev_5_6: - w_var_5 - x_grid_var_5 + x_grid_var_6
   - 246 p_left_5_6 <= 0
 non_overlap_right_5_6: w_var_6 - x_grid_var_5 + x_grid_var_6
   + 246 p_right_5_6 <= 246
 non_overlap_right_rev_5_6: - w_var_6 + x_grid_var_5 - x_grid_var_6
   - 246 p_right_5_6 <= 0
 non_overlap_down_5_6: h_var_5 + y_grid_var_5 - y_grid_var_6
   + 246 p_down_5_6 <= 246
 non_overlap_down_rev_5_6: - h_var_5 - y_grid_var_5 + y_grid_var_6
   - 246 p_down_5_6 <= 0
 non_overlap_up_5_6: h_var_6 - y_grid_var_5 + y_grid_var_6 + 246 p_up_5_6
   <= 246
 non_overlap_up_rev_5_6: - h_var_6 + y_grid_var_5 - y_grid_var_6
   - 246 p_up_5_6 <= 0
 non_overlap_any_5_7: p_left_5_7 + p_right_5_7 + p_down_5_7 + p_up_5_7
   >= 1
 non_overlap_left_5_7: w_var_5 + x_grid_var_5 - x_grid_var_7
   + 246 p_left_5_7 <= 246
 non_overlap_left_rev_5_7: - w_var_5 - x_grid_var_5 + x_grid_var_7
   - 246 p_left_5_7 <= 0
 non_overlap_right_5_7: w_var_7 - x_grid_var_5 + x_grid_var_7
   + 246 p_right_5_7 <= 246
 non_overlap_right_rev_5_7: - w_var_7 + x_grid_var_5 - x_grid_var_7
   - 246 p_right_5_7 <= 0
 non_overlap_down_5_7: h_var_5 + y_grid_var_5 - y_grid_var_7
   + 246 p_down_5_7 <= 246
 non_overlap_down_rev_5_7: - h_var_5 - y_grid_var_5 + y_grid_var_7
   - 246 p_down_5_7 <= 0
 non_overlap_up_5_7: h_var_7 - y_grid_var_5 + y_grid_var_7 + 246 p_up_5_7
   <= 246
 non_overlap_up_rev_5_7: - h_var_7 + y_grid_var_5 - y_grid_var_7
   - 246 p_up_5_7 <= 0
 non_overlap_any_5_8: p_left_5_8 + p_right_5_8 + p_down_5_8 + p_up_5_8
   >= 1
 non_overlap_left_5_8: w_var_5 + x_grid_var_5 - x_grid_var_8
   + 246 p_left_5_8 <= 246
 non_overlap_left_rev_5_8: - w_var_5 - x_grid_var_5 + x_grid_var_8
   - 246 p_left_5_8 <= 0
 non_overlap_right_5_8: w_var_8 - x_grid_var_5 + x_grid_var_8
   + 246 p_right_5_8 <= 246
 non_overlap_right_rev_5_8: - w_var_8 + x_grid_var_5 - x_grid_var_8
   - 246 p_right_5_8 <= 0
 non_overlap_down_5_8: h_var_5 + y_grid_var_5 - y_grid_var_8
   + 246 p_down_5_8 <= 246
 non_overlap_down_rev_5_8: - h_var_5 - y_grid_var_5 + y_grid_var_8
   - 246 p_down_5_8 <= 0
 non_overlap_up_5_8: h_var_8 - y_grid_var_5 + y_grid_var_8 + 246 p_up_5_8
   <= 246
 non_overlap_up_rev_5_8: - h_var_8 + y_grid_var_5 - y_grid_var_8
   - 246 p_up_5_8 <= 0
 non_overlap_any_5_9: p_left_5_9 + p_right_5_9 + p_down_5_9 + p_up_5_9
   >= 1
 non_overlap_left_5_9: w_var_5 + x_grid_var_5 - x_grid_var_9
   + 246 p_left_5_9 <= 246
 non_overlap_left_rev_5_9: - w_var_5 - x_grid_var_5 + x_grid_var_9
   - 246 p_left_5_9 <= 0
 non_overlap_right_5_9: w_var_9 - x_grid_var_5 + x_grid_var_9
   + 246 p_right_5_9 <= 246
 non_overlap_right_rev_5_9: - w_var_9 + x_grid_var_5 - x_grid_var_9
   - 246 p_right_5_9 <= 0
 non_overlap_down_5_9: h_var_5 + y_grid_var_5 - y_grid_var_9
   + 246 p_down_5_9 <= 246
 non_overlap_down_rev_5_9: - h_var_5 - y_grid_var_5 + y_grid_var_9
   - 246 p_down_5_9 <= 0
 non_overlap_up_5_9: h_var_9 - y_grid_var_5 + y_grid_var_9 + 246 p_up_5_9
   <= 246
 non_overlap_up_rev_5_9: - h_var_9 + y_grid_var_5 - y_grid_var_9
   - 246 p_up_5_9 <= 0
 non_overlap_any_6_7: p_left_6_7 + p_right_6_7 + p_down_6_7 + p_up_6_7
   >= 1
 non_overlap_left_6_7: w_var_6 + x_grid_var_6 - x_grid_var_7
   + 246 p_left_6_7 <= 246
 non_overlap_left_rev_6_7: - w_var_6 - x_grid_var_6 + x_grid_var_7
   - 246 p_left_6_7 <= 0
 non_overlap_right_6_7: w_var_7 - x_grid_var_6 + x_grid_var_7
   + 246 p_right_6_7 <= 246
 non_overlap_right_rev_6_7: - w_var_7 + x_grid_var_6 - x_grid_var_7
   - 246 p_right_6_7 <= 0
 non_overlap_down_6_7: h_var_6 + y_grid_var_6 - y_grid_var_7
   + 246 p_down_6_7 <= 246
 non_overlap_down_rev_6_7: - h_var_6 - y_grid_var_6 + y_grid_var_7
   - 246 p_down_6_7 <= 0
 non_overlap_up_6_7: h_var_7 - y_grid_var_6 + y_grid_var_7 + 246 p_up_6_7
   <= 246
 non_overlap_up_rev_6_7: - h_var_7 + y_grid_var_6 - y_grid_var_7
   - 246 p_up_6_7 <= 0
 non_overlap_any_6_8: p_left_6_8 + p_right_6_8 + p_down_6_8 + p_up_6_8
   >= 1
 non_overlap_left_6_8: w_var_6 + x_grid_var_6 - x_grid_var_8
   + 246 p_left_6_8 <= 246
 non_overlap_left_rev_6_8: - w_var_6 - x_grid_var_6 + x_grid_var_8
   - 246 p_left_6_8 <= 0
 non_overlap_right_6_8: w_var_8 - x_grid_var_6 + x_grid_var_8
   + 246 p_right_6_8 <= 246
 non_overlap_right_rev_6_8: - w_var_8 + x_grid_var_6 - x_grid_var_8
   - 246 p_right_6_8 <= 0
 non_overlap_down_6_8: h_var_6 + y_grid_var_6 - y_grid_var_8
   + 246 p_down_6_8 <= 246
 non_overlap_down_rev_6_8: - h_var_6 - y_grid_var_6 + y_grid_var_8
   - 246 p_down_6_8 <= 0
 non_overlap_up_6_8: h_var_8 - y_grid_var_6 + y_grid_var_8 + 246 p_up_6_8
   <= 246
 non_overlap_up_rev_6_8: - h_var_8 + y_grid_var_6 - y_grid_var_8
   - 246 p_up_6_8 <= 0
 non_overlap_any_6_9: p_left_6_9 + p_right_6_9 + p_down_6_9 + p_up_6_9
   >= 1
 non_overlap_left_6_9: w_var_6 + x_grid_var_6 - x_grid_var_9
   + 246 p_left_6_9 <= 246
 non_overlap_left_rev_6_9: - w_var_6 - x_grid_var_6 + x_grid_var_9
   - 246 p_left_6_9 <= 0
 non_overlap_right_6_9: w_var_9 - x_grid_var_6 + x_grid_var_9
   + 246 p_right_6_9 <= 246
 non_overlap_right_rev_6_9: - w_var_9 + x_grid_var_6 - x_grid_var_9
   - 246 p_right_6_9 <= 0
 non_overlap_down_6_9: h_var_6 + y_grid_var_6 - y_grid_var_9
   + 246 p_down_6_9 <= 246
 non_overlap_down_rev_6_9: - h_var_6 - y_grid_var_6 + y_grid_var_9
   - 246 p_down_6_9 <= 0
 non_overlap_up_6_9: h_var_9 - y_grid_var_6 + y_grid_var_9 + 246 p_up_6_9
   <= 246
 non_overlap_up_rev_6_9: - h_var_9 + y_grid_var_6 - y_grid_var_9
   - 246 p_up_6_9 <= 0
 non_overlap_any_7_8: p_left_7_8 + p_right_7_8 + p_down_7_8 + p_up_7_8
   >= 1
 non_overlap_left_7_8: w_var_7 + x_grid_var_7 - x_grid_var_8
   + 246 p_left_7_8 <= 246
 non_overlap_left_rev_7_8: - w_var_7 - x_grid_var_7 + x_grid_var_8
   - 246 p_left_7_8 <= 0
 non_overlap_right_7_8: w_var_8 - x_grid_var_7 + x_grid_var_8
   + 246 p_right_7_8 <= 246
 non_overlap_right_rev_7_8: - w_var_8 + x_grid_var_7 - x_grid_var_8
   - 246 p_right_7_8 <= 0
 non_overlap_down_7_8: h_var_7 + y_grid_var_7 - y_grid_var_8
   + 246 p_down_7_8 <= 246
 non_overlap_down_rev_7_8: - h_var_7 - y_grid_var_7 + y_grid_var_8
   - 246 p_down_7_8 <= 0
 non_overlap_up_7_8: h_var_8 - y_grid_var_7 + y_grid_var_8 + 246 p_up_7_8
   <= 246
 non_overlap_up_rev_7_8: - h_var_8 + y_grid_var_7 - y_grid_var_8
   - 246 p_up_7_8 <= 0
 non_overlap_any_7_9: p_left_7_9 + p_right_7_9 + p_down_7_9 + p_up_7_9
   >= 1
 non_overlap_left_7_9: w_var_7 + x_grid_var_7 - x_grid_var_9
   + 246 p_left_7_9 <= 246
 non_overlap_left_rev_7_9: - w_var_7 - x_grid_var_7 + x_grid_var_9
   - 246 p_left_7_9 <= 0
 non_overlap_right_7_9: w_var_9 - x_grid_var_7 + x_grid_var_9
   + 246 p_right_7_9 <= 246
 non_overlap_right_rev_7_9: - w_var_9 + x_grid_var_7 - x_grid_var_9
   - 246 p_right_7_9 <= 0
 non_overlap_down_7_9: h_var_7 + y_grid_var_7 - y_grid_var_9
   + 246 p_down_7_9 <= 246
 non_overlap_down_rev_7_9: - h_var_7 - y_grid_var_7 + y_grid_var_9
   - 246 p_down_7_9 <= 0
 non_overlap_up_7_9: h_var_9 - y_grid_var_7 + y_grid_var_9 + 246 p_up_7_9
   <= 246
 non_overlap_up_rev_7_9: - h_var_9 + y_grid_var_7 - y_grid_var_9
   - 246 p_up_7_9 <= 0
 non_overlap_any_8_9: p_left_8_9 + p_right_8_9 + p_down_8_9 + p_up_8_9
   >= 1
 non_overlap_left_8_9: w_var_8 + x_grid_var_8 - x_grid_var_9
   + 246 p_left_8_9 <= 246
 non_overlap_left_rev_8_9: - w_var_8 - x_grid_var_8 + x_grid_var_9
   - 246 p_left_8_9 <= 0
 non_overlap_right_8_9: w_var_9 - x_grid_var_8 + x_grid_var_9
   + 246 p_right_8_9 <= 246
 non_overlap_right_rev_8_9: - w_var_9 + x_grid_var_8 - x_grid_var_9
   - 246 p_right_8_9 <= 0
 non_overlap_down_8_9: h_var_8 + y_grid_var_8 - y_grid_var_9
   + 246 p_down_8_9 <= 246
 non_overlap_down_rev_8_9: - h_var_8 - y_grid_var_8 + y_grid_var_9
   - 246 p_down_8_9 <= 0
 non_overlap_up_8_9: h_var_9 - y_grid_var_8 + y_grid_var_9 + 246 p_up_8_9
   <= 246
 non_overlap_up_rev_8_9: - h_var_9 + y_grid_var_8 - y_grid_var_9
   - 246 p_up_8_9 <= 0
 EMIB_non_overlap_any_1_4_1_8: p_EMIB_left_1_4_1_8 + p_EMIB_right_1_4_1_8
   + p_EMIB_down_1_4_1_8 + p_EMIB_up_1_4_1_8 >= 1
 EMIB_non_overlap_left_1_4_1_8: EMIB_w_var_1_4 + EMIB_x_grid_var_1_4
   - EMIB_x_grid_var_1_8 + 246 p_EMIB_left_1_4_1_8 <= 246
 EMIB_non_overlap_left_rev_1_4_1_8: - EMIB_w_var_1_4 - EMIB_x_grid_var_1_4
   + EMIB_x_grid_var_1_8 - 246 p_EMIB_left_1_4_1_8 <= 0
 EMIB_non_overlap_right_1_4_1_8: EMIB_w_var_1_8 - EMIB_x_grid_var_1_4
   + EMIB_x_grid_var_1_8 + 246 p_EMIB_right_1_4_1_8 <= 246
 EMIB_non_overlap_right_rev_1_4_1_8: - EMIB_w_var_1_8 + EMIB_x_grid_var_1_4
   - EMIB_x_grid_var_1_8 - 246 p_EMIB_right_1_4_1_8 <= 0
 EMIB_non_overlap_down_1_4_1_8: EMIB_h_var_1_4 + EMIB_y_grid_var_1_4
   - EMIB_y_grid_var_1_8 + 246 p_EMIB_down_1_4_1_8 <= 246
 EMIB_non_overlap_down_rev_1_4_1_8: - EMIB_h_var_1_4 - EMIB_y_grid_var_1_4
   + EMIB_y_grid_var_1_8 - 246 p_EMIB_down_1_4_1_8 <= 0
 EMIB_non_overlap_up_1_4_1_8: EMIB_h_var_1_8 - EMIB_y_grid_var_1_4
   + EMIB_y_grid_var_1_8 + 246 p_EMIB_up_1_4_1_8 <= 246
 EMIB_non_overlap_up_rev_1_4_1_8: - EMIB_h_var_1_8 + EMIB_y_grid_var_1_4
   - EMIB_y_grid_var_1_8 - 246 p_EMIB_up_1_4_1_8 <= 0
 EMIB_non_overlap_any_1_4_1_9: p_EMIB_left_1_4_1_9 + p_EMIB_right_1_4_1_9
   + p_EMIB_down_1_4_1_9 + p_EMIB_up_1_4_1_9 >= 1
 EMIB_non_overlap_left_1_4_1_9: EMIB_w_var_1_4 + EMIB_x_grid_var_1_4
   - EMIB_x_grid_var_1_9 + 246 p_EMIB_left_1_4_1_9 <= 246
 EMIB_non_overlap_left_rev_1_4_1_9: - EMIB_w_var_1_4 - EMIB_x_grid_var_1_4
   + EMIB_x_grid_var_1_9 - 246 p_EMIB_left_1_4_1_9 <= 0
 EMIB_non_overlap_right_1_4_1_9: EMIB_w_var_1_9 - EMIB_x_grid_var_1_4
   + EMIB_x_grid_var_1_9 + 246 p_EMIB_right_1_4_1_9 <= 246
 EMIB_non_overlap_right_rev_1_4_1_9: - EMIB_w_var_1_9 + EMIB_x_grid_var_1_4
   - EMIB_x_grid_var_1_9 - 246 p_EMIB_right_1_4_1_9 <= 0
 EMIB_non_overlap_down_1_4_1_9: EMIB_h_var_1_4 + EMIB_y_grid_var_1_4
   - EMIB_y_grid_var_1_9 + 246 p_EMIB_down_1_4_1_9 <= 246
 EMIB_non_overlap_down_rev_1_4_1_9: - EMIB_h_var_1_4 - EMIB_y_grid_var_1_4
   + EMIB_y_grid_var_1_9 - 246 p_EMIB_down_1_4_1_9 <= 0
 EMIB_non_overlap_up_1_4_1_9: EMIB_h_var_1_9 - EMIB_y_grid_var_1_4
   + EMIB_y_grid_var_1_9 + 246 p_EMIB_up_1_4_1_9 <= 246
 EMIB_non_overlap_up_rev_1_4_1_9: - EMIB_h_var_1_9 + EMIB_y_grid_var_1_4
   - EMIB_y_grid_var_1_9 - 246 p_EMIB_up_1_4_1_9 <= 0
 EMIB_non_overlap_any_1_4_4_6: p_EMIB_left_1_4_4_6 + p_EMIB_right_1_4_4_6
   + p_EMIB_down_1_4_4_6 + p_EMIB_up_1_4_4_6 >= 1
 EMIB_non_overlap_left_1_4_4_6: EMIB_w_var_1_4 + EMIB_x_grid_var_1_4
   - EMIB_x_grid_var_4_6 + 246 p_EMIB_left_1_4_4_6 <= 246
 EMIB_non_overlap_left_rev_1_4_4_6: - EMIB_w_var_1_4 - EMIB_x_grid_var_1_4
   + EMIB_x_grid_var_4_6 - 246 p_EMIB_left_1_4_4_6 <= 0
 EMIB_non_overlap_right_1_4_4_6: EMIB_w_var_4_6 - EMIB_x_grid_var_1_4
   + EMIB_x_grid_var_4_6 + 246 p_EMIB_right_1_4_4_6 <= 246
 EMIB_non_overlap_right_rev_1_4_4_6: - EMIB_w_var_4_6 + EMIB_x_grid_var_1_4
   - EMIB_x_grid_var_4_6 - 246 p_EMIB_right_1_4_4_6 <= 0
 EMIB_non_overlap_down_1_4_4_6: EMIB_h_var_1_4 + EMIB_y_grid_var_1_4
   - EMIB_y_grid_var_4_6 + 246 p_EMIB_down_1_4_4_6 <= 246
 EMIB_non_overlap_down_rev_1_4_4_6: - EMIB_h_var_1_4 - EMIB_y_grid_var_1_4
   + EMIB_y_grid_var_4_6 - 246 p_EMIB_down_1_4_4_6 <= 0
 EMIB_non_overlap_up_1_4_4_6: EMIB_h_var_4_6 - EMIB_y_grid_var_1_4
   + EMIB_y_grid_var_4_6 + 246 p_EMIB_up_1_4_4_6 <= 246
 EMIB_non_overlap_up_rev_1_4_4_6: - EMIB_h_var_4_6 + EMIB_y_grid_var_1_4
   - EMIB_y_grid_var_4_6 - 246 p_EMIB_up_1_4_4_6 <= 0
 EMIB_non_overlap_any_1_8_1_9: p_EMIB_left_1_8_1_9 + p_EMIB_right_1_8_1_9
   + p_EMIB_down_1_8_1_9 + p_EMIB_up_1_8_1_9 >= 1
 EMIB_non_overlap_left_1_8_1_9: EMIB_w_var_1_8 + EMIB_x_grid_var_1_8
   - EMIB_x_grid_var_1_9 + 246 p_EMIB_left_1_8_1_9 <= 246
 EMIB_non_overlap_left_rev_1_8_1_9: - EMIB_w_var_1_8 - EMIB_x_grid_var_1_8
   + EMIB_x_grid_var_1_9 - 246 p_EMIB_left_1_8_1_9 <= 0
 EMIB_non_overlap_right_1_8_1_9: EMIB_w_var_1_9 - EMIB_x_grid_var_1_8
   + EMIB_x_grid_var_1_9 + 246 p_EMIB_right_1_8_1_9 <= 246
 EMIB_non_overlap_right_rev_1_8_1_9: - EMIB_w_var_1_9 + EMIB_x_grid_var_1_8
   - EMIB_x_grid_var_1_9 - 246 p_EMIB_right_1_8_1_9 <= 0
 EMIB_non_overlap_down_1_8_1_9: EMIB_h_var_1_8 + EMIB_y_grid_var_1_8
   - EMIB_y_grid_var_1_9 + 246 p_EMIB_down_1_8_1_9 <= 246
 EMIB_non_overlap_down_rev_1_8_1_9: - EMIB_h_var_1_8 - EMIB_y_grid_var_1_8
   + EMIB_y_grid_var_1_9 - 246 p_EMIB_down_1_8_1_9 <= 0
 EMIB_non_overlap_up_1_8_1_9: EMIB_h_var_1_9 - EMIB_y_grid_var_1_8
   + EMIB_y_grid_var_1_9 + 246 p_EMIB_up_1_8_1_9 <= 246
 EMIB_non_overlap_up_rev_1_8_1_9: - EMIB_h_var_1_9 + EMIB_y_grid_var_1_8
   - EMIB_y_grid_var_1_9 - 246 p_EMIB_up_1_8_1_9 <= 0
 EMIB_non_overlap_any_1_8_8_9: p_EMIB_left_1_8_8_9 + p_EMIB_right_1_8_8_9
   + p_EMIB_down_1_8_8_9 + p_EMIB_up_1_8_8_9 >= 1
 EMIB_non_overlap_left_1_8_8_9: EMIB_w_var_1_8 + EMIB_x_grid_var_1_8
   - EMIB_x_grid_var_8_9 + 246 p_EMIB_left_1_8_8_9 <= 246
 EMIB_non_overlap_left_rev_1_8_8_9: - EMIB_w_var_1_8 - EMIB_x_grid_var_1_8
   + EMIB_x_grid_var_8_9 - 246 p_EMIB_left_1_8_8_9 <= 0
 EMIB_non_overlap_right_1_8_8_9: EMIB_w_var_8_9 - EMIB_x_grid_var_1_8
   + EMIB_x_grid_var_8_9 + 246 p_EMIB_right_1_8_8_9 <= 246
 EMIB_non_overlap_right_rev_1_8_8_9: - EMIB_w_var_8_9 + EMIB_x_grid_var_1_8
   - EMIB_x_grid_var_8_9 - 246 p_EMIB_right_1_8_8_9 <= 0
 EMIB_non_overlap_down_1_8_8_9: EMIB_h_var_1_8 + EMIB_y_grid_var_1_8
   - EMIB_y_grid_var_8_9 + 246 p_EMIB_down_1_8_8_9 <= 246
 EMIB_non_overlap_down_rev_1_8_8_9: - EMIB_h_var_1_8 - EMIB_y_grid_var_1_8
   + EMIB_y_grid_var_8_9 - 246 p_EMIB_down_1_8_8_9 <= 0
 EMIB_non_overlap_up_1_8_8_9: EMIB_h_var_8_9 - EMIB_y_grid_var_1_8
   + EMIB_y_grid_var_8_9 + 246 p_EMIB_up_1_8_8_9 <= 246
 EMIB_non_overlap_up_rev_1_8_8_9: - EMIB_h_var_8_9 + EMIB_y_grid_var_1_8
   - EMIB_y_grid_var_8_9 - 246 p_EMIB_up_1_8_8_9 <= 0
 EMIB_non_overlap_any_1_9_8_9: p_EMIB_left_1_9_8_9 + p_EMIB_right_1_9_8_9
   + p_EMIB_down_1_9_8_9 + p_EMIB_up_1_9_8_9 >= 1
 EMIB_non_overlap_left_1_9_8_9: EMIB_w_var_1_9 + EMIB_x_grid_var_1_9
   - EMIB_x_grid_var_8_9 + 246 p_EMIB_left_1_9_8_9 <= 246
 EMIB_non_overlap_left_rev_1_9_8_9: - EMIB_w_var_1_9 - EMIB_x_grid_var_1_9
   + EMIB_x_grid_var_8_9 - 246 p_EMIB_left_1_9_8_9 <= 0
 EMIB_non_overlap_right_1_9_8_9: EMIB_w_var_8_9 - EMIB_x_grid_var_1_9
   + EMIB_x_grid_var_8_9 + 246 p_EMIB_right_1_9_8_9 <= 246
 EMIB_non_overlap_right_rev_1_9_8_9: - EMIB_w_var_8_9 + EMIB_x_grid_var_1_9
   - EMIB_x_grid_var_8_9 - 246 p_EMIB_right_1_9_8_9 <= 0
 EMIB_non_overlap_down_1_9_8_9: EMIB_h_var_1_9 + EMIB_y_grid_var_1_9
   - EMIB_y_grid_var_8_9 + 246 p_EMIB_down_1_9_8_9 <= 246
 EMIB_non_overlap_down_rev_1_9_8_9: - EMIB_h_var_1_9 - EMIB_y_grid_var_1_9
   + EMIB_y_grid_var_8_9 - 246 p_EMIB_down_1_9_8_9 <= 0
 EMIB_non_overlap_up_1_9_8_9: EMIB_h_var_8_9 - EMIB_y_grid_var_1_9
   + EMIB_y_grid_var_8_9 + 246 p_EMIB_up_1_9_8_9 <= 246
 EMIB_non_overlap_up_rev_1_9_8_9: - EMIB_h_var_8_9 + EMIB_y_grid_var_1_9
   - EMIB_y_grid_var_8_9 - 246 p_EMIB_up_1_9_8_9 <= 0
 EMIB_non_overlap_any_2_6_4_6: p_EMIB_left_2_6_4_6 + p_EMIB_right_2_6_4_6
   + p_EMIB_down_2_6_4_6 + p_EMIB_up_2_6_4_6 >= 1
 EMIB_non_overlap_left_2_6_4_6: EMIB_w_var_2_6 + EMIB_x_grid_var_2_6
   - EMIB_x_grid_var_4_6 + 246 p_EMIB_left_2_6_4_6 <= 246
 EMIB_non_overlap_left_rev_2_6_4_6: - EMIB_w_var_2_6 - EMIB_x_grid_var_2_6
   + EMIB_x_grid_var_4_6 - 246 p_EMIB_left_2_6_4_6 <= 0
 EMIB_non_overlap_right_2_6_4_6: EMIB_w_var_4_6 - EMIB_x_grid_var_2_6
   + EMIB_x_grid_var_4_6 + 246 p_EMIB_right_2_6_4_6 <= 246
 EMIB_non_overlap_right_rev_2_6_4_6: - EMIB_w_var_4_6 + EMIB_x_grid_var_2_6
   - EMIB_x_grid_var_4_6 - 246 p_EMIB_right_2_6_4_6 <= 0
 EMIB_non_overlap_down_2_6_4_6: EMIB_h_var_2_6 + EMIB_y_grid_var_2_6
   - EMIB_y_grid_var_4_6 + 246 p_EMIB_down_2_6_4_6 <= 246
 EMIB_non_overlap_down_rev_2_6_4_6: - EMIB_h_var_2_6 - EMIB_y_grid_var_2_6
   + EMIB_y_grid_var_4_6 - 246 p_EMIB_down_2_6_4_6 <= 0
 EMIB_non_overlap_up_2_6_4_6: EMIB_h_var_4_6 - EMIB_y_grid_var_2_6
   + EMIB_y_grid_var_4_6 + 246 p_EMIB_up_2_6_4_6 <= 246
 EMIB_non_overlap_up_rev_2_6_4_6: - EMIB_h_var_4_6 + EMIB_y_grid_var_2_6
   - EMIB_y_grid_var_4_6 - 246 p_EMIB_up_2_6_4_6 <= 0
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
 bbox_min_x_8: - x_grid_var_8 + bbox_min_x <= 0
 bbox_max_x_8: - w_var_8 - x_grid_var_8 + bbox_max_x >= 0
 bbox_min_y_8: - y_grid_var_8 + bbox_min_y <= 0
 bbox_max_y_8: - h_var_8 - y_grid_var_8 + bbox_max_y >= 0
 bbox_min_x_9: - x_grid_var_9 + bbox_min_x <= 0
 bbox_max_x_9: - w_var_9 - x_grid_var_9 + bbox_max_x >= 0
 bbox_min_y_9: - y_grid_var_9 + bbox_min_y <= 0
 bbox_max_y_9: - h_var_9 - y_grid_var_9 + bbox_max_y >= 0
 bbox_w_def: bbox_min_x - bbox_max_x + bbox_w = 0
 bbox_h_def: bbox_min_y - bbox_max_y + bbox_h = 0
 cx_center_def: cx_center - 0.5 bbox_min_x - 0.5 bbox_max_x = 0
 cy_center_def: cy_center - 0.5 bbox_min_y - 0.5 bbox_max_y = 0
 aspect_ratio_diff_ge_w_minus_h: - bbox_w + bbox_h + aspect_ratio_penalty
   >= 0
 aspect_ratio_diff_ge_h_minus_w: bbox_w - bbox_h + aspect_ratio_penalty
   >= 0
 dx_grid_diff_def_6_7: - cx_grid_var_6 + cx_grid_var_7 + dx_grid_diff_6_7
   = 0
 dx_grid_abs_pair_6_7_abs_ge_orig: dx_grid_abs_pair_6_7 - dx_grid_diff_6_7
   - 246 dx_grid_abs_pair_6_7_is_positive >= -246
 dx_grid_abs_pair_6_7_abs_le_orig: dx_grid_abs_pair_6_7 - dx_grid_diff_6_7
   + 246 dx_grid_abs_pair_6_7_is_positive <= 246
 dx_grid_abs_pair_6_7_abs_ge_neg_orig: dx_grid_abs_pair_6_7
   + dx_grid_diff_6_7 + 246 dx_grid_abs_pair_6_7_is_positive >= 0
 dx_grid_abs_pair_6_7_abs_le_neg_orig: dx_grid_abs_pair_6_7
   + dx_grid_diff_6_7 - 246 dx_grid_abs_pair_6_7_is_positive <= 0
 dx_grid_abs_pair_6_7_force_positive: dx_grid_diff_6_7
   - 246 dx_grid_abs_pair_6_7_is_positive >= -246
 dx_grid_abs_pair_6_7_force_negative: dx_grid_diff_6_7
   - 246 dx_grid_abs_pair_6_7_is_positive <= 0
 dy_grid_diff_def_6_7: - cy_grid_var_6 + cy_grid_var_7 + dy_grid_diff_6_7
   = 0
 dy_grid_abs_pair_6_7_abs_ge_orig: dy_grid_abs_pair_6_7 - dy_grid_diff_6_7
   - 246 dy_grid_abs_pair_6_7_is_positive >= -246
 dy_grid_abs_pair_6_7_abs_le_orig: dy_grid_abs_pair_6_7 - dy_grid_diff_6_7
   + 246 dy_grid_abs_pair_6_7_is_positive <= 246
 dy_grid_abs_pair_6_7_abs_ge_neg_orig: dy_grid_abs_pair_6_7
   + dy_grid_diff_6_7 + 246 dy_grid_abs_pair_6_7_is_positive >= 0
 dy_grid_abs_pair_6_7_abs_le_neg_orig: dy_grid_abs_pair_6_7
   + dy_grid_diff_6_7 - 246 dy_grid_abs_pair_6_7_is_positive <= 0
 dy_grid_abs_pair_6_7_force_positive: dy_grid_diff_6_7
   - 246 dy_grid_abs_pair_6_7_is_positive >= -246
 dy_grid_abs_pair_6_7_force_negative: dy_grid_diff_6_7
   - 246 dy_grid_abs_pair_6_7_is_positive <= 0
 dist_curr_pair_def_6_7: - dx_grid_abs_pair_6_7 - dy_grid_abs_pair_6_7
   + dist_curr_pair_6_7 = 0
 dx_grid_diff_def_6_9: - cx_grid_var_6 + cx_grid_var_9 + dx_grid_diff_6_9
   = 0
 dx_grid_abs_pair_6_9_abs_ge_orig: dx_grid_abs_pair_6_9 - dx_grid_diff_6_9
   - 246 dx_grid_abs_pair_6_9_is_positive >= -246
 dx_grid_abs_pair_6_9_abs_le_orig: dx_grid_abs_pair_6_9 - dx_grid_diff_6_9
   + 246 dx_grid_abs_pair_6_9_is_positive <= 246
 dx_grid_abs_pair_6_9_abs_ge_neg_orig: dx_grid_abs_pair_6_9
   + dx_grid_diff_6_9 + 246 dx_grid_abs_pair_6_9_is_positive >= 0
 dx_grid_abs_pair_6_9_abs_le_neg_orig: dx_grid_abs_pair_6_9
   + dx_grid_diff_6_9 - 246 dx_grid_abs_pair_6_9_is_positive <= 0
 dx_grid_abs_pair_6_9_force_positive: dx_grid_diff_6_9
   - 246 dx_grid_abs_pair_6_9_is_positive >= -246
 dx_grid_abs_pair_6_9_force_negative: dx_grid_diff_6_9
   - 246 dx_grid_abs_pair_6_9_is_positive <= 0
 dy_grid_diff_def_6_9: - cy_grid_var_6 + cy_grid_var_9 + dy_grid_diff_6_9
   = 0
 dy_grid_abs_pair_6_9_abs_ge_orig: dy_grid_abs_pair_6_9 - dy_grid_diff_6_9
   - 246 dy_grid_abs_pair_6_9_is_positive >= -246
 dy_grid_abs_pair_6_9_abs_le_orig: dy_grid_abs_pair_6_9 - dy_grid_diff_6_9
   + 246 dy_grid_abs_pair_6_9_is_positive <= 246
 dy_grid_abs_pair_6_9_abs_ge_neg_orig: dy_grid_abs_pair_6_9
   + dy_grid_diff_6_9 + 246 dy_grid_abs_pair_6_9_is_positive >= 0
 dy_grid_abs_pair_6_9_abs_le_neg_orig: dy_grid_abs_pair_6_9
   + dy_grid_diff_6_9 - 246 dy_grid_abs_pair_6_9_is_positive <= 0
 dy_grid_abs_pair_6_9_force_positive: dy_grid_diff_6_9
   - 246 dy_grid_abs_pair_6_9_is_positive >= -246
 dy_grid_abs_pair_6_9_force_negative: dy_grid_diff_6_9
   - 246 dy_grid_abs_pair_6_9_is_positive <= 0
 dist_curr_pair_def_6_9: - dx_grid_abs_pair_6_9 - dy_grid_abs_pair_6_9
   + dist_curr_pair_6_9 = 0
 dx_grid_diff_def_7_9: - cx_grid_var_7 + cx_grid_var_9 + dx_grid_diff_7_9
   = 0
 dx_grid_abs_pair_7_9_abs_ge_orig: dx_grid_abs_pair_7_9 - dx_grid_diff_7_9
   - 246 dx_grid_abs_pair_7_9_is_positive >= -246
 dx_grid_abs_pair_7_9_abs_le_orig: dx_grid_abs_pair_7_9 - dx_grid_diff_7_9
   + 246 dx_grid_abs_pair_7_9_is_positive <= 246
 dx_grid_abs_pair_7_9_abs_ge_neg_orig: dx_grid_abs_pair_7_9
   + dx_grid_diff_7_9 + 246 dx_grid_abs_pair_7_9_is_positive >= 0
 dx_grid_abs_pair_7_9_abs_le_neg_orig: dx_grid_abs_pair_7_9
   + dx_grid_diff_7_9 - 246 dx_grid_abs_pair_7_9_is_positive <= 0
 dx_grid_abs_pair_7_9_force_positive: dx_grid_diff_7_9
   - 246 dx_grid_abs_pair_7_9_is_positive >= -246
 dx_grid_abs_pair_7_9_force_negative: dx_grid_diff_7_9
   - 246 dx_grid_abs_pair_7_9_is_positive <= 0
 dy_grid_diff_def_7_9: - cy_grid_var_7 + cy_grid_var_9 + dy_grid_diff_7_9
   = 0
 dy_grid_abs_pair_7_9_abs_ge_orig: dy_grid_abs_pair_7_9 - dy_grid_diff_7_9
   - 246 dy_grid_abs_pair_7_9_is_positive >= -246
 dy_grid_abs_pair_7_9_abs_le_orig: dy_grid_abs_pair_7_9 - dy_grid_diff_7_9
   + 246 dy_grid_abs_pair_7_9_is_positive <= 246
 dy_grid_abs_pair_7_9_abs_ge_neg_orig: dy_grid_abs_pair_7_9
   + dy_grid_diff_7_9 + 246 dy_grid_abs_pair_7_9_is_positive >= 0
 dy_grid_abs_pair_7_9_abs_le_neg_orig: dy_grid_abs_pair_7_9
   + dy_grid_diff_7_9 - 246 dy_grid_abs_pair_7_9_is_positive <= 0
 dy_grid_abs_pair_7_9_force_positive: dy_grid_diff_7_9
   - 246 dy_grid_abs_pair_7_9_is_positive >= -246
 dy_grid_abs_pair_7_9_force_negative: dy_grid_diff_7_9
   - 246 dy_grid_abs_pair_7_9_is_positive <= 0
 dist_curr_pair_def_7_9: - dx_grid_abs_pair_7_9 - dy_grid_abs_pair_7_9
   + dist_curr_pair_7_9 = 0
 dx_center_diff_def_6: - cx_grid_var_6 + cx_center + dx_center_diff_6 = 0
 dx_center_abs_6_abs_ge_orig: - dx_center_diff_6 + dx_center_abs_6
   - 246 dx_center_abs_6_is_positive >= -246
 dx_center_abs_6_abs_le_orig: - dx_center_diff_6 + dx_center_abs_6
   + 246 dx_center_abs_6_is_positive <= 246
 dx_center_abs_6_abs_ge_neg_orig: dx_center_diff_6 + dx_center_abs_6
   + 246 dx_center_abs_6_is_positive >= 0
 dx_center_abs_6_abs_le_neg_orig: dx_center_diff_6 + dx_center_abs_6
   - 246 dx_center_abs_6_is_positive <= 0
 dx_center_abs_6_force_positive: dx_center_diff_6
   - 246 dx_center_abs_6_is_positive >= -246
 dx_center_abs_6_force_negative: dx_center_diff_6
   - 246 dx_center_abs_6_is_positive <= 0
 dy_center_diff_def_6: - cy_grid_var_6 + cy_center + dy_center_diff_6 = 0
 dy_center_abs_6_abs_ge_orig: - dy_center_diff_6 + dy_center_abs_6
   - 246 dy_center_abs_6_is_positive >= -246
 dy_center_abs_6_abs_le_orig: - dy_center_diff_6 + dy_center_abs_6
   + 246 dy_center_abs_6_is_positive <= 246
 dy_center_abs_6_abs_ge_neg_orig: dy_center_diff_6 + dy_center_abs_6
   + 246 dy_center_abs_6_is_positive >= 0
 dy_center_abs_6_abs_le_neg_orig: dy_center_diff_6 + dy_center_abs_6
   - 246 dy_center_abs_6_is_positive <= 0
 dy_center_abs_6_force_positive: dy_center_diff_6
   - 246 dy_center_abs_6_is_positive >= -246
 dy_center_abs_6_force_negative: dy_center_diff_6
   - 246 dy_center_abs_6_is_positive <= 0
 dist_center_def_6: - dx_center_abs_6 - dy_center_abs_6 + dist_center_6
   = 0
 dx_center_diff_def_7: - cx_grid_var_7 + cx_center + dx_center_diff_7 = 0
 dx_center_abs_7_abs_ge_orig: - dx_center_diff_7 + dx_center_abs_7
   - 246 dx_center_abs_7_is_positive >= -246
 dx_center_abs_7_abs_le_orig: - dx_center_diff_7 + dx_center_abs_7
   + 246 dx_center_abs_7_is_positive <= 246
 dx_center_abs_7_abs_ge_neg_orig: dx_center_diff_7 + dx_center_abs_7
   + 246 dx_center_abs_7_is_positive >= 0
 dx_center_abs_7_abs_le_neg_orig: dx_center_diff_7 + dx_center_abs_7
   - 246 dx_center_abs_7_is_positive <= 0
 dx_center_abs_7_force_positive: dx_center_diff_7
   - 246 dx_center_abs_7_is_positive >= -246
 dx_center_abs_7_force_negative: dx_center_diff_7
   - 246 dx_center_abs_7_is_positive <= 0
 dy_center_diff_def_7: - cy_grid_var_7 + cy_center + dy_center_diff_7 = 0
 dy_center_abs_7_abs_ge_orig: - dy_center_diff_7 + dy_center_abs_7
   - 246 dy_center_abs_7_is_positive >= -246
 dy_center_abs_7_abs_le_orig: - dy_center_diff_7 + dy_center_abs_7
   + 246 dy_center_abs_7_is_positive <= 246
 dy_center_abs_7_abs_ge_neg_orig: dy_center_diff_7 + dy_center_abs_7
   + 246 dy_center_abs_7_is_positive >= 0
 dy_center_abs_7_abs_le_neg_orig: dy_center_diff_7 + dy_center_abs_7
   - 246 dy_center_abs_7_is_positive <= 0
 dy_center_abs_7_force_positive: dy_center_diff_7
   - 246 dy_center_abs_7_is_positive >= -246
 dy_center_abs_7_force_negative: dy_center_diff_7
   - 246 dy_center_abs_7_is_positive <= 0
 dist_center_def_7: - dx_center_abs_7 - dy_center_abs_7 + dist_center_7
   = 0
 dx_center_diff_def_9: - cx_grid_var_9 + cx_center + dx_center_diff_9 = 0
 dx_center_abs_9_abs_ge_orig: - dx_center_diff_9 + dx_center_abs_9
   - 246 dx_center_abs_9_is_positive >= -246
 dx_center_abs_9_abs_le_orig: - dx_center_diff_9 + dx_center_abs_9
   + 246 dx_center_abs_9_is_positive <= 246
 dx_center_abs_9_abs_ge_neg_orig: dx_center_diff_9 + dx_center_abs_9
   + 246 dx_center_abs_9_is_positive >= 0
 dx_center_abs_9_abs_le_neg_orig: dx_center_diff_9 + dx_center_abs_9
   - 246 dx_center_abs_9_is_positive <= 0
 dx_center_abs_9_force_positive: dx_center_diff_9
   - 246 dx_center_abs_9_is_positive >= -246
 dx_center_abs_9_force_negative: dx_center_diff_9
   - 246 dx_center_abs_9_is_positive <= 0
 dy_center_diff_def_9: - cy_grid_var_9 + cy_center + dy_center_diff_9 = 0
 dy_center_abs_9_abs_ge_orig: - dy_center_diff_9 + dy_center_abs_9
   - 246 dy_center_abs_9_is_positive >= -246
 dy_center_abs_9_abs_le_orig: - dy_center_diff_9 + dy_center_abs_9
   + 246 dy_center_abs_9_is_positive <= 246
 dy_center_abs_9_abs_ge_neg_orig: dy_center_diff_9 + dy_center_abs_9
   + 246 dy_center_abs_9_is_positive >= 0
 dy_center_abs_9_abs_le_neg_orig: dy_center_diff_9 + dy_center_abs_9
   - 246 dy_center_abs_9_is_positive <= 0
 dy_center_abs_9_force_positive: dy_center_diff_9
   - 246 dy_center_abs_9_is_positive >= -246
 dy_center_abs_9_force_negative: dy_center_diff_9
   - 246 dy_center_abs_9_is_positive <= 0
 dist_center_def_9: - dx_center_abs_9 - dy_center_abs_9 + dist_center_9
   = 0
 power_aware_penalty_def: power_aware_penalty - 3053 dist_curr_pair_6_7
   - 3311 dist_curr_pair_6_9 - 5467 dist_curr_pair_7_9 - 1849 dist_center_6
   - 5041 dist_center_7 - 5929 dist_center_9 = 0
 dx_diff_def_0_4: - cx_grid_var_0 + cx_grid_var_4 + dx_diff_0_4 = 0
 dy_diff_def_0_4: - cy_grid_var_0 + cy_grid_var_4 + dy_diff_0_4 = 0
 dx_abs_0_4_abs_ge_orig: dx_abs_0_4 - dx_diff_0_4
   - 246 dx_abs_0_4_is_positive >= -246
 dx_abs_0_4_abs_le_orig: dx_abs_0_4 - dx_diff_0_4
   + 246 dx_abs_0_4_is_positive <= 246
 dx_abs_0_4_abs_ge_neg_orig: dx_abs_0_4 + dx_diff_0_4
   + 246 dx_abs_0_4_is_positive >= 0
 dx_abs_0_4_abs_le_neg_orig: dx_abs_0_4 + dx_diff_0_4
   - 246 dx_abs_0_4_is_positive <= 0
 dx_abs_0_4_force_positive: dx_diff_0_4 - 246 dx_abs_0_4_is_positive
   >= -246
 dx_abs_0_4_force_negative: dx_diff_0_4 - 246 dx_abs_0_4_is_positive <= 0
 dy_abs_0_4_abs_ge_orig: dy_abs_0_4 - dy_diff_0_4
   - 246 dy_abs_0_4_is_positive >= -246
 dy_abs_0_4_abs_le_orig: dy_abs_0_4 - dy_diff_0_4
   + 246 dy_abs_0_4_is_positive <= 246
 dy_abs_0_4_abs_ge_neg_orig: dy_abs_0_4 + dy_diff_0_4
   + 246 dy_abs_0_4_is_positive >= 0
 dy_abs_0_4_abs_le_neg_orig: dy_abs_0_4 + dy_diff_0_4
   - 246 dy_abs_0_4_is_positive <= 0
 dy_abs_0_4_force_positive: dy_diff_0_4 - 246 dy_abs_0_4_is_positive
   >= -246
 dy_abs_0_4_force_negative: dy_diff_0_4 - 246 dy_abs_0_4_is_positive <= 0
 dx_diff_def_1_7: - cx_grid_var_1 + cx_grid_var_7 + dx_diff_1_7 = 0
 dy_diff_def_1_7: - cy_grid_var_1 + cy_grid_var_7 + dy_diff_1_7 = 0
 dx_abs_1_7_abs_ge_orig: dx_abs_1_7 - dx_diff_1_7
   - 246 dx_abs_1_7_is_positive >= -246
 dx_abs_1_7_abs_le_orig: dx_abs_1_7 - dx_diff_1_7
   + 246 dx_abs_1_7_is_positive <= 246
 dx_abs_1_7_abs_ge_neg_orig: dx_abs_1_7 + dx_diff_1_7
   + 246 dx_abs_1_7_is_positive >= 0
 dx_abs_1_7_abs_le_neg_orig: dx_abs_1_7 + dx_diff_1_7
   - 246 dx_abs_1_7_is_positive <= 0
 dx_abs_1_7_force_positive: dx_diff_1_7 - 246 dx_abs_1_7_is_positive
   >= -246
 dx_abs_1_7_force_negative: dx_diff_1_7 - 246 dx_abs_1_7_is_positive <= 0
 dy_abs_1_7_abs_ge_orig: dy_abs_1_7 - dy_diff_1_7
   - 246 dy_abs_1_7_is_positive >= -246
 dy_abs_1_7_abs_le_orig: dy_abs_1_7 - dy_diff_1_7
   + 246 dy_abs_1_7_is_positive <= 246
 dy_abs_1_7_abs_ge_neg_orig: dy_abs_1_7 + dy_diff_1_7
   + 246 dy_abs_1_7_is_positive >= 0
 dy_abs_1_7_abs_le_neg_orig: dy_abs_1_7 + dy_diff_1_7
   - 246 dy_abs_1_7_is_positive <= 0
 dy_abs_1_7_force_positive: dy_diff_1_7 - 246 dy_abs_1_7_is_positive
   >= -246
 dy_abs_1_7_force_negative: dy_diff_1_7 - 246 dy_abs_1_7_is_positive <= 0
 dx_diff_def_2_3: - cx_grid_var_2 + cx_grid_var_3 + dx_diff_2_3 = 0
 dy_diff_def_2_3: - cy_grid_var_2 + cy_grid_var_3 + dy_diff_2_3 = 0
 dx_abs_2_3_abs_ge_orig: dx_abs_2_3 - dx_diff_2_3
   - 246 dx_abs_2_3_is_positive >= -246
 dx_abs_2_3_abs_le_orig: dx_abs_2_3 - dx_diff_2_3
   + 246 dx_abs_2_3_is_positive <= 246
 dx_abs_2_3_abs_ge_neg_orig: dx_abs_2_3 + dx_diff_2_3
   + 246 dx_abs_2_3_is_positive >= 0
 dx_abs_2_3_abs_le_neg_orig: dx_abs_2_3 + dx_diff_2_3
   - 246 dx_abs_2_3_is_positive <= 0
 dx_abs_2_3_force_positive: dx_diff_2_3 - 246 dx_abs_2_3_is_positive
   >= -246
 dx_abs_2_3_force_negative: dx_diff_2_3 - 246 dx_abs_2_3_is_positive <= 0
 dy_abs_2_3_abs_ge_orig: dy_abs_2_3 - dy_diff_2_3
   - 246 dy_abs_2_3_is_positive >= -246
 dy_abs_2_3_abs_le_orig: dy_abs_2_3 - dy_diff_2_3
   + 246 dy_abs_2_3_is_positive <= 246
 dy_abs_2_3_abs_ge_neg_orig: dy_abs_2_3 + dy_diff_2_3
   + 246 dy_abs_2_3_is_positive >= 0
 dy_abs_2_3_abs_le_neg_orig: dy_abs_2_3 + dy_diff_2_3
   - 246 dy_abs_2_3_is_positive <= 0
 dy_abs_2_3_force_positive: dy_diff_2_3 - 246 dy_abs_2_3_is_positive
   >= -246
 dy_abs_2_3_force_negative: dy_diff_2_3 - 246 dy_abs_2_3_is_positive <= 0
 dx_diff_def_2_4: - cx_grid_var_2 + cx_grid_var_4 + dx_diff_2_4 = 0
 dy_diff_def_2_4: - cy_grid_var_2 + cy_grid_var_4 + dy_diff_2_4 = 0
 dx_abs_2_4_abs_ge_orig: dx_abs_2_4 - dx_diff_2_4
   - 246 dx_abs_2_4_is_positive >= -246
 dx_abs_2_4_abs_le_orig: dx_abs_2_4 - dx_diff_2_4
   + 246 dx_abs_2_4_is_positive <= 246
 dx_abs_2_4_abs_ge_neg_orig: dx_abs_2_4 + dx_diff_2_4
   + 246 dx_abs_2_4_is_positive >= 0
 dx_abs_2_4_abs_le_neg_orig: dx_abs_2_4 + dx_diff_2_4
   - 246 dx_abs_2_4_is_positive <= 0
 dx_abs_2_4_force_positive: dx_diff_2_4 - 246 dx_abs_2_4_is_positive
   >= -246
 dx_abs_2_4_force_negative: dx_diff_2_4 - 246 dx_abs_2_4_is_positive <= 0
 dy_abs_2_4_abs_ge_orig: dy_abs_2_4 - dy_diff_2_4
   - 246 dy_abs_2_4_is_positive >= -246
 dy_abs_2_4_abs_le_orig: dy_abs_2_4 - dy_diff_2_4
   + 246 dy_abs_2_4_is_positive <= 246
 dy_abs_2_4_abs_ge_neg_orig: dy_abs_2_4 + dy_diff_2_4
   + 246 dy_abs_2_4_is_positive >= 0
 dy_abs_2_4_abs_le_neg_orig: dy_abs_2_4 + dy_diff_2_4
   - 246 dy_abs_2_4_is_positive <= 0
 dy_abs_2_4_force_positive: dy_diff_2_4 - 246 dy_abs_2_4_is_positive
   >= -246
 dy_abs_2_4_force_negative: dy_diff_2_4 - 246 dy_abs_2_4_is_positive <= 0
 dx_diff_def_4_5: - cx_grid_var_4 + cx_grid_var_5 + dx_diff_4_5 = 0
 dy_diff_def_4_5: - cy_grid_var_4 + cy_grid_var_5 + dy_diff_4_5 = 0
 dx_abs_4_5_abs_ge_orig: dx_abs_4_5 - dx_diff_4_5
   - 246 dx_abs_4_5_is_positive >= -246
 dx_abs_4_5_abs_le_orig: dx_abs_4_5 - dx_diff_4_5
   + 246 dx_abs_4_5_is_positive <= 246
 dx_abs_4_5_abs_ge_neg_orig: dx_abs_4_5 + dx_diff_4_5
   + 246 dx_abs_4_5_is_positive >= 0
 dx_abs_4_5_abs_le_neg_orig: dx_abs_4_5 + dx_diff_4_5
   - 246 dx_abs_4_5_is_positive <= 0
 dx_abs_4_5_force_positive: dx_diff_4_5 - 246 dx_abs_4_5_is_positive
   >= -246
 dx_abs_4_5_force_negative: dx_diff_4_5 - 246 dx_abs_4_5_is_positive <= 0
 dy_abs_4_5_abs_ge_orig: dy_abs_4_5 - dy_diff_4_5
   - 246 dy_abs_4_5_is_positive >= -246
 dy_abs_4_5_abs_le_orig: dy_abs_4_5 - dy_diff_4_5
   + 246 dy_abs_4_5_is_positive <= 246
 dy_abs_4_5_abs_ge_neg_orig: dy_abs_4_5 + dy_diff_4_5
   + 246 dy_abs_4_5_is_positive >= 0
 dy_abs_4_5_abs_le_neg_orig: dy_abs_4_5 + dy_diff_4_5
   - 246 dy_abs_4_5_is_positive <= 0
 dy_abs_4_5_force_positive: dy_diff_4_5 - 246 dy_abs_4_5_is_positive
   >= -246
 dy_abs_4_5_force_negative: dy_diff_4_5 - 246 dy_abs_4_5_is_positive <= 0
 dx_diff_def_4_7: - cx_grid_var_4 + cx_grid_var_7 + dx_diff_4_7 = 0
 dy_diff_def_4_7: - cy_grid_var_4 + cy_grid_var_7 + dy_diff_4_7 = 0
 dx_abs_4_7_abs_ge_orig: dx_abs_4_7 - dx_diff_4_7
   - 246 dx_abs_4_7_is_positive >= -246
 dx_abs_4_7_abs_le_orig: dx_abs_4_7 - dx_diff_4_7
   + 246 dx_abs_4_7_is_positive <= 246
 dx_abs_4_7_abs_ge_neg_orig: dx_abs_4_7 + dx_diff_4_7
   + 246 dx_abs_4_7_is_positive >= 0
 dx_abs_4_7_abs_le_neg_orig: dx_abs_4_7 + dx_diff_4_7
   - 246 dx_abs_4_7_is_positive <= 0
 dx_abs_4_7_force_positive: dx_diff_4_7 - 246 dx_abs_4_7_is_positive
   >= -246
 dx_abs_4_7_force_negative: dx_diff_4_7 - 246 dx_abs_4_7_is_positive <= 0
 dy_abs_4_7_abs_ge_orig: dy_abs_4_7 - dy_diff_4_7
   - 246 dy_abs_4_7_is_positive >= -246
 dy_abs_4_7_abs_le_orig: dy_abs_4_7 - dy_diff_4_7
   + 246 dy_abs_4_7_is_positive <= 246
 dy_abs_4_7_abs_ge_neg_orig: dy_abs_4_7 + dy_diff_4_7
   + 246 dy_abs_4_7_is_positive >= 0
 dy_abs_4_7_abs_le_neg_orig: dy_abs_4_7 + dy_diff_4_7
   - 246 dy_abs_4_7_is_positive <= 0
 dy_abs_4_7_force_positive: dy_diff_4_7 - 246 dy_abs_4_7_is_positive
   >= -246
 dy_abs_4_7_force_negative: dy_diff_4_7 - 246 dy_abs_4_7_is_positive <= 0
 dx_diff_def_5_8: - cx_grid_var_5 + cx_grid_var_8 + dx_diff_5_8 = 0
 dy_diff_def_5_8: - cy_grid_var_5 + cy_grid_var_8 + dy_diff_5_8 = 0
 dx_abs_5_8_abs_ge_orig: dx_abs_5_8 - dx_diff_5_8
   - 246 dx_abs_5_8_is_positive >= -246
 dx_abs_5_8_abs_le_orig: dx_abs_5_8 - dx_diff_5_8
   + 246 dx_abs_5_8_is_positive <= 246
 dx_abs_5_8_abs_ge_neg_orig: dx_abs_5_8 + dx_diff_5_8
   + 246 dx_abs_5_8_is_positive >= 0
 dx_abs_5_8_abs_le_neg_orig: dx_abs_5_8 + dx_diff_5_8
   - 246 dx_abs_5_8_is_positive <= 0
 dx_abs_5_8_force_positive: dx_diff_5_8 - 246 dx_abs_5_8_is_positive
   >= -246
 dx_abs_5_8_force_negative: dx_diff_5_8 - 246 dx_abs_5_8_is_positive <= 0
 dy_abs_5_8_abs_ge_orig: dy_abs_5_8 - dy_diff_5_8
   - 246 dy_abs_5_8_is_positive >= -246
 dy_abs_5_8_abs_le_orig: dy_abs_5_8 - dy_diff_5_8
   + 246 dy_abs_5_8_is_positive <= 246
 dy_abs_5_8_abs_ge_neg_orig: dy_abs_5_8 + dy_diff_5_8
   + 246 dy_abs_5_8_is_positive >= 0
 dy_abs_5_8_abs_le_neg_orig: dy_abs_5_8 + dy_diff_5_8
   - 246 dy_abs_5_8_is_positive <= 0
 dy_abs_5_8_force_positive: dy_diff_5_8 - 246 dy_abs_5_8_is_positive
   >= -246
 dy_abs_5_8_force_negative: dy_diff_5_8 - 246 dy_abs_5_8_is_positive <= 0
 dx_diff_def_6_7: - cx_grid_var_6 + cx_grid_var_7 + dx_diff_6_7 = 0
 dy_diff_def_6_7: - cy_grid_var_6 + cy_grid_var_7 + dy_diff_6_7 = 0
 dx_abs_6_7_abs_ge_orig: dx_abs_6_7 - dx_diff_6_7
   - 246 dx_abs_6_7_is_positive >= -246
 dx_abs_6_7_abs_le_orig: dx_abs_6_7 - dx_diff_6_7
   + 246 dx_abs_6_7_is_positive <= 246
 dx_abs_6_7_abs_ge_neg_orig: dx_abs_6_7 + dx_diff_6_7
   + 246 dx_abs_6_7_is_positive >= 0
 dx_abs_6_7_abs_le_neg_orig: dx_abs_6_7 + dx_diff_6_7
   - 246 dx_abs_6_7_is_positive <= 0
 dx_abs_6_7_force_positive: dx_diff_6_7 - 246 dx_abs_6_7_is_positive
   >= -246
 dx_abs_6_7_force_negative: dx_diff_6_7 - 246 dx_abs_6_7_is_positive <= 0
 dy_abs_6_7_abs_ge_orig: dy_abs_6_7 - dy_diff_6_7
   - 246 dy_abs_6_7_is_positive >= -246
 dy_abs_6_7_abs_le_orig: dy_abs_6_7 - dy_diff_6_7
   + 246 dy_abs_6_7_is_positive <= 246
 dy_abs_6_7_abs_ge_neg_orig: dy_abs_6_7 + dy_diff_6_7
   + 246 dy_abs_6_7_is_positive >= 0
 dy_abs_6_7_abs_le_neg_orig: dy_abs_6_7 + dy_diff_6_7
   - 246 dy_abs_6_7_is_positive <= 0
 dy_abs_6_7_force_positive: dy_diff_6_7 - 246 dy_abs_6_7_is_positive
   >= -246
 dy_abs_6_7_force_negative: dy_diff_6_7 - 246 dy_abs_6_7_is_positive <= 0
 dx_diff_def_6_8: - cx_grid_var_6 + cx_grid_var_8 + dx_diff_6_8 = 0
 dy_diff_def_6_8: - cy_grid_var_6 + cy_grid_var_8 + dy_diff_6_8 = 0
 dx_abs_6_8_abs_ge_orig: dx_abs_6_8 - dx_diff_6_8
   - 246 dx_abs_6_8_is_positive >= -246
 dx_abs_6_8_abs_le_orig: dx_abs_6_8 - dx_diff_6_8
   + 246 dx_abs_6_8_is_positive <= 246
 dx_abs_6_8_abs_ge_neg_orig: dx_abs_6_8 + dx_diff_6_8
   + 246 dx_abs_6_8_is_positive >= 0
 dx_abs_6_8_abs_le_neg_orig: dx_abs_6_8 + dx_diff_6_8
   - 246 dx_abs_6_8_is_positive <= 0
 dx_abs_6_8_force_positive: dx_diff_6_8 - 246 dx_abs_6_8_is_positive
   >= -246
 dx_abs_6_8_force_negative: dx_diff_6_8 - 246 dx_abs_6_8_is_positive <= 0
 dy_abs_6_8_abs_ge_orig: dy_abs_6_8 - dy_diff_6_8
   - 246 dy_abs_6_8_is_positive >= -246
 dy_abs_6_8_abs_le_orig: dy_abs_6_8 - dy_diff_6_8
   + 246 dy_abs_6_8_is_positive <= 246
 dy_abs_6_8_abs_ge_neg_orig: dy_abs_6_8 + dy_diff_6_8
   + 246 dy_abs_6_8_is_positive >= 0
 dy_abs_6_8_abs_le_neg_orig: dy_abs_6_8 + dy_diff_6_8
   - 246 dy_abs_6_8_is_positive <= 0
 dy_abs_6_8_force_positive: dy_diff_6_8 - 246 dy_abs_6_8_is_positive
   >= -246
 dy_abs_6_8_force_negative: dy_diff_6_8 - 246 dy_abs_6_8_is_positive <= 0
 dx_diff_def_6_9: - cx_grid_var_6 + cx_grid_var_9 + dx_diff_6_9 = 0
 dy_diff_def_6_9: - cy_grid_var_6 + cy_grid_var_9 + dy_diff_6_9 = 0
 dx_abs_6_9_abs_ge_orig: dx_abs_6_9 - dx_diff_6_9
   - 246 dx_abs_6_9_is_positive >= -246
 dx_abs_6_9_abs_le_orig: dx_abs_6_9 - dx_diff_6_9
   + 246 dx_abs_6_9_is_positive <= 246
 dx_abs_6_9_abs_ge_neg_orig: dx_abs_6_9 + dx_diff_6_9
   + 246 dx_abs_6_9_is_positive >= 0
 dx_abs_6_9_abs_le_neg_orig: dx_abs_6_9 + dx_diff_6_9
   - 246 dx_abs_6_9_is_positive <= 0
 dx_abs_6_9_force_positive: dx_diff_6_9 - 246 dx_abs_6_9_is_positive
   >= -246
 dx_abs_6_9_force_negative: dx_diff_6_9 - 246 dx_abs_6_9_is_positive <= 0
 dy_abs_6_9_abs_ge_orig: dy_abs_6_9 - dy_diff_6_9
   - 246 dy_abs_6_9_is_positive >= -246
 dy_abs_6_9_abs_le_orig: dy_abs_6_9 - dy_diff_6_9
   + 246 dy_abs_6_9_is_positive <= 246
 dy_abs_6_9_abs_ge_neg_orig: dy_abs_6_9 + dy_diff_6_9
   + 246 dy_abs_6_9_is_positive >= 0
 dy_abs_6_9_abs_le_neg_orig: dy_abs_6_9 + dy_diff_6_9
   - 246 dy_abs_6_9_is_positive <= 0
 dy_abs_6_9_force_positive: dy_diff_6_9 - 246 dy_abs_6_9_is_positive
   >= -246
 dy_abs_6_9_force_negative: dy_diff_6_9 - 246 dy_abs_6_9_is_positive <= 0
 dx_diff_def_i_0_7: EMIB_cx_grid_var_0_7 - cx_grid_var_0 + dx_diff_i_0_7
   = 0
 dx_diff_def_j_0_7: EMIB_cx_grid_var_0_7 - cx_grid_var_7 + dx_diff_j_0_7
   = 0
 dy_diff_def_i_0_7: EMIB_cy_grid_var_0_7 - cy_grid_var_0 + dy_diff_i_0_7
   = 0
 dy_diff_def_j_0_7: EMIB_cy_grid_var_0_7 - cy_grid_var_7 + dy_diff_j_0_7
   = 0
 dx_abs_i_0_7_abs_ge_orig: dx_abs_i_0_7 - dx_diff_i_0_7
   - 246 dx_abs_i_0_7_is_positive >= -246
 dx_abs_i_0_7_abs_le_orig: dx_abs_i_0_7 - dx_diff_i_0_7
   + 246 dx_abs_i_0_7_is_positive <= 246
 dx_abs_i_0_7_abs_ge_neg_orig: dx_abs_i_0_7 + dx_diff_i_0_7
   + 246 dx_abs_i_0_7_is_positive >= 0
 dx_abs_i_0_7_abs_le_neg_orig: dx_abs_i_0_7 + dx_diff_i_0_7
   - 246 dx_abs_i_0_7_is_positive <= 0
 dx_abs_i_0_7_force_positive: dx_diff_i_0_7 - 246 dx_abs_i_0_7_is_positive
   >= -246
 dx_abs_i_0_7_force_negative: dx_diff_i_0_7 - 246 dx_abs_i_0_7_is_positive
   <= 0
 dy_abs_i_0_7_abs_ge_orig: dy_abs_i_0_7 - dy_diff_i_0_7
   - 246 dy_abs_i_0_7_is_positive >= -246
 dy_abs_i_0_7_abs_le_orig: dy_abs_i_0_7 - dy_diff_i_0_7
   + 246 dy_abs_i_0_7_is_positive <= 246
 dy_abs_i_0_7_abs_ge_neg_orig: dy_abs_i_0_7 + dy_diff_i_0_7
   + 246 dy_abs_i_0_7_is_positive >= 0
 dy_abs_i_0_7_abs_le_neg_orig: dy_abs_i_0_7 + dy_diff_i_0_7
   - 246 dy_abs_i_0_7_is_positive <= 0
 dy_abs_i_0_7_force_positive: dy_diff_i_0_7 - 246 dy_abs_i_0_7_is_positive
   >= -246
 dy_abs_i_0_7_force_negative: dy_diff_i_0_7 - 246 dy_abs_i_0_7_is_positive
   <= 0
 dx_abs_j_0_7_abs_ge_orig: dx_abs_j_0_7 - dx_diff_j_0_7
   - 246 dx_abs_j_0_7_is_positive >= -246
 dx_abs_j_0_7_abs_le_orig: dx_abs_j_0_7 - dx_diff_j_0_7
   + 246 dx_abs_j_0_7_is_positive <= 246
 dx_abs_j_0_7_abs_ge_neg_orig: dx_abs_j_0_7 + dx_diff_j_0_7
   + 246 dx_abs_j_0_7_is_positive >= 0
 dx_abs_j_0_7_abs_le_neg_orig: dx_abs_j_0_7 + dx_diff_j_0_7
   - 246 dx_abs_j_0_7_is_positive <= 0
 dx_abs_j_0_7_force_positive: dx_diff_j_0_7 - 246 dx_abs_j_0_7_is_positive
   >= -246
 dx_abs_j_0_7_force_negative: dx_diff_j_0_7 - 246 dx_abs_j_0_7_is_positive
   <= 0
 dy_abs_j_0_7_abs_ge_orig: dy_abs_j_0_7 - dy_diff_j_0_7
   - 246 dy_abs_j_0_7_is_positive >= -246
 dy_abs_j_0_7_abs_le_orig: dy_abs_j_0_7 - dy_diff_j_0_7
   + 246 dy_abs_j_0_7_is_positive <= 246
 dy_abs_j_0_7_abs_ge_neg_orig: dy_abs_j_0_7 + dy_diff_j_0_7
   + 246 dy_abs_j_0_7_is_positive >= 0
 dy_abs_j_0_7_abs_le_neg_orig: dy_abs_j_0_7 + dy_diff_j_0_7
   - 246 dy_abs_j_0_7_is_positive <= 0
 dy_abs_j_0_7_force_positive: dy_diff_j_0_7 - 246 dy_abs_j_0_7_is_positive
   >= -246
 dy_abs_j_0_7_force_negative: dy_diff_j_0_7 - 246 dy_abs_j_0_7_is_positive
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
   - 246 dx_abs_i_1_4_is_positive >= -246
 dx_abs_i_1_4_abs_le_orig: dx_abs_i_1_4 - dx_diff_i_1_4
   + 246 dx_abs_i_1_4_is_positive <= 246
 dx_abs_i_1_4_abs_ge_neg_orig: dx_abs_i_1_4 + dx_diff_i_1_4
   + 246 dx_abs_i_1_4_is_positive >= 0
 dx_abs_i_1_4_abs_le_neg_orig: dx_abs_i_1_4 + dx_diff_i_1_4
   - 246 dx_abs_i_1_4_is_positive <= 0
 dx_abs_i_1_4_force_positive: dx_diff_i_1_4 - 246 dx_abs_i_1_4_is_positive
   >= -246
 dx_abs_i_1_4_force_negative: dx_diff_i_1_4 - 246 dx_abs_i_1_4_is_positive
   <= 0
 dy_abs_i_1_4_abs_ge_orig: dy_abs_i_1_4 - dy_diff_i_1_4
   - 246 dy_abs_i_1_4_is_positive >= -246
 dy_abs_i_1_4_abs_le_orig: dy_abs_i_1_4 - dy_diff_i_1_4
   + 246 dy_abs_i_1_4_is_positive <= 246
 dy_abs_i_1_4_abs_ge_neg_orig: dy_abs_i_1_4 + dy_diff_i_1_4
   + 246 dy_abs_i_1_4_is_positive >= 0
 dy_abs_i_1_4_abs_le_neg_orig: dy_abs_i_1_4 + dy_diff_i_1_4
   - 246 dy_abs_i_1_4_is_positive <= 0
 dy_abs_i_1_4_force_positive: dy_diff_i_1_4 - 246 dy_abs_i_1_4_is_positive
   >= -246
 dy_abs_i_1_4_force_negative: dy_diff_i_1_4 - 246 dy_abs_i_1_4_is_positive
   <= 0
 dx_abs_j_1_4_abs_ge_orig: dx_abs_j_1_4 - dx_diff_j_1_4
   - 246 dx_abs_j_1_4_is_positive >= -246
 dx_abs_j_1_4_abs_le_orig: dx_abs_j_1_4 - dx_diff_j_1_4
   + 246 dx_abs_j_1_4_is_positive <= 246
 dx_abs_j_1_4_abs_ge_neg_orig: dx_abs_j_1_4 + dx_diff_j_1_4
   + 246 dx_abs_j_1_4_is_positive >= 0
 dx_abs_j_1_4_abs_le_neg_orig: dx_abs_j_1_4 + dx_diff_j_1_4
   - 246 dx_abs_j_1_4_is_positive <= 0
 dx_abs_j_1_4_force_positive: dx_diff_j_1_4 - 246 dx_abs_j_1_4_is_positive
   >= -246
 dx_abs_j_1_4_force_negative: dx_diff_j_1_4 - 246 dx_abs_j_1_4_is_positive
   <= 0
 dy_abs_j_1_4_abs_ge_orig: dy_abs_j_1_4 - dy_diff_j_1_4
   - 246 dy_abs_j_1_4_is_positive >= -246
 dy_abs_j_1_4_abs_le_orig: dy_abs_j_1_4 - dy_diff_j_1_4
   + 246 dy_abs_j_1_4_is_positive <= 246
 dy_abs_j_1_4_abs_ge_neg_orig: dy_abs_j_1_4 + dy_diff_j_1_4
   + 246 dy_abs_j_1_4_is_positive >= 0
 dy_abs_j_1_4_abs_le_neg_orig: dy_abs_j_1_4 + dy_diff_j_1_4
   - 246 dy_abs_j_1_4_is_positive <= 0
 dy_abs_j_1_4_force_positive: dy_diff_j_1_4 - 246 dy_abs_j_1_4_is_positive
   >= -246
 dy_abs_j_1_4_force_negative: dy_diff_j_1_4 - 246 dy_abs_j_1_4_is_positive
   <= 0
 dx_diff_def_i_1_8: EMIB_cx_grid_var_1_8 - cx_grid_var_1 + dx_diff_i_1_8
   = 0
 dx_diff_def_j_1_8: EMIB_cx_grid_var_1_8 - cx_grid_var_8 + dx_diff_j_1_8
   = 0
 dy_diff_def_i_1_8: EMIB_cy_grid_var_1_8 - cy_grid_var_1 + dy_diff_i_1_8
   = 0
 dy_diff_def_j_1_8: EMIB_cy_grid_var_1_8 - cy_grid_var_8 + dy_diff_j_1_8
   = 0
 dx_abs_i_1_8_abs_ge_orig: dx_abs_i_1_8 - dx_diff_i_1_8
   - 246 dx_abs_i_1_8_is_positive >= -246
 dx_abs_i_1_8_abs_le_orig: dx_abs_i_1_8 - dx_diff_i_1_8
   + 246 dx_abs_i_1_8_is_positive <= 246
 dx_abs_i_1_8_abs_ge_neg_orig: dx_abs_i_1_8 + dx_diff_i_1_8
   + 246 dx_abs_i_1_8_is_positive >= 0
 dx_abs_i_1_8_abs_le_neg_orig: dx_abs_i_1_8 + dx_diff_i_1_8
   - 246 dx_abs_i_1_8_is_positive <= 0
 dx_abs_i_1_8_force_positive: dx_diff_i_1_8 - 246 dx_abs_i_1_8_is_positive
   >= -246
 dx_abs_i_1_8_force_negative: dx_diff_i_1_8 - 246 dx_abs_i_1_8_is_positive
   <= 0
 dy_abs_i_1_8_abs_ge_orig: dy_abs_i_1_8 - dy_diff_i_1_8
   - 246 dy_abs_i_1_8_is_positive >= -246
 dy_abs_i_1_8_abs_le_orig: dy_abs_i_1_8 - dy_diff_i_1_8
   + 246 dy_abs_i_1_8_is_positive <= 246
 dy_abs_i_1_8_abs_ge_neg_orig: dy_abs_i_1_8 + dy_diff_i_1_8
   + 246 dy_abs_i_1_8_is_positive >= 0
 dy_abs_i_1_8_abs_le_neg_orig: dy_abs_i_1_8 + dy_diff_i_1_8
   - 246 dy_abs_i_1_8_is_positive <= 0
 dy_abs_i_1_8_force_positive: dy_diff_i_1_8 - 246 dy_abs_i_1_8_is_positive
   >= -246
 dy_abs_i_1_8_force_negative: dy_diff_i_1_8 - 246 dy_abs_i_1_8_is_positive
   <= 0
 dx_abs_j_1_8_abs_ge_orig: dx_abs_j_1_8 - dx_diff_j_1_8
   - 246 dx_abs_j_1_8_is_positive >= -246
 dx_abs_j_1_8_abs_le_orig: dx_abs_j_1_8 - dx_diff_j_1_8
   + 246 dx_abs_j_1_8_is_positive <= 246
 dx_abs_j_1_8_abs_ge_neg_orig: dx_abs_j_1_8 + dx_diff_j_1_8
   + 246 dx_abs_j_1_8_is_positive >= 0
 dx_abs_j_1_8_abs_le_neg_orig: dx_abs_j_1_8 + dx_diff_j_1_8
   - 246 dx_abs_j_1_8_is_positive <= 0
 dx_abs_j_1_8_force_positive: dx_diff_j_1_8 - 246 dx_abs_j_1_8_is_positive
   >= -246
 dx_abs_j_1_8_force_negative: dx_diff_j_1_8 - 246 dx_abs_j_1_8_is_positive
   <= 0
 dy_abs_j_1_8_abs_ge_orig: dy_abs_j_1_8 - dy_diff_j_1_8
   - 246 dy_abs_j_1_8_is_positive >= -246
 dy_abs_j_1_8_abs_le_orig: dy_abs_j_1_8 - dy_diff_j_1_8
   + 246 dy_abs_j_1_8_is_positive <= 246
 dy_abs_j_1_8_abs_ge_neg_orig: dy_abs_j_1_8 + dy_diff_j_1_8
   + 246 dy_abs_j_1_8_is_positive >= 0
 dy_abs_j_1_8_abs_le_neg_orig: dy_abs_j_1_8 + dy_diff_j_1_8
   - 246 dy_abs_j_1_8_is_positive <= 0
 dy_abs_j_1_8_force_positive: dy_diff_j_1_8 - 246 dy_abs_j_1_8_is_positive
   >= -246
 dy_abs_j_1_8_force_negative: dy_diff_j_1_8 - 246 dy_abs_j_1_8_is_positive
   <= 0
 dx_diff_def_i_1_9: EMIB_cx_grid_var_1_9 - cx_grid_var_1 + dx_diff_i_1_9
   = 0
 dx_diff_def_j_1_9: EMIB_cx_grid_var_1_9 - cx_grid_var_9 + dx_diff_j_1_9
   = 0
 dy_diff_def_i_1_9: EMIB_cy_grid_var_1_9 - cy_grid_var_1 + dy_diff_i_1_9
   = 0
 dy_diff_def_j_1_9: EMIB_cy_grid_var_1_9 - cy_grid_var_9 + dy_diff_j_1_9
   = 0
 dx_abs_i_1_9_abs_ge_orig: dx_abs_i_1_9 - dx_diff_i_1_9
   - 246 dx_abs_i_1_9_is_positive >= -246
 dx_abs_i_1_9_abs_le_orig: dx_abs_i_1_9 - dx_diff_i_1_9
   + 246 dx_abs_i_1_9_is_positive <= 246
 dx_abs_i_1_9_abs_ge_neg_orig: dx_abs_i_1_9 + dx_diff_i_1_9
   + 246 dx_abs_i_1_9_is_positive >= 0
 dx_abs_i_1_9_abs_le_neg_orig: dx_abs_i_1_9 + dx_diff_i_1_9
   - 246 dx_abs_i_1_9_is_positive <= 0
 dx_abs_i_1_9_force_positive: dx_diff_i_1_9 - 246 dx_abs_i_1_9_is_positive
   >= -246
 dx_abs_i_1_9_force_negative: dx_diff_i_1_9 - 246 dx_abs_i_1_9_is_positive
   <= 0
 dy_abs_i_1_9_abs_ge_orig: dy_abs_i_1_9 - dy_diff_i_1_9
   - 246 dy_abs_i_1_9_is_positive >= -246
 dy_abs_i_1_9_abs_le_orig: dy_abs_i_1_9 - dy_diff_i_1_9
   + 246 dy_abs_i_1_9_is_positive <= 246
 dy_abs_i_1_9_abs_ge_neg_orig: dy_abs_i_1_9 + dy_diff_i_1_9
   + 246 dy_abs_i_1_9_is_positive >= 0
 dy_abs_i_1_9_abs_le_neg_orig: dy_abs_i_1_9 + dy_diff_i_1_9
   - 246 dy_abs_i_1_9_is_positive <= 0
 dy_abs_i_1_9_force_positive: dy_diff_i_1_9 - 246 dy_abs_i_1_9_is_positive
   >= -246
 dy_abs_i_1_9_force_negative: dy_diff_i_1_9 - 246 dy_abs_i_1_9_is_positive
   <= 0
 dx_abs_j_1_9_abs_ge_orig: dx_abs_j_1_9 - dx_diff_j_1_9
   - 246 dx_abs_j_1_9_is_positive >= -246
 dx_abs_j_1_9_abs_le_orig: dx_abs_j_1_9 - dx_diff_j_1_9
   + 246 dx_abs_j_1_9_is_positive <= 246
 dx_abs_j_1_9_abs_ge_neg_orig: dx_abs_j_1_9 + dx_diff_j_1_9
   + 246 dx_abs_j_1_9_is_positive >= 0
 dx_abs_j_1_9_abs_le_neg_orig: dx_abs_j_1_9 + dx_diff_j_1_9
   - 246 dx_abs_j_1_9_is_positive <= 0
 dx_abs_j_1_9_force_positive: dx_diff_j_1_9 - 246 dx_abs_j_1_9_is_positive
   >= -246
 dx_abs_j_1_9_force_negative: dx_diff_j_1_9 - 246 dx_abs_j_1_9_is_positive
   <= 0
 dy_abs_j_1_9_abs_ge_orig: dy_abs_j_1_9 - dy_diff_j_1_9
   - 246 dy_abs_j_1_9_is_positive >= -246
 dy_abs_j_1_9_abs_le_orig: dy_abs_j_1_9 - dy_diff_j_1_9
   + 246 dy_abs_j_1_9_is_positive <= 246
 dy_abs_j_1_9_abs_ge_neg_orig: dy_abs_j_1_9 + dy_diff_j_1_9
   + 246 dy_abs_j_1_9_is_positive >= 0
 dy_abs_j_1_9_abs_le_neg_orig: dy_abs_j_1_9 + dy_diff_j_1_9
   - 246 dy_abs_j_1_9_is_positive <= 0
 dy_abs_j_1_9_force_positive: dy_diff_j_1_9 - 246 dy_abs_j_1_9_is_positive
   >= -246
 dy_abs_j_1_9_force_negative: dy_diff_j_1_9 - 246 dy_abs_j_1_9_is_positive
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
   - 246 dx_abs_i_2_6_is_positive >= -246
 dx_abs_i_2_6_abs_le_orig: dx_abs_i_2_6 - dx_diff_i_2_6
   + 246 dx_abs_i_2_6_is_positive <= 246
 dx_abs_i_2_6_abs_ge_neg_orig: dx_abs_i_2_6 + dx_diff_i_2_6
   + 246 dx_abs_i_2_6_is_positive >= 0
 dx_abs_i_2_6_abs_le_neg_orig: dx_abs_i_2_6 + dx_diff_i_2_6
   - 246 dx_abs_i_2_6_is_positive <= 0
 dx_abs_i_2_6_force_positive: dx_diff_i_2_6 - 246 dx_abs_i_2_6_is_positive
   >= -246
 dx_abs_i_2_6_force_negative: dx_diff_i_2_6 - 246 dx_abs_i_2_6_is_positive
   <= 0
 dy_abs_i_2_6_abs_ge_orig: dy_abs_i_2_6 - dy_diff_i_2_6
   - 246 dy_abs_i_2_6_is_positive >= -246
 dy_abs_i_2_6_abs_le_orig: dy_abs_i_2_6 - dy_diff_i_2_6
   + 246 dy_abs_i_2_6_is_positive <= 246
 dy_abs_i_2_6_abs_ge_neg_orig: dy_abs_i_2_6 + dy_diff_i_2_6
   + 246 dy_abs_i_2_6_is_positive >= 0
 dy_abs_i_2_6_abs_le_neg_orig: dy_abs_i_2_6 + dy_diff_i_2_6
   - 246 dy_abs_i_2_6_is_positive <= 0
 dy_abs_i_2_6_force_positive: dy_diff_i_2_6 - 246 dy_abs_i_2_6_is_positive
   >= -246
 dy_abs_i_2_6_force_negative: dy_diff_i_2_6 - 246 dy_abs_i_2_6_is_positive
   <= 0
 dx_abs_j_2_6_abs_ge_orig: dx_abs_j_2_6 - dx_diff_j_2_6
   - 246 dx_abs_j_2_6_is_positive >= -246
 dx_abs_j_2_6_abs_le_orig: dx_abs_j_2_6 - dx_diff_j_2_6
   + 246 dx_abs_j_2_6_is_positive <= 246
 dx_abs_j_2_6_abs_ge_neg_orig: dx_abs_j_2_6 + dx_diff_j_2_6
   + 246 dx_abs_j_2_6_is_positive >= 0
 dx_abs_j_2_6_abs_le_neg_orig: dx_abs_j_2_6 + dx_diff_j_2_6
   - 246 dx_abs_j_2_6_is_positive <= 0
 dx_abs_j_2_6_force_positive: dx_diff_j_2_6 - 246 dx_abs_j_2_6_is_positive
   >= -246
 dx_abs_j_2_6_force_negative: dx_diff_j_2_6 - 246 dx_abs_j_2_6_is_positive
   <= 0
 dy_abs_j_2_6_abs_ge_orig: dy_abs_j_2_6 - dy_diff_j_2_6
   - 246 dy_abs_j_2_6_is_positive >= -246
 dy_abs_j_2_6_abs_le_orig: dy_abs_j_2_6 - dy_diff_j_2_6
   + 246 dy_abs_j_2_6_is_positive <= 246
 dy_abs_j_2_6_abs_ge_neg_orig: dy_abs_j_2_6 + dy_diff_j_2_6
   + 246 dy_abs_j_2_6_is_positive >= 0
 dy_abs_j_2_6_abs_le_neg_orig: dy_abs_j_2_6 + dy_diff_j_2_6
   - 246 dy_abs_j_2_6_is_positive <= 0
 dy_abs_j_2_6_force_positive: dy_diff_j_2_6 - 246 dy_abs_j_2_6_is_positive
   >= -246
 dy_abs_j_2_6_force_negative: dy_diff_j_2_6 - 246 dy_abs_j_2_6_is_positive
   <= 0
 dx_diff_def_i_4_6: EMIB_cx_grid_var_4_6 - cx_grid_var_4 + dx_diff_i_4_6
   = 0
 dx_diff_def_j_4_6: EMIB_cx_grid_var_4_6 - cx_grid_var_6 + dx_diff_j_4_6
   = 0
 dy_diff_def_i_4_6: EMIB_cy_grid_var_4_6 - cy_grid_var_4 + dy_diff_i_4_6
   = 0
 dy_diff_def_j_4_6: EMIB_cy_grid_var_4_6 - cy_grid_var_6 + dy_diff_j_4_6
   = 0
 dx_abs_i_4_6_abs_ge_orig: dx_abs_i_4_6 - dx_diff_i_4_6
   - 246 dx_abs_i_4_6_is_positive >= -246
 dx_abs_i_4_6_abs_le_orig: dx_abs_i_4_6 - dx_diff_i_4_6
   + 246 dx_abs_i_4_6_is_positive <= 246
 dx_abs_i_4_6_abs_ge_neg_orig: dx_abs_i_4_6 + dx_diff_i_4_6
   + 246 dx_abs_i_4_6_is_positive >= 0
 dx_abs_i_4_6_abs_le_neg_orig: dx_abs_i_4_6 + dx_diff_i_4_6
   - 246 dx_abs_i_4_6_is_positive <= 0
 dx_abs_i_4_6_force_positive: dx_diff_i_4_6 - 246 dx_abs_i_4_6_is_positive
   >= -246
 dx_abs_i_4_6_force_negative: dx_diff_i_4_6 - 246 dx_abs_i_4_6_is_positive
   <= 0
 dy_abs_i_4_6_abs_ge_orig: dy_abs_i_4_6 - dy_diff_i_4_6
   - 246 dy_abs_i_4_6_is_positive >= -246
 dy_abs_i_4_6_abs_le_orig: dy_abs_i_4_6 - dy_diff_i_4_6
   + 246 dy_abs_i_4_6_is_positive <= 246
 dy_abs_i_4_6_abs_ge_neg_orig: dy_abs_i_4_6 + dy_diff_i_4_6
   + 246 dy_abs_i_4_6_is_positive >= 0
 dy_abs_i_4_6_abs_le_neg_orig: dy_abs_i_4_6 + dy_diff_i_4_6
   - 246 dy_abs_i_4_6_is_positive <= 0
 dy_abs_i_4_6_force_positive: dy_diff_i_4_6 - 246 dy_abs_i_4_6_is_positive
   >= -246
 dy_abs_i_4_6_force_negative: dy_diff_i_4_6 - 246 dy_abs_i_4_6_is_positive
   <= 0
 dx_abs_j_4_6_abs_ge_orig: dx_abs_j_4_6 - dx_diff_j_4_6
   - 246 dx_abs_j_4_6_is_positive >= -246
 dx_abs_j_4_6_abs_le_orig: dx_abs_j_4_6 - dx_diff_j_4_6
   + 246 dx_abs_j_4_6_is_positive <= 246
 dx_abs_j_4_6_abs_ge_neg_orig: dx_abs_j_4_6 + dx_diff_j_4_6
   + 246 dx_abs_j_4_6_is_positive >= 0
 dx_abs_j_4_6_abs_le_neg_orig: dx_abs_j_4_6 + dx_diff_j_4_6
   - 246 dx_abs_j_4_6_is_positive <= 0
 dx_abs_j_4_6_force_positive: dx_diff_j_4_6 - 246 dx_abs_j_4_6_is_positive
   >= -246
 dx_abs_j_4_6_force_negative: dx_diff_j_4_6 - 246 dx_abs_j_4_6_is_positive
   <= 0
 dy_abs_j_4_6_abs_ge_orig: dy_abs_j_4_6 - dy_diff_j_4_6
   - 246 dy_abs_j_4_6_is_positive >= -246
 dy_abs_j_4_6_abs_le_orig: dy_abs_j_4_6 - dy_diff_j_4_6
   + 246 dy_abs_j_4_6_is_positive <= 246
 dy_abs_j_4_6_abs_ge_neg_orig: dy_abs_j_4_6 + dy_diff_j_4_6
   + 246 dy_abs_j_4_6_is_positive >= 0
 dy_abs_j_4_6_abs_le_neg_orig: dy_abs_j_4_6 + dy_diff_j_4_6
   - 246 dy_abs_j_4_6_is_positive <= 0
 dy_abs_j_4_6_force_positive: dy_diff_j_4_6 - 246 dy_abs_j_4_6_is_positive
   >= -246
 dy_abs_j_4_6_force_negative: dy_diff_j_4_6 - 246 dy_abs_j_4_6_is_positive
   <= 0
 dx_diff_def_i_8_9: EMIB_cx_grid_var_8_9 - cx_grid_var_8 + dx_diff_i_8_9
   = 0
 dx_diff_def_j_8_9: EMIB_cx_grid_var_8_9 - cx_grid_var_9 + dx_diff_j_8_9
   = 0
 dy_diff_def_i_8_9: EMIB_cy_grid_var_8_9 - cy_grid_var_8 + dy_diff_i_8_9
   = 0
 dy_diff_def_j_8_9: EMIB_cy_grid_var_8_9 - cy_grid_var_9 + dy_diff_j_8_9
   = 0
 dx_abs_i_8_9_abs_ge_orig: dx_abs_i_8_9 - dx_diff_i_8_9
   - 246 dx_abs_i_8_9_is_positive >= -246
 dx_abs_i_8_9_abs_le_orig: dx_abs_i_8_9 - dx_diff_i_8_9
   + 246 dx_abs_i_8_9_is_positive <= 246
 dx_abs_i_8_9_abs_ge_neg_orig: dx_abs_i_8_9 + dx_diff_i_8_9
   + 246 dx_abs_i_8_9_is_positive >= 0
 dx_abs_i_8_9_abs_le_neg_orig: dx_abs_i_8_9 + dx_diff_i_8_9
   - 246 dx_abs_i_8_9_is_positive <= 0
 dx_abs_i_8_9_force_positive: dx_diff_i_8_9 - 246 dx_abs_i_8_9_is_positive
   >= -246
 dx_abs_i_8_9_force_negative: dx_diff_i_8_9 - 246 dx_abs_i_8_9_is_positive
   <= 0
 dy_abs_i_8_9_abs_ge_orig: dy_abs_i_8_9 - dy_diff_i_8_9
   - 246 dy_abs_i_8_9_is_positive >= -246
 dy_abs_i_8_9_abs_le_orig: dy_abs_i_8_9 - dy_diff_i_8_9
   + 246 dy_abs_i_8_9_is_positive <= 246
 dy_abs_i_8_9_abs_ge_neg_orig: dy_abs_i_8_9 + dy_diff_i_8_9
   + 246 dy_abs_i_8_9_is_positive >= 0
 dy_abs_i_8_9_abs_le_neg_orig: dy_abs_i_8_9 + dy_diff_i_8_9
   - 246 dy_abs_i_8_9_is_positive <= 0
 dy_abs_i_8_9_force_positive: dy_diff_i_8_9 - 246 dy_abs_i_8_9_is_positive
   >= -246
 dy_abs_i_8_9_force_negative: dy_diff_i_8_9 - 246 dy_abs_i_8_9_is_positive
   <= 0
 dx_abs_j_8_9_abs_ge_orig: dx_abs_j_8_9 - dx_diff_j_8_9
   - 246 dx_abs_j_8_9_is_positive >= -246
 dx_abs_j_8_9_abs_le_orig: dx_abs_j_8_9 - dx_diff_j_8_9
   + 246 dx_abs_j_8_9_is_positive <= 246
 dx_abs_j_8_9_abs_ge_neg_orig: dx_abs_j_8_9 + dx_diff_j_8_9
   + 246 dx_abs_j_8_9_is_positive >= 0
 dx_abs_j_8_9_abs_le_neg_orig: dx_abs_j_8_9 + dx_diff_j_8_9
   - 246 dx_abs_j_8_9_is_positive <= 0
 dx_abs_j_8_9_force_positive: dx_diff_j_8_9 - 246 dx_abs_j_8_9_is_positive
   >= -246
 dx_abs_j_8_9_force_negative: dx_diff_j_8_9 - 246 dx_abs_j_8_9_is_positive
   <= 0
 dy_abs_j_8_9_abs_ge_orig: dy_abs_j_8_9 - dy_diff_j_8_9
   - 246 dy_abs_j_8_9_is_positive >= -246
 dy_abs_j_8_9_abs_le_orig: dy_abs_j_8_9 - dy_diff_j_8_9
   + 246 dy_abs_j_8_9_is_positive <= 246
 dy_abs_j_8_9_abs_ge_neg_orig: dy_abs_j_8_9 + dy_diff_j_8_9
   + 246 dy_abs_j_8_9_is_positive >= 0
 dy_abs_j_8_9_abs_le_neg_orig: dy_abs_j_8_9 + dy_diff_j_8_9
   - 246 dy_abs_j_8_9_is_positive <= 0
 dy_abs_j_8_9_force_positive: dy_diff_j_8_9 - 246 dy_abs_j_8_9_is_positive
   >= -246
 dy_abs_j_8_9_force_negative: dy_diff_j_8_9 - 246 dy_abs_j_8_9_is_positive
   <= 0
 wirelength_def: wirelength - 128 dx_abs_0_4 - 128 dy_abs_0_4
   - 128 dx_abs_1_7 - 128 dy_abs_1_7 - 128 dx_abs_2_3 - 128 dy_abs_2_3
   - 128 dx_abs_2_4 - 128 dy_abs_2_4 - 128 dx_abs_4_5 - 128 dy_abs_4_5
   - 128 dx_abs_4_7 - 128 dy_abs_4_7 - 128 dx_abs_5_8 - 128 dy_abs_5_8
   - 128 dx_abs_6_7 - 128 dy_abs_6_7 - 128 dx_abs_6_8 - 128 dy_abs_6_8
   - 128 dx_abs_6_9 - 128 dy_abs_6_9 - 256 dx_abs_i_0_7 - 256 dy_abs_i_0_7
   - 256 dx_abs_j_0_7 - 256 dy_abs_j_0_7 - 512 dx_abs_i_1_4
   - 512 dy_abs_i_1_4 - 512 dx_abs_j_1_4 - 512 dy_abs_j_1_4
   - 256 dx_abs_i_1_8 - 256 dy_abs_i_1_8 - 256 dx_abs_j_1_8
   - 256 dy_abs_j_1_8 - 512 dx_abs_i_1_9 - 512 dy_abs_i_1_9
   - 512 dx_abs_j_1_9 - 512 dy_abs_j_1_9 - 512 dx_abs_i_2_6
   - 512 dy_abs_i_2_6 - 512 dx_abs_j_2_6 - 512 dy_abs_j_2_6
   - 256 dx_abs_i_4_6 - 256 dy_abs_i_4_6 - 256 dx_abs_j_4_6
   - 256 dy_abs_j_4_6 - 256 dx_abs_i_8_9 - 256 dy_abs_i_8_9
   - 256 dx_abs_j_8_9 - 256 dy_abs_j_8_9 = 0
 t_ge_scaled_mean: - 0.8 bbox_w - 0.8 bbox_h + bbox_area_proxy_t >= 0
Bounds
 10 <= w_var_0 <= 11
 10 <= h_var_0 <= 11
 10 <= w_var_1 <= 12
 10 <= h_var_1 <= 12
 6 <= w_var_2 <= 15
 6 <= h_var_2 <= 15
 6 <= w_var_3 <= 13
 6 <= h_var_3 <= 13
 5 <= w_var_4 <= 11
 5 <= h_var_4 <= 11
 6 <= w_var_5 <= 15
 6 <= h_var_5 <= 15
 w_var_6 = 5
 h_var_6 = 5
 6 <= w_var_7 <= 14
 6 <= h_var_7 <= 14
 6 <= w_var_8 <= 12
 6 <= h_var_8 <= 12
 6 <= w_var_9 <= 13
 6 <= h_var_9 <= 13
 0.8533 <= EMIB_w_var_0_7 <= 2
 0.8533 <= EMIB_h_var_0_7 <= 2
 1.7067 <= EMIB_w_var_1_4 <= 2
 1.7067 <= EMIB_h_var_1_4 <= 2
 0.8533 <= EMIB_w_var_1_8 <= 2
 0.8533 <= EMIB_h_var_1_8 <= 2
 1.7067 <= EMIB_w_var_1_9 <= 2
 1.7067 <= EMIB_h_var_1_9 <= 2
 1.7067 <= EMIB_w_var_2_6 <= 2
 1.7067 <= EMIB_h_var_2_6 <= 2
 0.8533 <= EMIB_w_var_4_6 <= 2
 0.8533 <= EMIB_h_var_4_6 <= 2
 0.8533 <= EMIB_w_var_8_9 <= 2
 0.8533 <= EMIB_h_var_8_9 <= 2
 x_grid_var_0 <= 123
 y_grid_var_0 <= 123
 x_grid_var_1 <= 123
 y_grid_var_1 <= 123
 x_grid_var_2 <= 123
 y_grid_var_2 <= 123
 x_grid_var_3 <= 123
 y_grid_var_3 <= 123
 x_grid_var_4 <= 123
 y_grid_var_4 <= 123
 x_grid_var_5 <= 123
 y_grid_var_5 <= 123
 x_grid_var_6 <= 123
 y_grid_var_6 <= 123
 x_grid_var_7 <= 123
 y_grid_var_7 <= 123
 x_grid_var_8 <= 123
 y_grid_var_8 <= 123
 x_grid_var_9 <= 123
 y_grid_var_9 <= 123
 EMIB_x_grid_var_0_7 <= 123
 EMIB_y_grid_var_0_7 <= 123
 EMIB_x_grid_var_1_4 <= 123
 EMIB_y_grid_var_1_4 <= 123
 EMIB_x_grid_var_1_8 <= 123
 EMIB_y_grid_var_1_8 <= 123
 EMIB_x_grid_var_1_9 <= 123
 EMIB_y_grid_var_1_9 <= 123
 EMIB_x_grid_var_2_6 <= 123
 EMIB_y_grid_var_2_6 <= 123
 EMIB_x_grid_var_4_6 <= 123
 EMIB_y_grid_var_4_6 <= 123
 EMIB_x_grid_var_8_9 <= 123
 EMIB_y_grid_var_8_9 <= 123
 EMIB_cx_grid_var_0_7 <= 246
 EMIB_cy_grid_var_0_7 <= 246
 EMIB_cx_grid_var_1_4 <= 246
 EMIB_cy_grid_var_1_4 <= 246
 EMIB_cx_grid_var_1_8 <= 246
 EMIB_cy_grid_var_1_8 <= 246
 EMIB_cx_grid_var_1_9 <= 246
 EMIB_cy_grid_var_1_9 <= 246
 EMIB_cx_grid_var_2_6 <= 246
 EMIB_cy_grid_var_2_6 <= 246
 EMIB_cx_grid_var_4_6 <= 246
 EMIB_cy_grid_var_4_6 <= 246
 EMIB_cx_grid_var_8_9 <= 246
 EMIB_cy_grid_var_8_9 <= 246
 cx_grid_var_0 <= 246
 cy_grid_var_0 <= 246
 cx_grid_var_1 <= 246
 cy_grid_var_1 <= 246
 cx_grid_var_2 <= 246
 cy_grid_var_2 <= 246
 cx_grid_var_3 <= 246
 cy_grid_var_3 <= 246
 cx_grid_var_4 <= 246
 cy_grid_var_4 <= 246
 cx_grid_var_5 <= 246
 cy_grid_var_5 <= 246
 cx_grid_var_6 <= 246
 cy_grid_var_6 <= 246
 cx_grid_var_7 <= 246
 cy_grid_var_7 <= 246
 cx_grid_var_8 <= 246
 cy_grid_var_8 <= 246
 cx_grid_var_9 <= 246
 cy_grid_var_9 <= 246
 cx_center <= 123
 cy_center <= 123
 bbox_min_x <= 123
 bbox_max_x <= 123
 bbox_min_y <= 123
 bbox_max_y <= 123
 bbox_w <= 123
 bbox_h <= 123
 aspect_ratio_penalty <= 123
 dx_grid_abs_pair_6_7 <= 123
 dy_grid_abs_pair_6_7 <= 123
 -123 <= dx_grid_diff_6_7 <= 123
 -123 <= dy_grid_diff_6_7 <= 123
 dist_curr_pair_6_7 <= 246
 dx_grid_abs_pair_6_9 <= 123
 dy_grid_abs_pair_6_9 <= 123
 -123 <= dx_grid_diff_6_9 <= 123
 -123 <= dy_grid_diff_6_9 <= 123
 dist_curr_pair_6_9 <= 246
 dx_grid_abs_pair_7_9 <= 123
 dy_grid_abs_pair_7_9 <= 123
 -123 <= dx_grid_diff_7_9 <= 123
 -123 <= dy_grid_diff_7_9 <= 123
 dist_curr_pair_7_9 <= 246
 -123 <= dx_center_diff_6 <= 123
 dx_center_abs_6 <= 123
 -123 <= dy_center_diff_6 <= 123
 dy_center_abs_6 <= 123
 dist_center_6 <= 246
 -123 <= dx_center_diff_7 <= 123
 dx_center_abs_7 <= 123
 -123 <= dy_center_diff_7 <= 123
 dy_center_abs_7 <= 123
 dist_center_7 <= 246
 -123 <= dx_center_diff_9 <= 123
 dx_center_abs_9 <= 123
 -123 <= dy_center_diff_9 <= 123
 dy_center_abs_9 <= 123
 dist_center_9 <= 246
 wirelength <= 1.7129472e+07
 -123 <= dx_diff_0_4 <= 123
 -123 <= dy_diff_0_4 <= 123
 -123 <= dx_diff_1_7 <= 123
 -123 <= dy_diff_1_7 <= 123
 -123 <= dx_diff_2_3 <= 123
 -123 <= dy_diff_2_3 <= 123
 -123 <= dx_diff_2_4 <= 123
 -123 <= dy_diff_2_4 <= 123
 -123 <= dx_diff_4_5 <= 123
 -123 <= dy_diff_4_5 <= 123
 -123 <= dx_diff_4_7 <= 123
 -123 <= dy_diff_4_7 <= 123
 -123 <= dx_diff_5_8 <= 123
 -123 <= dy_diff_5_8 <= 123
 -123 <= dx_diff_6_7 <= 123
 -123 <= dy_diff_6_7 <= 123
 -123 <= dx_diff_6_8 <= 123
 -123 <= dy_diff_6_8 <= 123
 -123 <= dx_diff_6_9 <= 123
 -123 <= dy_diff_6_9 <= 123
 -123 <= dx_diff_i_0_7 <= 123
 -123 <= dy_diff_i_0_7 <= 123
 -123 <= dx_diff_j_0_7 <= 123
 -123 <= dy_diff_j_0_7 <= 123
 -123 <= dx_diff_i_1_4 <= 123
 -123 <= dy_diff_i_1_4 <= 123
 -123 <= dx_diff_j_1_4 <= 123
 -123 <= dy_diff_j_1_4 <= 123
 -123 <= dx_diff_i_1_8 <= 123
 -123 <= dy_diff_i_1_8 <= 123
 -123 <= dx_diff_j_1_8 <= 123
 -123 <= dy_diff_j_1_8 <= 123
 -123 <= dx_diff_i_1_9 <= 123
 -123 <= dy_diff_i_1_9 <= 123
 -123 <= dx_diff_j_1_9 <= 123
 -123 <= dy_diff_j_1_9 <= 123
 -123 <= dx_diff_i_2_6 <= 123
 -123 <= dy_diff_i_2_6 <= 123
 -123 <= dx_diff_j_2_6 <= 123
 -123 <= dy_diff_j_2_6 <= 123
 -123 <= dx_diff_i_4_6 <= 123
 -123 <= dy_diff_i_4_6 <= 123
 -123 <= dx_diff_j_4_6 <= 123
 -123 <= dy_diff_j_4_6 <= 123
 -123 <= dx_diff_i_8_9 <= 123
 -123 <= dy_diff_i_8_9 <= 123
 -123 <= dx_diff_j_8_9 <= 123
 -123 <= dy_diff_j_8_9 <= 123
 bbox_area_proxy_t <= 246
Binaries
 r_0 r_1 r_2 r_3 r_4 r_5 r_6 r_7 r_8 r_9 r_EMIB_0_7 r_EMIB_1_4 r_EMIB_1_8
 r_EMIB_1_9 r_EMIB_2_6 r_EMIB_4_6 r_EMIB_8_9 z1_0_7 z2_0_7 z1L_0_7 z1R_0_7
 z2D_0_7 z2U_0_7 z1_1_4 z2_1_4 z1L_1_4 z1R_1_4 z2D_1_4 z2U_1_4 z1_1_8
 z2_1_8 z1L_1_8 z1R_1_8 z2D_1_8 z2U_1_8 z1_1_9 z2_1_9 z1L_1_9 z1R_1_9
 z2D_1_9 z2U_1_9 z1_2_6 z2_2_6 z1L_2_6 z1R_2_6 z2D_2_6 z2U_2_6 z1_4_6
 z2_4_6 z1L_4_6 z1R_4_6 z2D_4_6 z2U_4_6 z1_8_9 z2_8_9 z1L_8_9 z1R_8_9
 z2D_8_9 z2U_8_9 p_left_0_1 p_right_0_1 p_down_0_1 p_up_0_1 p_left_0_2
 p_right_0_2 p_down_0_2 p_up_0_2 p_left_0_3 p_right_0_3 p_down_0_3 p_up_0_3
 p_left_0_4 p_right_0_4 p_down_0_4 p_up_0_4 p_left_0_5 p_right_0_5
 p_down_0_5 p_up_0_5 p_left_0_6 p_right_0_6 p_down_0_6 p_up_0_6 p_left_0_7
 p_right_0_7 p_down_0_7 p_up_0_7 p_left_0_8 p_right_0_8 p_down_0_8 p_up_0_8
 p_left_0_9 p_right_0_9 p_down_0_9 p_up_0_9 p_left_1_2 p_right_1_2
 p_down_1_2 p_up_1_2 p_left_1_3 p_right_1_3 p_down_1_3 p_up_1_3 p_left_1_4
 p_right_1_4 p_down_1_4 p_up_1_4 p_left_1_5 p_right_1_5 p_down_1_5 p_up_1_5
 p_left_1_6 p_right_1_6 p_down_1_6 p_up_1_6 p_left_1_7 p_right_1_7
 p_down_1_7 p_up_1_7 p_left_1_8 p_right_1_8 p_down_1_8 p_up_1_8 p_left_1_9
 p_right_1_9 p_down_1_9 p_up_1_9 p_left_2_3 p_right_2_3 p_down_2_3 p_up_2_3
 p_left_2_4 p_right_2_4 p_down_2_4 p_up_2_4 p_left_2_5 p_right_2_5
 p_down_2_5 p_up_2_5 p_left_2_6 p_right_2_6 p_down_2_6 p_up_2_6 p_left_2_7
 p_right_2_7 p_down_2_7 p_up_2_7 p_left_2_8 p_right_2_8 p_down_2_8 p_up_2_8
 p_left_2_9 p_right_2_9 p_down_2_9 p_up_2_9 p_left_3_4 p_right_3_4
 p_down_3_4 p_up_3_4 p_left_3_5 p_right_3_5 p_down_3_5 p_up_3_5 p_left_3_6
 p_right_3_6 p_down_3_6 p_up_3_6 p_left_3_7 p_right_3_7 p_down_3_7 p_up_3_7
 p_left_3_8 p_right_3_8 p_down_3_8 p_up_3_8 p_left_3_9 p_right_3_9
 p_down_3_9 p_up_3_9 p_left_4_5 p_right_4_5 p_down_4_5 p_up_4_5 p_left_4_6
 p_right_4_6 p_down_4_6 p_up_4_6 p_left_4_7 p_right_4_7 p_down_4_7 p_up_4_7
 p_left_4_8 p_right_4_8 p_down_4_8 p_up_4_8 p_left_4_9 p_right_4_9
 p_down_4_9 p_up_4_9 p_left_5_6 p_right_5_6 p_down_5_6 p_up_5_6 p_left_5_7
 p_right_5_7 p_down_5_7 p_up_5_7 p_left_5_8 p_right_5_8 p_down_5_8 p_up_5_8
 p_left_5_9 p_right_5_9 p_down_5_9 p_up_5_9 p_left_6_7 p_right_6_7
 p_down_6_7 p_up_6_7 p_left_6_8 p_right_6_8 p_down_6_8 p_up_6_8 p_left_6_9
 p_right_6_9 p_down_6_9 p_up_6_9 p_left_7_8 p_right_7_8 p_down_7_8 p_up_7_8
 p_left_7_9 p_right_7_9 p_down_7_9 p_up_7_9 p_left_8_9 p_right_8_9
 p_down_8_9 p_up_8_9 p_EMIB_left_1_4_1_8 p_EMIB_right_1_4_1_8
 p_EMIB_down_1_4_1_8 p_EMIB_up_1_4_1_8 p_EMIB_left_1_4_1_9
 p_EMIB_right_1_4_1_9 p_EMIB_down_1_4_1_9 p_EMIB_up_1_4_1_9
 p_EMIB_left_1_4_4_6 p_EMIB_right_1_4_4_6 p_EMIB_down_1_4_4_6
 p_EMIB_up_1_4_4_6 p_EMIB_left_1_8_1_9 p_EMIB_right_1_8_1_9
 p_EMIB_down_1_8_1_9 p_EMIB_up_1_8_1_9 p_EMIB_left_1_8_8_9
 p_EMIB_right_1_8_8_9 p_EMIB_down_1_8_8_9 p_EMIB_up_1_8_8_9
 p_EMIB_left_1_9_8_9 p_EMIB_right_1_9_8_9 p_EMIB_down_1_9_8_9
 p_EMIB_up_1_9_8_9 p_EMIB_left_2_6_4_6 p_EMIB_right_2_6_4_6
 p_EMIB_down_2_6_4_6 p_EMIB_up_2_6_4_6 dx_grid_abs_pair_6_7_is_positive
 dy_grid_abs_pair_6_7_is_positive dx_grid_abs_pair_6_9_is_positive
 dy_grid_abs_pair_6_9_is_positive dx_grid_abs_pair_7_9_is_positive
 dy_grid_abs_pair_7_9_is_positive dx_center_abs_6_is_positive
 dy_center_abs_6_is_positive dx_center_abs_7_is_positive
 dy_center_abs_7_is_positive dx_center_abs_9_is_positive
 dy_center_abs_9_is_positive dx_abs_0_4_is_positive dy_abs_0_4_is_positive
 dx_abs_1_7_is_positive dy_abs_1_7_is_positive dx_abs_2_3_is_positive
 dy_abs_2_3_is_positive dx_abs_2_4_is_positive dy_abs_2_4_is_positive
 dx_abs_4_5_is_positive dy_abs_4_5_is_positive dx_abs_4_7_is_positive
 dy_abs_4_7_is_positive dx_abs_5_8_is_positive dy_abs_5_8_is_positive
 dx_abs_6_7_is_positive dy_abs_6_7_is_positive dx_abs_6_8_is_positive
 dy_abs_6_8_is_positive dx_abs_6_9_is_positive dy_abs_6_9_is_positive
 dx_abs_i_0_7_is_positive dy_abs_i_0_7_is_positive dx_abs_j_0_7_is_positive
 dy_abs_j_0_7_is_positive dx_abs_i_1_4_is_positive dy_abs_i_1_4_is_positive
 dx_abs_j_1_4_is_positive dy_abs_j_1_4_is_positive dx_abs_i_1_8_is_positive
 dy_abs_i_1_8_is_positive dx_abs_j_1_8_is_positive dy_abs_j_1_8_is_positive
 dx_abs_i_1_9_is_positive dy_abs_i_1_9_is_positive dx_abs_j_1_9_is_positive
 dy_abs_j_1_9_is_positive dx_abs_i_2_6_is_positive dy_abs_i_2_6_is_positive
 dx_abs_j_2_6_is_positive dy_abs_j_2_6_is_positive dx_abs_i_4_6_is_positive
 dy_abs_i_4_6_is_positive dx_abs_j_4_6_is_positive dy_abs_j_4_6_is_positive
 dx_abs_i_8_9_is_positive dy_abs_i_8_9_is_positive dx_abs_j_8_9_is_positive
 dy_abs_j_8_9_is_positive
End

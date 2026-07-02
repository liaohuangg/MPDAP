\ Model ChipletPlacementGrid
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0xeda01947afbad512
Minimize
  0 r_9 + 0.00416666666666667 aspect_ratio_penalty
   - 5.80907e-06 power_aware_penalty + 3.68056e-05 wirelength
   + 0.1130667542166614 bbox_area_proxy_t
Subject To
 width_rotation_0: - 2 r_0 + w_var_0 = 6
 height_rotation_0: 2 r_0 + h_var_0 = 8
 x_grid_var_ub_0: w_var_0 + x_grid_var_0 <= 114
 y_grid_var_ub_0: h_var_0 + y_grid_var_0 <= 114
 width_rotation_1: r_1 + w_var_1 = 6
 height_rotation_1: - r_1 + h_var_1 = 5
 x_grid_var_ub_1: w_var_1 + x_grid_var_1 <= 114
 y_grid_var_ub_1: h_var_1 + y_grid_var_1 <= 114
 width_rotation_2: r_2 + w_var_2 = 9
 height_rotation_2: - r_2 + h_var_2 = 8
 x_grid_var_ub_2: w_var_2 + x_grid_var_2 <= 114
 y_grid_var_ub_2: h_var_2 + y_grid_var_2 <= 114
 width_rotation_3: r_3 + w_var_3 = 7
 height_rotation_3: - r_3 + h_var_3 = 6
 x_grid_var_ub_3: w_var_3 + x_grid_var_3 <= 114
 y_grid_var_ub_3: h_var_3 + y_grid_var_3 <= 114
 width_rotation_4: - 2 r_4 + w_var_4 = 5
 height_rotation_4: 2 r_4 + h_var_4 = 7
 x_grid_var_ub_4: w_var_4 + x_grid_var_4 <= 114
 y_grid_var_ub_4: h_var_4 + y_grid_var_4 <= 114
 width_rotation_5: - r_5 + w_var_5 = 8
 height_rotation_5: r_5 + h_var_5 = 9
 x_grid_var_ub_5: w_var_5 + x_grid_var_5 <= 114
 y_grid_var_ub_5: h_var_5 + y_grid_var_5 <= 114
 width_rotation_6: r_6 + w_var_6 = 7
 height_rotation_6: - r_6 + h_var_6 = 6
 x_grid_var_ub_6: w_var_6 + x_grid_var_6 <= 114
 y_grid_var_ub_6: h_var_6 + y_grid_var_6 <= 114
 width_rotation_7: - 4 r_7 + w_var_7 = 5
 height_rotation_7: 4 r_7 + h_var_7 = 9
 x_grid_var_ub_7: w_var_7 + x_grid_var_7 <= 114
 y_grid_var_ub_7: h_var_7 + y_grid_var_7 <= 114
 width_rotation_8: 3 r_8 + w_var_8 = 9
 height_rotation_8: - 3 r_8 + h_var_8 = 6
 x_grid_var_ub_8: w_var_8 + x_grid_var_8 <= 114
 y_grid_var_ub_8: h_var_8 + y_grid_var_8 <= 114
 width_rotation_9: w_var_9 = 6
 height_rotation_9: h_var_9 = 6
 x_grid_var_ub_9: w_var_9 + x_grid_var_9 <= 114
 y_grid_var_ub_9: h_var_9 + y_grid_var_9 <= 114
 width_rotation_10: - r_10 + w_var_10 = 6
 height_rotation_10: r_10 + h_var_10 = 7
 x_grid_var_ub_10: w_var_10 + x_grid_var_10 <= 114
 y_grid_var_ub_10: h_var_10 + y_grid_var_10 <= 114
 width_rotation_11: 2 r_11 + w_var_11 = 8
 height_rotation_11: - 2 r_11 + h_var_11 = 6
 x_grid_var_ub_11: w_var_11 + x_grid_var_11 <= 114
 y_grid_var_ub_11: h_var_11 + y_grid_var_11 <= 114
 width_rotation_12: - r_12 + w_var_12 = 7
 height_rotation_12: r_12 + h_var_12 = 8
 x_grid_var_ub_12: w_var_12 + x_grid_var_12 <= 114
 y_grid_var_ub_12: h_var_12 + y_grid_var_12 <= 114
 width_rotation_13: r_13 + w_var_13 = 7
 height_rotation_13: - r_13 + h_var_13 = 6
 x_grid_var_ub_13: w_var_13 + x_grid_var_13 <= 114
 y_grid_var_ub_13: h_var_13 + y_grid_var_13 <= 114
 width_rotation_14: 3 r_14 + w_var_14 = 8
 height_rotation_14: - 3 r_14 + h_var_14 = 5
 x_grid_var_ub_14: w_var_14 + x_grid_var_14 <= 114
 y_grid_var_ub_14: h_var_14 + y_grid_var_14 <= 114
 EMIB_width_rotation_0_7: 0.2933 r_EMIB_0_7 + EMIB_w_var_0_7 = 2
 EMIB_height_rotation_0_7: - 0.2933 r_EMIB_0_7 + EMIB_h_var_0_7 = 1.7067
 EMIB_x_grid_var_ub_0_7: EMIB_w_var_0_7 + EMIB_x_grid_var_0_7 <= 114
 EMIB_y_grid_var_ub_0_7: EMIB_h_var_0_7 + EMIB_y_grid_var_0_7 <= 114
 EMIB_width_rotation_0_9: 0.2933 r_EMIB_0_9 + EMIB_w_var_0_9 = 2
 EMIB_height_rotation_0_9: - 0.2933 r_EMIB_0_9 + EMIB_h_var_0_9 = 1.7067
 EMIB_x_grid_var_ub_0_9: EMIB_w_var_0_9 + EMIB_x_grid_var_0_9 <= 114
 EMIB_y_grid_var_ub_0_9: EMIB_h_var_0_9 + EMIB_y_grid_var_0_9 <= 114
 EMIB_width_rotation_1_4: 1.1467 r_EMIB_1_4 + EMIB_w_var_1_4 = 2
 EMIB_height_rotation_1_4: - 1.1467 r_EMIB_1_4 + EMIB_h_var_1_4 = 0.8533
 EMIB_x_grid_var_ub_1_4: EMIB_w_var_1_4 + EMIB_x_grid_var_1_4 <= 114
 EMIB_y_grid_var_ub_1_4: EMIB_h_var_1_4 + EMIB_y_grid_var_1_4 <= 114
 EMIB_width_rotation_1_8: 1.1467 r_EMIB_1_8 + EMIB_w_var_1_8 = 2
 EMIB_height_rotation_1_8: - 1.1467 r_EMIB_1_8 + EMIB_h_var_1_8 = 0.8533
 EMIB_x_grid_var_ub_1_8: EMIB_w_var_1_8 + EMIB_x_grid_var_1_8 <= 114
 EMIB_y_grid_var_ub_1_8: EMIB_h_var_1_8 + EMIB_y_grid_var_1_8 <= 114
 EMIB_width_rotation_1_11: 0.2933 r_EMIB_1_11 + EMIB_w_var_1_11 = 2
 EMIB_height_rotation_1_11: - 0.2933 r_EMIB_1_11 + EMIB_h_var_1_11
   = 1.7067
 EMIB_x_grid_var_ub_1_11: EMIB_w_var_1_11 + EMIB_x_grid_var_1_11 <= 114
 EMIB_y_grid_var_ub_1_11: EMIB_h_var_1_11 + EMIB_y_grid_var_1_11 <= 114
 EMIB_width_rotation_1_13: 0.2933 r_EMIB_1_13 + EMIB_w_var_1_13 = 2
 EMIB_height_rotation_1_13: - 0.2933 r_EMIB_1_13 + EMIB_h_var_1_13
   = 1.7067
 EMIB_x_grid_var_ub_1_13: EMIB_w_var_1_13 + EMIB_x_grid_var_1_13 <= 114
 EMIB_y_grid_var_ub_1_13: EMIB_h_var_1_13 + EMIB_y_grid_var_1_13 <= 114
 EMIB_width_rotation_2_3: 1.1467 r_EMIB_2_3 + EMIB_w_var_2_3 = 2
 EMIB_height_rotation_2_3: - 1.1467 r_EMIB_2_3 + EMIB_h_var_2_3 = 0.8533
 EMIB_x_grid_var_ub_2_3: EMIB_w_var_2_3 + EMIB_x_grid_var_2_3 <= 114
 EMIB_y_grid_var_ub_2_3: EMIB_h_var_2_3 + EMIB_y_grid_var_2_3 <= 114
 EMIB_width_rotation_2_5: 1.1467 r_EMIB_2_5 + EMIB_w_var_2_5 = 2
 EMIB_height_rotation_2_5: - 1.1467 r_EMIB_2_5 + EMIB_h_var_2_5 = 0.8533
 EMIB_x_grid_var_ub_2_5: EMIB_w_var_2_5 + EMIB_x_grid_var_2_5 <= 114
 EMIB_y_grid_var_ub_2_5: EMIB_h_var_2_5 + EMIB_y_grid_var_2_5 <= 114
 EMIB_width_rotation_2_14: 1.1467 r_EMIB_2_14 + EMIB_w_var_2_14 = 2
 EMIB_height_rotation_2_14: - 1.1467 r_EMIB_2_14 + EMIB_h_var_2_14
   = 0.8533
 EMIB_x_grid_var_ub_2_14: EMIB_w_var_2_14 + EMIB_x_grid_var_2_14 <= 114
 EMIB_y_grid_var_ub_2_14: EMIB_h_var_2_14 + EMIB_y_grid_var_2_14 <= 114
 EMIB_width_rotation_3_11: 1.1467 r_EMIB_3_11 + EMIB_w_var_3_11 = 2
 EMIB_height_rotation_3_11: - 1.1467 r_EMIB_3_11 + EMIB_h_var_3_11
   = 0.8533
 EMIB_x_grid_var_ub_3_11: EMIB_w_var_3_11 + EMIB_x_grid_var_3_11 <= 114
 EMIB_y_grid_var_ub_3_11: EMIB_h_var_3_11 + EMIB_y_grid_var_3_11 <= 114
 EMIB_width_rotation_5_7: 1.1467 r_EMIB_5_7 + EMIB_w_var_5_7 = 2
 EMIB_height_rotation_5_7: - 1.1467 r_EMIB_5_7 + EMIB_h_var_5_7 = 0.8533
 EMIB_x_grid_var_ub_5_7: EMIB_w_var_5_7 + EMIB_x_grid_var_5_7 <= 114
 EMIB_y_grid_var_ub_5_7: EMIB_h_var_5_7 + EMIB_y_grid_var_5_7 <= 114
 EMIB_width_rotation_5_9: 1.1467 r_EMIB_5_9 + EMIB_w_var_5_9 = 2
 EMIB_height_rotation_5_9: - 1.1467 r_EMIB_5_9 + EMIB_h_var_5_9 = 0.8533
 EMIB_x_grid_var_ub_5_9: EMIB_w_var_5_9 + EMIB_x_grid_var_5_9 <= 114
 EMIB_y_grid_var_ub_5_9: EMIB_h_var_5_9 + EMIB_y_grid_var_5_9 <= 114
 EMIB_width_rotation_5_11: 0.2933 r_EMIB_5_11 + EMIB_w_var_5_11 = 2
 EMIB_height_rotation_5_11: - 0.2933 r_EMIB_5_11 + EMIB_h_var_5_11
   = 1.7067
 EMIB_x_grid_var_ub_5_11: EMIB_w_var_5_11 + EMIB_x_grid_var_5_11 <= 114
 EMIB_y_grid_var_ub_5_11: EMIB_h_var_5_11 + EMIB_y_grid_var_5_11 <= 114
 EMIB_width_rotation_5_12: 0.2933 r_EMIB_5_12 + EMIB_w_var_5_12 = 2
 EMIB_height_rotation_5_12: - 0.2933 r_EMIB_5_12 + EMIB_h_var_5_12
   = 1.7067
 EMIB_x_grid_var_ub_5_12: EMIB_w_var_5_12 + EMIB_x_grid_var_5_12 <= 114
 EMIB_y_grid_var_ub_5_12: EMIB_h_var_5_12 + EMIB_y_grid_var_5_12 <= 114
 EMIB_width_rotation_5_14: 1.1467 r_EMIB_5_14 + EMIB_w_var_5_14 = 2
 EMIB_height_rotation_5_14: - 1.1467 r_EMIB_5_14 + EMIB_h_var_5_14
   = 0.8533
 EMIB_x_grid_var_ub_5_14: EMIB_w_var_5_14 + EMIB_x_grid_var_5_14 <= 114
 EMIB_y_grid_var_ub_5_14: EMIB_h_var_5_14 + EMIB_y_grid_var_5_14 <= 114
 EMIB_width_rotation_6_12: 1.1467 r_EMIB_6_12 + EMIB_w_var_6_12 = 2
 EMIB_height_rotation_6_12: - 1.1467 r_EMIB_6_12 + EMIB_h_var_6_12
   = 0.8533
 EMIB_x_grid_var_ub_6_12: EMIB_w_var_6_12 + EMIB_x_grid_var_6_12 <= 114
 EMIB_y_grid_var_ub_6_12: EMIB_h_var_6_12 + EMIB_y_grid_var_6_12 <= 114
 EMIB_width_rotation_7_13: 1.1467 r_EMIB_7_13 + EMIB_w_var_7_13 = 2
 EMIB_height_rotation_7_13: - 1.1467 r_EMIB_7_13 + EMIB_h_var_7_13
   = 0.8533
 EMIB_x_grid_var_ub_7_13: EMIB_w_var_7_13 + EMIB_x_grid_var_7_13 <= 114
 EMIB_y_grid_var_ub_7_13: EMIB_h_var_7_13 + EMIB_y_grid_var_7_13 <= 114
 EMIB_width_rotation_7_14: 1.1467 r_EMIB_7_14 + EMIB_w_var_7_14 = 2
 EMIB_height_rotation_7_14: - 1.1467 r_EMIB_7_14 + EMIB_h_var_7_14
   = 0.8533
 EMIB_x_grid_var_ub_7_14: EMIB_w_var_7_14 + EMIB_x_grid_var_7_14 <= 114
 EMIB_y_grid_var_ub_7_14: EMIB_h_var_7_14 + EMIB_y_grid_var_7_14 <= 114
 EMIB_width_rotation_9_14: 1.1467 r_EMIB_9_14 + EMIB_w_var_9_14 = 2
 EMIB_height_rotation_9_14: - 1.1467 r_EMIB_9_14 + EMIB_h_var_9_14
   = 0.8533
 EMIB_x_grid_var_ub_9_14: EMIB_w_var_9_14 + EMIB_x_grid_var_9_14 <= 114
 EMIB_y_grid_var_ub_9_14: EMIB_h_var_9_14 + EMIB_y_grid_var_9_14 <= 114
 EMIB_width_rotation_10_12: 1.1467 r_EMIB_10_12 + EMIB_w_var_10_12 = 2
 EMIB_height_rotation_10_12: - 1.1467 r_EMIB_10_12 + EMIB_h_var_10_12
   = 0.8533
 EMIB_x_grid_var_ub_10_12: EMIB_w_var_10_12 + EMIB_x_grid_var_10_12 <= 114
 EMIB_y_grid_var_ub_10_12: EMIB_h_var_10_12 + EMIB_y_grid_var_10_12 <= 114
 EMIB_width_rotation_11_12: 0.2933 r_EMIB_11_12 + EMIB_w_var_11_12 = 2
 EMIB_height_rotation_11_12: - 0.2933 r_EMIB_11_12 + EMIB_h_var_11_12
   = 1.7067
 EMIB_x_grid_var_ub_11_12: EMIB_w_var_11_12 + EMIB_x_grid_var_11_12 <= 114
 EMIB_y_grid_var_ub_11_12: EMIB_h_var_11_12 + EMIB_y_grid_var_11_12 <= 114
 EMIB_width_rotation_12_13: 1.1467 r_EMIB_12_13 + EMIB_w_var_12_13 = 2
 EMIB_height_rotation_12_13: - 1.1467 r_EMIB_12_13 + EMIB_h_var_12_13
   = 0.8533
 EMIB_x_grid_var_ub_12_13: EMIB_w_var_12_13 + EMIB_x_grid_var_12_13 <= 114
 EMIB_y_grid_var_ub_12_13: EMIB_h_var_12_13 + EMIB_y_grid_var_12_13 <= 114
 EMIB_width_rotation_13_14: 1.1467 r_EMIB_13_14 + EMIB_w_var_13_14 = 2
 EMIB_height_rotation_13_14: - 1.1467 r_EMIB_13_14 + EMIB_h_var_13_14
   = 0.8533
 EMIB_x_grid_var_ub_13_14: EMIB_w_var_13_14 + EMIB_x_grid_var_13_14 <= 114
 EMIB_y_grid_var_ub_13_14: EMIB_h_var_13_14 + EMIB_y_grid_var_13_14 <= 114
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
 cx_def_10: - 0.5 w_var_10 - x_grid_var_10 + cx_grid_var_10 = 0
 cy_def_10: - 0.5 h_var_10 - y_grid_var_10 + cy_grid_var_10 = 0
 cx_def_11: - 0.5 w_var_11 - x_grid_var_11 + cx_grid_var_11 = 0
 cy_def_11: - 0.5 h_var_11 - y_grid_var_11 + cy_grid_var_11 = 0
 cx_def_12: - 0.5 w_var_12 - x_grid_var_12 + cx_grid_var_12 = 0
 cy_def_12: - 0.5 h_var_12 - y_grid_var_12 + cy_grid_var_12 = 0
 cx_def_13: - 0.5 w_var_13 - x_grid_var_13 + cx_grid_var_13 = 0
 cy_def_13: - 0.5 h_var_13 - y_grid_var_13 + cy_grid_var_13 = 0
 cx_def_14: - 0.5 w_var_14 - x_grid_var_14 + cx_grid_var_14 = 0
 cy_def_14: - 0.5 h_var_14 - y_grid_var_14 + cy_grid_var_14 = 0
 EMIB_cx_def_0_7: - 0.5 EMIB_w_var_0_7 - EMIB_x_grid_var_0_7
   + EMIB_cx_grid_var_0_7 = 0
 EMIB_cy_def_0_7: - 0.5 EMIB_h_var_0_7 - EMIB_y_grid_var_0_7
   + EMIB_cy_grid_var_0_7 = 0
 EMIB_cx_def_0_9: - 0.5 EMIB_w_var_0_9 - EMIB_x_grid_var_0_9
   + EMIB_cx_grid_var_0_9 = 0
 EMIB_cy_def_0_9: - 0.5 EMIB_h_var_0_9 - EMIB_y_grid_var_0_9
   + EMIB_cy_grid_var_0_9 = 0
 EMIB_cx_def_1_4: - 0.5 EMIB_w_var_1_4 - EMIB_x_grid_var_1_4
   + EMIB_cx_grid_var_1_4 = 0
 EMIB_cy_def_1_4: - 0.5 EMIB_h_var_1_4 - EMIB_y_grid_var_1_4
   + EMIB_cy_grid_var_1_4 = 0
 EMIB_cx_def_1_8: - 0.5 EMIB_w_var_1_8 - EMIB_x_grid_var_1_8
   + EMIB_cx_grid_var_1_8 = 0
 EMIB_cy_def_1_8: - 0.5 EMIB_h_var_1_8 - EMIB_y_grid_var_1_8
   + EMIB_cy_grid_var_1_8 = 0
 EMIB_cx_def_1_11: - 0.5 EMIB_w_var_1_11 - EMIB_x_grid_var_1_11
   + EMIB_cx_grid_var_1_11 = 0
 EMIB_cy_def_1_11: - 0.5 EMIB_h_var_1_11 - EMIB_y_grid_var_1_11
   + EMIB_cy_grid_var_1_11 = 0
 EMIB_cx_def_1_13: - 0.5 EMIB_w_var_1_13 - EMIB_x_grid_var_1_13
   + EMIB_cx_grid_var_1_13 = 0
 EMIB_cy_def_1_13: - 0.5 EMIB_h_var_1_13 - EMIB_y_grid_var_1_13
   + EMIB_cy_grid_var_1_13 = 0
 EMIB_cx_def_2_3: - 0.5 EMIB_w_var_2_3 - EMIB_x_grid_var_2_3
   + EMIB_cx_grid_var_2_3 = 0
 EMIB_cy_def_2_3: - 0.5 EMIB_h_var_2_3 - EMIB_y_grid_var_2_3
   + EMIB_cy_grid_var_2_3 = 0
 EMIB_cx_def_2_5: - 0.5 EMIB_w_var_2_5 - EMIB_x_grid_var_2_5
   + EMIB_cx_grid_var_2_5 = 0
 EMIB_cy_def_2_5: - 0.5 EMIB_h_var_2_5 - EMIB_y_grid_var_2_5
   + EMIB_cy_grid_var_2_5 = 0
 EMIB_cx_def_2_14: - 0.5 EMIB_w_var_2_14 - EMIB_x_grid_var_2_14
   + EMIB_cx_grid_var_2_14 = 0
 EMIB_cy_def_2_14: - 0.5 EMIB_h_var_2_14 - EMIB_y_grid_var_2_14
   + EMIB_cy_grid_var_2_14 = 0
 EMIB_cx_def_3_11: - 0.5 EMIB_w_var_3_11 - EMIB_x_grid_var_3_11
   + EMIB_cx_grid_var_3_11 = 0
 EMIB_cy_def_3_11: - 0.5 EMIB_h_var_3_11 - EMIB_y_grid_var_3_11
   + EMIB_cy_grid_var_3_11 = 0
 EMIB_cx_def_5_7: - 0.5 EMIB_w_var_5_7 - EMIB_x_grid_var_5_7
   + EMIB_cx_grid_var_5_7 = 0
 EMIB_cy_def_5_7: - 0.5 EMIB_h_var_5_7 - EMIB_y_grid_var_5_7
   + EMIB_cy_grid_var_5_7 = 0
 EMIB_cx_def_5_9: - 0.5 EMIB_w_var_5_9 - EMIB_x_grid_var_5_9
   + EMIB_cx_grid_var_5_9 = 0
 EMIB_cy_def_5_9: - 0.5 EMIB_h_var_5_9 - EMIB_y_grid_var_5_9
   + EMIB_cy_grid_var_5_9 = 0
 EMIB_cx_def_5_11: - 0.5 EMIB_w_var_5_11 - EMIB_x_grid_var_5_11
   + EMIB_cx_grid_var_5_11 = 0
 EMIB_cy_def_5_11: - 0.5 EMIB_h_var_5_11 - EMIB_y_grid_var_5_11
   + EMIB_cy_grid_var_5_11 = 0
 EMIB_cx_def_5_12: - 0.5 EMIB_w_var_5_12 - EMIB_x_grid_var_5_12
   + EMIB_cx_grid_var_5_12 = 0
 EMIB_cy_def_5_12: - 0.5 EMIB_h_var_5_12 - EMIB_y_grid_var_5_12
   + EMIB_cy_grid_var_5_12 = 0
 EMIB_cx_def_5_14: - 0.5 EMIB_w_var_5_14 - EMIB_x_grid_var_5_14
   + EMIB_cx_grid_var_5_14 = 0
 EMIB_cy_def_5_14: - 0.5 EMIB_h_var_5_14 - EMIB_y_grid_var_5_14
   + EMIB_cy_grid_var_5_14 = 0
 EMIB_cx_def_6_12: - 0.5 EMIB_w_var_6_12 - EMIB_x_grid_var_6_12
   + EMIB_cx_grid_var_6_12 = 0
 EMIB_cy_def_6_12: - 0.5 EMIB_h_var_6_12 - EMIB_y_grid_var_6_12
   + EMIB_cy_grid_var_6_12 = 0
 EMIB_cx_def_7_13: - 0.5 EMIB_w_var_7_13 - EMIB_x_grid_var_7_13
   + EMIB_cx_grid_var_7_13 = 0
 EMIB_cy_def_7_13: - 0.5 EMIB_h_var_7_13 - EMIB_y_grid_var_7_13
   + EMIB_cy_grid_var_7_13 = 0
 EMIB_cx_def_7_14: - 0.5 EMIB_w_var_7_14 - EMIB_x_grid_var_7_14
   + EMIB_cx_grid_var_7_14 = 0
 EMIB_cy_def_7_14: - 0.5 EMIB_h_var_7_14 - EMIB_y_grid_var_7_14
   + EMIB_cy_grid_var_7_14 = 0
 EMIB_cx_def_9_14: - 0.5 EMIB_w_var_9_14 - EMIB_x_grid_var_9_14
   + EMIB_cx_grid_var_9_14 = 0
 EMIB_cy_def_9_14: - 0.5 EMIB_h_var_9_14 - EMIB_y_grid_var_9_14
   + EMIB_cy_grid_var_9_14 = 0
 EMIB_cx_def_10_12: - 0.5 EMIB_w_var_10_12 - EMIB_x_grid_var_10_12
   + EMIB_cx_grid_var_10_12 = 0
 EMIB_cy_def_10_12: - 0.5 EMIB_h_var_10_12 - EMIB_y_grid_var_10_12
   + EMIB_cy_grid_var_10_12 = 0
 EMIB_cx_def_11_12: - 0.5 EMIB_w_var_11_12 - EMIB_x_grid_var_11_12
   + EMIB_cx_grid_var_11_12 = 0
 EMIB_cy_def_11_12: - 0.5 EMIB_h_var_11_12 - EMIB_y_grid_var_11_12
   + EMIB_cy_grid_var_11_12 = 0
 EMIB_cx_def_12_13: - 0.5 EMIB_w_var_12_13 - EMIB_x_grid_var_12_13
   + EMIB_cx_grid_var_12_13 = 0
 EMIB_cy_def_12_13: - 0.5 EMIB_h_var_12_13 - EMIB_y_grid_var_12_13
   + EMIB_cy_grid_var_12_13 = 0
 EMIB_cx_def_13_14: - 0.5 EMIB_w_var_13_14 - EMIB_x_grid_var_13_14
   + EMIB_cx_grid_var_13_14 = 0
 EMIB_cy_def_13_14: - 0.5 EMIB_h_var_13_14 - EMIB_y_grid_var_13_14
   + EMIB_cy_grid_var_13_14 = 0
 must_adjacent_sb_0_7: z1_0_7 + z2_0_7 = 1
 horizontal_direction_sb_0_7: - z1_0_7 + z1L_0_7 + z1R_0_7 = 0
 vertical_direction_sb_0_7: - z2_0_7 + z2D_0_7 + z2U_0_7 = 0
 EMIB_rotate_eq_z2_0_7: r_EMIB_0_7 - z2_0_7 = 0
 horizontal_left_dist_lb_0_7: - w_var_0 - x_grid_var_0 + x_grid_var_7
   - 228 z1L_0_7 >= -228
 EMIB_left_overlap_0_7: w_var_0 + x_grid_var_0 - EMIB_x_grid_var_0_7
   - 228 z1L_0_7 >= -227.001
 EMIB_right_overlap_0_7: EMIB_w_var_0_7 - x_grid_var_7
   + EMIB_x_grid_var_0_7 - 228 z1L_0_7 >= -227.001
 horizontal_right_dist_lb_0_7: - w_var_7 + x_grid_var_0 - x_grid_var_7
   - 228 z1R_0_7 >= -228
 EMIB_left_overlap_right_0_7: w_var_7 + x_grid_var_7 - EMIB_x_grid_var_0_7
   - 228 z1R_0_7 >= -227.001
 EMIB_right_overlap_right_0_7: EMIB_w_var_0_7 - x_grid_var_0
   + EMIB_x_grid_var_0_7 - 228 z1R_0_7 >= -227.001
 vertical_down_dist_lb_0_7: - h_var_0 - y_grid_var_0 + y_grid_var_7
   - 228 z2D_0_7 >= -228
 EMIB_bottom_overlap_down_0_7: h_var_0 + y_grid_var_0 - EMIB_y_grid_var_0_7
   - 228 z2D_0_7 >= -227.001
 EMIB_top_overlap_down_0_7: EMIB_h_var_0_7 - y_grid_var_7
   + EMIB_y_grid_var_0_7 - 228 z2D_0_7 >= -227.001
 vertical_up_dist_lb_0_7: - h_var_7 + y_grid_var_0 - y_grid_var_7
   - 228 z2U_0_7 >= -228
 EMIB_bottom_overlap_up_0_7: h_var_7 + y_grid_var_7 - EMIB_y_grid_var_0_7
   - 228 z2U_0_7 >= -227.001
 EMIB_top_overlap_up_0_7: EMIB_h_var_0_7 - y_grid_var_0
   + EMIB_y_grid_var_0_7 - 228 z2U_0_7 >= -227.001
 shared_yi_ub1_0_7: h_var_0 - EMIB_h_var_0_7 + y_grid_var_0
   - EMIB_y_grid_var_0_7 - 228 z1_0_7 >= -228
 shared_yi_ub2_0_7: y_grid_var_0 - EMIB_y_grid_var_0_7 + 228 z1_0_7 <= 228
 shared_yj_ub1_0_7: h_var_7 - EMIB_h_var_0_7 + y_grid_var_7
   - EMIB_y_grid_var_0_7 - 228 z1_0_7 >= -228
 shared_yj_ub2_0_7: y_grid_var_7 - EMIB_y_grid_var_0_7 + 228 z1_0_7 <= 228
 shared_xi_ub1_0_7: w_var_0 - EMIB_w_var_0_7 + x_grid_var_0
   - EMIB_x_grid_var_0_7 - 228 z2_0_7 >= -228
 shared_xi_ub2_0_7: x_grid_var_0 - EMIB_x_grid_var_0_7 + 228 z2_0_7 <= 228
 shared_xj_ub1_0_7: w_var_7 - EMIB_w_var_0_7 + x_grid_var_7
   - EMIB_x_grid_var_0_7 - 228 z2_0_7 >= -228
 shared_xj_ub2_0_7: x_grid_var_7 - EMIB_x_grid_var_0_7 + 228 z2_0_7 <= 228
 must_adjacent_sb_0_9: z1_0_9 + z2_0_9 = 1
 horizontal_direction_sb_0_9: - z1_0_9 + z1L_0_9 + z1R_0_9 = 0
 vertical_direction_sb_0_9: - z2_0_9 + z2D_0_9 + z2U_0_9 = 0
 EMIB_rotate_eq_z2_0_9: r_EMIB_0_9 - z2_0_9 = 0
 horizontal_left_dist_lb_0_9: - w_var_0 - x_grid_var_0 + x_grid_var_9
   - 228 z1L_0_9 >= -228
 EMIB_left_overlap_0_9: w_var_0 + x_grid_var_0 - EMIB_x_grid_var_0_9
   - 228 z1L_0_9 >= -227.001
 EMIB_right_overlap_0_9: EMIB_w_var_0_9 - x_grid_var_9
   + EMIB_x_grid_var_0_9 - 228 z1L_0_9 >= -227.001
 horizontal_right_dist_lb_0_9: - w_var_9 + x_grid_var_0 - x_grid_var_9
   - 228 z1R_0_9 >= -228
 EMIB_left_overlap_right_0_9: w_var_9 + x_grid_var_9 - EMIB_x_grid_var_0_9
   - 228 z1R_0_9 >= -227.001
 EMIB_right_overlap_right_0_9: EMIB_w_var_0_9 - x_grid_var_0
   + EMIB_x_grid_var_0_9 - 228 z1R_0_9 >= -227.001
 vertical_down_dist_lb_0_9: - h_var_0 - y_grid_var_0 + y_grid_var_9
   - 228 z2D_0_9 >= -228
 EMIB_bottom_overlap_down_0_9: h_var_0 + y_grid_var_0 - EMIB_y_grid_var_0_9
   - 228 z2D_0_9 >= -227.001
 EMIB_top_overlap_down_0_9: EMIB_h_var_0_9 - y_grid_var_9
   + EMIB_y_grid_var_0_9 - 228 z2D_0_9 >= -227.001
 vertical_up_dist_lb_0_9: - h_var_9 + y_grid_var_0 - y_grid_var_9
   - 228 z2U_0_9 >= -228
 EMIB_bottom_overlap_up_0_9: h_var_9 + y_grid_var_9 - EMIB_y_grid_var_0_9
   - 228 z2U_0_9 >= -227.001
 EMIB_top_overlap_up_0_9: EMIB_h_var_0_9 - y_grid_var_0
   + EMIB_y_grid_var_0_9 - 228 z2U_0_9 >= -227.001
 shared_yi_ub1_0_9: h_var_0 - EMIB_h_var_0_9 + y_grid_var_0
   - EMIB_y_grid_var_0_9 - 228 z1_0_9 >= -228
 shared_yi_ub2_0_9: y_grid_var_0 - EMIB_y_grid_var_0_9 + 228 z1_0_9 <= 228
 shared_yj_ub1_0_9: h_var_9 - EMIB_h_var_0_9 + y_grid_var_9
   - EMIB_y_grid_var_0_9 - 228 z1_0_9 >= -228
 shared_yj_ub2_0_9: y_grid_var_9 - EMIB_y_grid_var_0_9 + 228 z1_0_9 <= 228
 shared_xi_ub1_0_9: w_var_0 - EMIB_w_var_0_9 + x_grid_var_0
   - EMIB_x_grid_var_0_9 - 228 z2_0_9 >= -228
 shared_xi_ub2_0_9: x_grid_var_0 - EMIB_x_grid_var_0_9 + 228 z2_0_9 <= 228
 shared_xj_ub1_0_9: w_var_9 - EMIB_w_var_0_9 + x_grid_var_9
   - EMIB_x_grid_var_0_9 - 228 z2_0_9 >= -228
 shared_xj_ub2_0_9: x_grid_var_9 - EMIB_x_grid_var_0_9 + 228 z2_0_9 <= 228
 must_adjacent_sb_1_4: z1_1_4 + z2_1_4 = 1
 horizontal_direction_sb_1_4: - z1_1_4 + z1L_1_4 + z1R_1_4 = 0
 vertical_direction_sb_1_4: - z2_1_4 + z2D_1_4 + z2U_1_4 = 0
 EMIB_rotate_eq_z2_1_4: r_EMIB_1_4 - z2_1_4 = 0
 horizontal_left_dist_lb_1_4: - w_var_1 - x_grid_var_1 + x_grid_var_4
   - 228 z1L_1_4 >= -228
 EMIB_left_overlap_1_4: w_var_1 + x_grid_var_1 - EMIB_x_grid_var_1_4
   - 228 z1L_1_4 >= -227.001
 EMIB_right_overlap_1_4: EMIB_w_var_1_4 - x_grid_var_4
   + EMIB_x_grid_var_1_4 - 228 z1L_1_4 >= -227.001
 horizontal_right_dist_lb_1_4: - w_var_4 + x_grid_var_1 - x_grid_var_4
   - 228 z1R_1_4 >= -228
 EMIB_left_overlap_right_1_4: w_var_4 + x_grid_var_4 - EMIB_x_grid_var_1_4
   - 228 z1R_1_4 >= -227.001
 EMIB_right_overlap_right_1_4: EMIB_w_var_1_4 - x_grid_var_1
   + EMIB_x_grid_var_1_4 - 228 z1R_1_4 >= -227.001
 vertical_down_dist_lb_1_4: - h_var_1 - y_grid_var_1 + y_grid_var_4
   - 228 z2D_1_4 >= -228
 EMIB_bottom_overlap_down_1_4: h_var_1 + y_grid_var_1 - EMIB_y_grid_var_1_4
   - 228 z2D_1_4 >= -227.001
 EMIB_top_overlap_down_1_4: EMIB_h_var_1_4 - y_grid_var_4
   + EMIB_y_grid_var_1_4 - 228 z2D_1_4 >= -227.001
 vertical_up_dist_lb_1_4: - h_var_4 + y_grid_var_1 - y_grid_var_4
   - 228 z2U_1_4 >= -228
 EMIB_bottom_overlap_up_1_4: h_var_4 + y_grid_var_4 - EMIB_y_grid_var_1_4
   - 228 z2U_1_4 >= -227.001
 EMIB_top_overlap_up_1_4: EMIB_h_var_1_4 - y_grid_var_1
   + EMIB_y_grid_var_1_4 - 228 z2U_1_4 >= -227.001
 shared_yi_ub1_1_4: h_var_1 - EMIB_h_var_1_4 + y_grid_var_1
   - EMIB_y_grid_var_1_4 - 228 z1_1_4 >= -228
 shared_yi_ub2_1_4: y_grid_var_1 - EMIB_y_grid_var_1_4 + 228 z1_1_4 <= 228
 shared_yj_ub1_1_4: h_var_4 - EMIB_h_var_1_4 + y_grid_var_4
   - EMIB_y_grid_var_1_4 - 228 z1_1_4 >= -228
 shared_yj_ub2_1_4: y_grid_var_4 - EMIB_y_grid_var_1_4 + 228 z1_1_4 <= 228
 shared_xi_ub1_1_4: w_var_1 - EMIB_w_var_1_4 + x_grid_var_1
   - EMIB_x_grid_var_1_4 - 228 z2_1_4 >= -228
 shared_xi_ub2_1_4: x_grid_var_1 - EMIB_x_grid_var_1_4 + 228 z2_1_4 <= 228
 shared_xj_ub1_1_4: w_var_4 - EMIB_w_var_1_4 + x_grid_var_4
   - EMIB_x_grid_var_1_4 - 228 z2_1_4 >= -228
 shared_xj_ub2_1_4: x_grid_var_4 - EMIB_x_grid_var_1_4 + 228 z2_1_4 <= 228
 must_adjacent_sb_1_8: z1_1_8 + z2_1_8 = 1
 horizontal_direction_sb_1_8: - z1_1_8 + z1L_1_8 + z1R_1_8 = 0
 vertical_direction_sb_1_8: - z2_1_8 + z2D_1_8 + z2U_1_8 = 0
 EMIB_rotate_eq_z2_1_8: r_EMIB_1_8 - z2_1_8 = 0
 horizontal_left_dist_lb_1_8: - w_var_1 - x_grid_var_1 + x_grid_var_8
   - 228 z1L_1_8 >= -228
 EMIB_left_overlap_1_8: w_var_1 + x_grid_var_1 - EMIB_x_grid_var_1_8
   - 228 z1L_1_8 >= -227.001
 EMIB_right_overlap_1_8: EMIB_w_var_1_8 - x_grid_var_8
   + EMIB_x_grid_var_1_8 - 228 z1L_1_8 >= -227.001
 horizontal_right_dist_lb_1_8: - w_var_8 + x_grid_var_1 - x_grid_var_8
   - 228 z1R_1_8 >= -228
 EMIB_left_overlap_right_1_8: w_var_8 + x_grid_var_8 - EMIB_x_grid_var_1_8
   - 228 z1R_1_8 >= -227.001
 EMIB_right_overlap_right_1_8: EMIB_w_var_1_8 - x_grid_var_1
   + EMIB_x_grid_var_1_8 - 228 z1R_1_8 >= -227.001
 vertical_down_dist_lb_1_8: - h_var_1 - y_grid_var_1 + y_grid_var_8
   - 228 z2D_1_8 >= -228
 EMIB_bottom_overlap_down_1_8: h_var_1 + y_grid_var_1 - EMIB_y_grid_var_1_8
   - 228 z2D_1_8 >= -227.001
 EMIB_top_overlap_down_1_8: EMIB_h_var_1_8 - y_grid_var_8
   + EMIB_y_grid_var_1_8 - 228 z2D_1_8 >= -227.001
 vertical_up_dist_lb_1_8: - h_var_8 + y_grid_var_1 - y_grid_var_8
   - 228 z2U_1_8 >= -228
 EMIB_bottom_overlap_up_1_8: h_var_8 + y_grid_var_8 - EMIB_y_grid_var_1_8
   - 228 z2U_1_8 >= -227.001
 EMIB_top_overlap_up_1_8: EMIB_h_var_1_8 - y_grid_var_1
   + EMIB_y_grid_var_1_8 - 228 z2U_1_8 >= -227.001
 shared_yi_ub1_1_8: h_var_1 - EMIB_h_var_1_8 + y_grid_var_1
   - EMIB_y_grid_var_1_8 - 228 z1_1_8 >= -228
 shared_yi_ub2_1_8: y_grid_var_1 - EMIB_y_grid_var_1_8 + 228 z1_1_8 <= 228
 shared_yj_ub1_1_8: h_var_8 - EMIB_h_var_1_8 + y_grid_var_8
   - EMIB_y_grid_var_1_8 - 228 z1_1_8 >= -228
 shared_yj_ub2_1_8: y_grid_var_8 - EMIB_y_grid_var_1_8 + 228 z1_1_8 <= 228
 shared_xi_ub1_1_8: w_var_1 - EMIB_w_var_1_8 + x_grid_var_1
   - EMIB_x_grid_var_1_8 - 228 z2_1_8 >= -228
 shared_xi_ub2_1_8: x_grid_var_1 - EMIB_x_grid_var_1_8 + 228 z2_1_8 <= 228
 shared_xj_ub1_1_8: w_var_8 - EMIB_w_var_1_8 + x_grid_var_8
   - EMIB_x_grid_var_1_8 - 228 z2_1_8 >= -228
 shared_xj_ub2_1_8: x_grid_var_8 - EMIB_x_grid_var_1_8 + 228 z2_1_8 <= 228
 must_adjacent_sb_1_11: z1_1_11 + z2_1_11 = 1
 horizontal_direction_sb_1_11: - z1_1_11 + z1L_1_11 + z1R_1_11 = 0
 vertical_direction_sb_1_11: - z2_1_11 + z2D_1_11 + z2U_1_11 = 0
 EMIB_rotate_eq_z2_1_11: r_EMIB_1_11 - z2_1_11 = 0
 horizontal_left_dist_lb_1_11: - w_var_1 - x_grid_var_1 + x_grid_var_11
   - 228 z1L_1_11 >= -228
 EMIB_left_overlap_1_11: w_var_1 + x_grid_var_1 - EMIB_x_grid_var_1_11
   - 228 z1L_1_11 >= -227.001
 EMIB_right_overlap_1_11: EMIB_w_var_1_11 - x_grid_var_11
   + EMIB_x_grid_var_1_11 - 228 z1L_1_11 >= -227.001
 horizontal_right_dist_lb_1_11: - w_var_11 + x_grid_var_1 - x_grid_var_11
   - 228 z1R_1_11 >= -228
 EMIB_left_overlap_right_1_11: w_var_11 + x_grid_var_11
   - EMIB_x_grid_var_1_11 - 228 z1R_1_11 >= -227.001
 EMIB_right_overlap_right_1_11: EMIB_w_var_1_11 - x_grid_var_1
   + EMIB_x_grid_var_1_11 - 228 z1R_1_11 >= -227.001
 vertical_down_dist_lb_1_11: - h_var_1 - y_grid_var_1 + y_grid_var_11
   - 228 z2D_1_11 >= -228
 EMIB_bottom_overlap_down_1_11: h_var_1 + y_grid_var_1
   - EMIB_y_grid_var_1_11 - 228 z2D_1_11 >= -227.001
 EMIB_top_overlap_down_1_11: EMIB_h_var_1_11 - y_grid_var_11
   + EMIB_y_grid_var_1_11 - 228 z2D_1_11 >= -227.001
 vertical_up_dist_lb_1_11: - h_var_11 + y_grid_var_1 - y_grid_var_11
   - 228 z2U_1_11 >= -228
 EMIB_bottom_overlap_up_1_11: h_var_11 + y_grid_var_11
   - EMIB_y_grid_var_1_11 - 228 z2U_1_11 >= -227.001
 EMIB_top_overlap_up_1_11: EMIB_h_var_1_11 - y_grid_var_1
   + EMIB_y_grid_var_1_11 - 228 z2U_1_11 >= -227.001
 shared_yi_ub1_1_11: h_var_1 - EMIB_h_var_1_11 + y_grid_var_1
   - EMIB_y_grid_var_1_11 - 228 z1_1_11 >= -228
 shared_yi_ub2_1_11: y_grid_var_1 - EMIB_y_grid_var_1_11 + 228 z1_1_11
   <= 228
 shared_yj_ub1_1_11: h_var_11 - EMIB_h_var_1_11 + y_grid_var_11
   - EMIB_y_grid_var_1_11 - 228 z1_1_11 >= -228
 shared_yj_ub2_1_11: y_grid_var_11 - EMIB_y_grid_var_1_11 + 228 z1_1_11
   <= 228
 shared_xi_ub1_1_11: w_var_1 - EMIB_w_var_1_11 + x_grid_var_1
   - EMIB_x_grid_var_1_11 - 228 z2_1_11 >= -228
 shared_xi_ub2_1_11: x_grid_var_1 - EMIB_x_grid_var_1_11 + 228 z2_1_11
   <= 228
 shared_xj_ub1_1_11: w_var_11 - EMIB_w_var_1_11 + x_grid_var_11
   - EMIB_x_grid_var_1_11 - 228 z2_1_11 >= -228
 shared_xj_ub2_1_11: x_grid_var_11 - EMIB_x_grid_var_1_11 + 228 z2_1_11
   <= 228
 must_adjacent_sb_1_13: z1_1_13 + z2_1_13 = 1
 horizontal_direction_sb_1_13: - z1_1_13 + z1L_1_13 + z1R_1_13 = 0
 vertical_direction_sb_1_13: - z2_1_13 + z2D_1_13 + z2U_1_13 = 0
 EMIB_rotate_eq_z2_1_13: r_EMIB_1_13 - z2_1_13 = 0
 horizontal_left_dist_lb_1_13: - w_var_1 - x_grid_var_1 + x_grid_var_13
   - 228 z1L_1_13 >= -228
 EMIB_left_overlap_1_13: w_var_1 + x_grid_var_1 - EMIB_x_grid_var_1_13
   - 228 z1L_1_13 >= -227.001
 EMIB_right_overlap_1_13: EMIB_w_var_1_13 - x_grid_var_13
   + EMIB_x_grid_var_1_13 - 228 z1L_1_13 >= -227.001
 horizontal_right_dist_lb_1_13: - w_var_13 + x_grid_var_1 - x_grid_var_13
   - 228 z1R_1_13 >= -228
 EMIB_left_overlap_right_1_13: w_var_13 + x_grid_var_13
   - EMIB_x_grid_var_1_13 - 228 z1R_1_13 >= -227.001
 EMIB_right_overlap_right_1_13: EMIB_w_var_1_13 - x_grid_var_1
   + EMIB_x_grid_var_1_13 - 228 z1R_1_13 >= -227.001
 vertical_down_dist_lb_1_13: - h_var_1 - y_grid_var_1 + y_grid_var_13
   - 228 z2D_1_13 >= -228
 EMIB_bottom_overlap_down_1_13: h_var_1 + y_grid_var_1
   - EMIB_y_grid_var_1_13 - 228 z2D_1_13 >= -227.001
 EMIB_top_overlap_down_1_13: EMIB_h_var_1_13 - y_grid_var_13
   + EMIB_y_grid_var_1_13 - 228 z2D_1_13 >= -227.001
 vertical_up_dist_lb_1_13: - h_var_13 + y_grid_var_1 - y_grid_var_13
   - 228 z2U_1_13 >= -228
 EMIB_bottom_overlap_up_1_13: h_var_13 + y_grid_var_13
   - EMIB_y_grid_var_1_13 - 228 z2U_1_13 >= -227.001
 EMIB_top_overlap_up_1_13: EMIB_h_var_1_13 - y_grid_var_1
   + EMIB_y_grid_var_1_13 - 228 z2U_1_13 >= -227.001
 shared_yi_ub1_1_13: h_var_1 - EMIB_h_var_1_13 + y_grid_var_1
   - EMIB_y_grid_var_1_13 - 228 z1_1_13 >= -228
 shared_yi_ub2_1_13: y_grid_var_1 - EMIB_y_grid_var_1_13 + 228 z1_1_13
   <= 228
 shared_yj_ub1_1_13: h_var_13 - EMIB_h_var_1_13 + y_grid_var_13
   - EMIB_y_grid_var_1_13 - 228 z1_1_13 >= -228
 shared_yj_ub2_1_13: y_grid_var_13 - EMIB_y_grid_var_1_13 + 228 z1_1_13
   <= 228
 shared_xi_ub1_1_13: w_var_1 - EMIB_w_var_1_13 + x_grid_var_1
   - EMIB_x_grid_var_1_13 - 228 z2_1_13 >= -228
 shared_xi_ub2_1_13: x_grid_var_1 - EMIB_x_grid_var_1_13 + 228 z2_1_13
   <= 228
 shared_xj_ub1_1_13: w_var_13 - EMIB_w_var_1_13 + x_grid_var_13
   - EMIB_x_grid_var_1_13 - 228 z2_1_13 >= -228
 shared_xj_ub2_1_13: x_grid_var_13 - EMIB_x_grid_var_1_13 + 228 z2_1_13
   <= 228
 must_adjacent_sb_2_3: z1_2_3 + z2_2_3 = 1
 horizontal_direction_sb_2_3: - z1_2_3 + z1L_2_3 + z1R_2_3 = 0
 vertical_direction_sb_2_3: - z2_2_3 + z2D_2_3 + z2U_2_3 = 0
 EMIB_rotate_eq_z2_2_3: r_EMIB_2_3 - z2_2_3 = 0
 horizontal_left_dist_lb_2_3: - w_var_2 - x_grid_var_2 + x_grid_var_3
   - 228 z1L_2_3 >= -228
 EMIB_left_overlap_2_3: w_var_2 + x_grid_var_2 - EMIB_x_grid_var_2_3
   - 228 z1L_2_3 >= -227.001
 EMIB_right_overlap_2_3: EMIB_w_var_2_3 - x_grid_var_3
   + EMIB_x_grid_var_2_3 - 228 z1L_2_3 >= -227.001
 horizontal_right_dist_lb_2_3: - w_var_3 + x_grid_var_2 - x_grid_var_3
   - 228 z1R_2_3 >= -228
 EMIB_left_overlap_right_2_3: w_var_3 + x_grid_var_3 - EMIB_x_grid_var_2_3
   - 228 z1R_2_3 >= -227.001
 EMIB_right_overlap_right_2_3: EMIB_w_var_2_3 - x_grid_var_2
   + EMIB_x_grid_var_2_3 - 228 z1R_2_3 >= -227.001
 vertical_down_dist_lb_2_3: - h_var_2 - y_grid_var_2 + y_grid_var_3
   - 228 z2D_2_3 >= -228
 EMIB_bottom_overlap_down_2_3: h_var_2 + y_grid_var_2 - EMIB_y_grid_var_2_3
   - 228 z2D_2_3 >= -227.001
 EMIB_top_overlap_down_2_3: EMIB_h_var_2_3 - y_grid_var_3
   + EMIB_y_grid_var_2_3 - 228 z2D_2_3 >= -227.001
 vertical_up_dist_lb_2_3: - h_var_3 + y_grid_var_2 - y_grid_var_3
   - 228 z2U_2_3 >= -228
 EMIB_bottom_overlap_up_2_3: h_var_3 + y_grid_var_3 - EMIB_y_grid_var_2_3
   - 228 z2U_2_3 >= -227.001
 EMIB_top_overlap_up_2_3: EMIB_h_var_2_3 - y_grid_var_2
   + EMIB_y_grid_var_2_3 - 228 z2U_2_3 >= -227.001
 shared_yi_ub1_2_3: h_var_2 - EMIB_h_var_2_3 + y_grid_var_2
   - EMIB_y_grid_var_2_3 - 228 z1_2_3 >= -228
 shared_yi_ub2_2_3: y_grid_var_2 - EMIB_y_grid_var_2_3 + 228 z1_2_3 <= 228
 shared_yj_ub1_2_3: h_var_3 - EMIB_h_var_2_3 + y_grid_var_3
   - EMIB_y_grid_var_2_3 - 228 z1_2_3 >= -228
 shared_yj_ub2_2_3: y_grid_var_3 - EMIB_y_grid_var_2_3 + 228 z1_2_3 <= 228
 shared_xi_ub1_2_3: w_var_2 - EMIB_w_var_2_3 + x_grid_var_2
   - EMIB_x_grid_var_2_3 - 228 z2_2_3 >= -228
 shared_xi_ub2_2_3: x_grid_var_2 - EMIB_x_grid_var_2_3 + 228 z2_2_3 <= 228
 shared_xj_ub1_2_3: w_var_3 - EMIB_w_var_2_3 + x_grid_var_3
   - EMIB_x_grid_var_2_3 - 228 z2_2_3 >= -228
 shared_xj_ub2_2_3: x_grid_var_3 - EMIB_x_grid_var_2_3 + 228 z2_2_3 <= 228
 must_adjacent_sb_2_5: z1_2_5 + z2_2_5 = 1
 horizontal_direction_sb_2_5: - z1_2_5 + z1L_2_5 + z1R_2_5 = 0
 vertical_direction_sb_2_5: - z2_2_5 + z2D_2_5 + z2U_2_5 = 0
 EMIB_rotate_eq_z2_2_5: r_EMIB_2_5 - z2_2_5 = 0
 horizontal_left_dist_lb_2_5: - w_var_2 - x_grid_var_2 + x_grid_var_5
   - 228 z1L_2_5 >= -228
 EMIB_left_overlap_2_5: w_var_2 + x_grid_var_2 - EMIB_x_grid_var_2_5
   - 228 z1L_2_5 >= -227.001
 EMIB_right_overlap_2_5: EMIB_w_var_2_5 - x_grid_var_5
   + EMIB_x_grid_var_2_5 - 228 z1L_2_5 >= -227.001
 horizontal_right_dist_lb_2_5: - w_var_5 + x_grid_var_2 - x_grid_var_5
   - 228 z1R_2_5 >= -228
 EMIB_left_overlap_right_2_5: w_var_5 + x_grid_var_5 - EMIB_x_grid_var_2_5
   - 228 z1R_2_5 >= -227.001
 EMIB_right_overlap_right_2_5: EMIB_w_var_2_5 - x_grid_var_2
   + EMIB_x_grid_var_2_5 - 228 z1R_2_5 >= -227.001
 vertical_down_dist_lb_2_5: - h_var_2 - y_grid_var_2 + y_grid_var_5
   - 228 z2D_2_5 >= -228
 EMIB_bottom_overlap_down_2_5: h_var_2 + y_grid_var_2 - EMIB_y_grid_var_2_5
   - 228 z2D_2_5 >= -227.001
 EMIB_top_overlap_down_2_5: EMIB_h_var_2_5 - y_grid_var_5
   + EMIB_y_grid_var_2_5 - 228 z2D_2_5 >= -227.001
 vertical_up_dist_lb_2_5: - h_var_5 + y_grid_var_2 - y_grid_var_5
   - 228 z2U_2_5 >= -228
 EMIB_bottom_overlap_up_2_5: h_var_5 + y_grid_var_5 - EMIB_y_grid_var_2_5
   - 228 z2U_2_5 >= -227.001
 EMIB_top_overlap_up_2_5: EMIB_h_var_2_5 - y_grid_var_2
   + EMIB_y_grid_var_2_5 - 228 z2U_2_5 >= -227.001
 shared_yi_ub1_2_5: h_var_2 - EMIB_h_var_2_5 + y_grid_var_2
   - EMIB_y_grid_var_2_5 - 228 z1_2_5 >= -228
 shared_yi_ub2_2_5: y_grid_var_2 - EMIB_y_grid_var_2_5 + 228 z1_2_5 <= 228
 shared_yj_ub1_2_5: h_var_5 - EMIB_h_var_2_5 + y_grid_var_5
   - EMIB_y_grid_var_2_5 - 228 z1_2_5 >= -228
 shared_yj_ub2_2_5: y_grid_var_5 - EMIB_y_grid_var_2_5 + 228 z1_2_5 <= 228
 shared_xi_ub1_2_5: w_var_2 - EMIB_w_var_2_5 + x_grid_var_2
   - EMIB_x_grid_var_2_5 - 228 z2_2_5 >= -228
 shared_xi_ub2_2_5: x_grid_var_2 - EMIB_x_grid_var_2_5 + 228 z2_2_5 <= 228
 shared_xj_ub1_2_5: w_var_5 - EMIB_w_var_2_5 + x_grid_var_5
   - EMIB_x_grid_var_2_5 - 228 z2_2_5 >= -228
 shared_xj_ub2_2_5: x_grid_var_5 - EMIB_x_grid_var_2_5 + 228 z2_2_5 <= 228
 must_adjacent_sb_2_14: z1_2_14 + z2_2_14 = 1
 horizontal_direction_sb_2_14: - z1_2_14 + z1L_2_14 + z1R_2_14 = 0
 vertical_direction_sb_2_14: - z2_2_14 + z2D_2_14 + z2U_2_14 = 0
 EMIB_rotate_eq_z2_2_14: r_EMIB_2_14 - z2_2_14 = 0
 horizontal_left_dist_lb_2_14: - w_var_2 - x_grid_var_2 + x_grid_var_14
   - 228 z1L_2_14 >= -228
 EMIB_left_overlap_2_14: w_var_2 + x_grid_var_2 - EMIB_x_grid_var_2_14
   - 228 z1L_2_14 >= -227.001
 EMIB_right_overlap_2_14: EMIB_w_var_2_14 - x_grid_var_14
   + EMIB_x_grid_var_2_14 - 228 z1L_2_14 >= -227.001
 horizontal_right_dist_lb_2_14: - w_var_14 + x_grid_var_2 - x_grid_var_14
   - 228 z1R_2_14 >= -228
 EMIB_left_overlap_right_2_14: w_var_14 + x_grid_var_14
   - EMIB_x_grid_var_2_14 - 228 z1R_2_14 >= -227.001
 EMIB_right_overlap_right_2_14: EMIB_w_var_2_14 - x_grid_var_2
   + EMIB_x_grid_var_2_14 - 228 z1R_2_14 >= -227.001
 vertical_down_dist_lb_2_14: - h_var_2 - y_grid_var_2 + y_grid_var_14
   - 228 z2D_2_14 >= -228
 EMIB_bottom_overlap_down_2_14: h_var_2 + y_grid_var_2
   - EMIB_y_grid_var_2_14 - 228 z2D_2_14 >= -227.001
 EMIB_top_overlap_down_2_14: EMIB_h_var_2_14 - y_grid_var_14
   + EMIB_y_grid_var_2_14 - 228 z2D_2_14 >= -227.001
 vertical_up_dist_lb_2_14: - h_var_14 + y_grid_var_2 - y_grid_var_14
   - 228 z2U_2_14 >= -228
 EMIB_bottom_overlap_up_2_14: h_var_14 + y_grid_var_14
   - EMIB_y_grid_var_2_14 - 228 z2U_2_14 >= -227.001
 EMIB_top_overlap_up_2_14: EMIB_h_var_2_14 - y_grid_var_2
   + EMIB_y_grid_var_2_14 - 228 z2U_2_14 >= -227.001
 shared_yi_ub1_2_14: h_var_2 - EMIB_h_var_2_14 + y_grid_var_2
   - EMIB_y_grid_var_2_14 - 228 z1_2_14 >= -228
 shared_yi_ub2_2_14: y_grid_var_2 - EMIB_y_grid_var_2_14 + 228 z1_2_14
   <= 228
 shared_yj_ub1_2_14: h_var_14 - EMIB_h_var_2_14 + y_grid_var_14
   - EMIB_y_grid_var_2_14 - 228 z1_2_14 >= -228
 shared_yj_ub2_2_14: y_grid_var_14 - EMIB_y_grid_var_2_14 + 228 z1_2_14
   <= 228
 shared_xi_ub1_2_14: w_var_2 - EMIB_w_var_2_14 + x_grid_var_2
   - EMIB_x_grid_var_2_14 - 228 z2_2_14 >= -228
 shared_xi_ub2_2_14: x_grid_var_2 - EMIB_x_grid_var_2_14 + 228 z2_2_14
   <= 228
 shared_xj_ub1_2_14: w_var_14 - EMIB_w_var_2_14 + x_grid_var_14
   - EMIB_x_grid_var_2_14 - 228 z2_2_14 >= -228
 shared_xj_ub2_2_14: x_grid_var_14 - EMIB_x_grid_var_2_14 + 228 z2_2_14
   <= 228
 must_adjacent_sb_3_11: z1_3_11 + z2_3_11 = 1
 horizontal_direction_sb_3_11: - z1_3_11 + z1L_3_11 + z1R_3_11 = 0
 vertical_direction_sb_3_11: - z2_3_11 + z2D_3_11 + z2U_3_11 = 0
 EMIB_rotate_eq_z2_3_11: r_EMIB_3_11 - z2_3_11 = 0
 horizontal_left_dist_lb_3_11: - w_var_3 - x_grid_var_3 + x_grid_var_11
   - 228 z1L_3_11 >= -228
 EMIB_left_overlap_3_11: w_var_3 + x_grid_var_3 - EMIB_x_grid_var_3_11
   - 228 z1L_3_11 >= -227.001
 EMIB_right_overlap_3_11: EMIB_w_var_3_11 - x_grid_var_11
   + EMIB_x_grid_var_3_11 - 228 z1L_3_11 >= -227.001
 horizontal_right_dist_lb_3_11: - w_var_11 + x_grid_var_3 - x_grid_var_11
   - 228 z1R_3_11 >= -228
 EMIB_left_overlap_right_3_11: w_var_11 + x_grid_var_11
   - EMIB_x_grid_var_3_11 - 228 z1R_3_11 >= -227.001
 EMIB_right_overlap_right_3_11: EMIB_w_var_3_11 - x_grid_var_3
   + EMIB_x_grid_var_3_11 - 228 z1R_3_11 >= -227.001
 vertical_down_dist_lb_3_11: - h_var_3 - y_grid_var_3 + y_grid_var_11
   - 228 z2D_3_11 >= -228
 EMIB_bottom_overlap_down_3_11: h_var_3 + y_grid_var_3
   - EMIB_y_grid_var_3_11 - 228 z2D_3_11 >= -227.001
 EMIB_top_overlap_down_3_11: EMIB_h_var_3_11 - y_grid_var_11
   + EMIB_y_grid_var_3_11 - 228 z2D_3_11 >= -227.001
 vertical_up_dist_lb_3_11: - h_var_11 + y_grid_var_3 - y_grid_var_11
   - 228 z2U_3_11 >= -228
 EMIB_bottom_overlap_up_3_11: h_var_11 + y_grid_var_11
   - EMIB_y_grid_var_3_11 - 228 z2U_3_11 >= -227.001
 EMIB_top_overlap_up_3_11: EMIB_h_var_3_11 - y_grid_var_3
   + EMIB_y_grid_var_3_11 - 228 z2U_3_11 >= -227.001
 shared_yi_ub1_3_11: h_var_3 - EMIB_h_var_3_11 + y_grid_var_3
   - EMIB_y_grid_var_3_11 - 228 z1_3_11 >= -228
 shared_yi_ub2_3_11: y_grid_var_3 - EMIB_y_grid_var_3_11 + 228 z1_3_11
   <= 228
 shared_yj_ub1_3_11: h_var_11 - EMIB_h_var_3_11 + y_grid_var_11
   - EMIB_y_grid_var_3_11 - 228 z1_3_11 >= -228
 shared_yj_ub2_3_11: y_grid_var_11 - EMIB_y_grid_var_3_11 + 228 z1_3_11
   <= 228
 shared_xi_ub1_3_11: w_var_3 - EMIB_w_var_3_11 + x_grid_var_3
   - EMIB_x_grid_var_3_11 - 228 z2_3_11 >= -228
 shared_xi_ub2_3_11: x_grid_var_3 - EMIB_x_grid_var_3_11 + 228 z2_3_11
   <= 228
 shared_xj_ub1_3_11: w_var_11 - EMIB_w_var_3_11 + x_grid_var_11
   - EMIB_x_grid_var_3_11 - 228 z2_3_11 >= -228
 shared_xj_ub2_3_11: x_grid_var_11 - EMIB_x_grid_var_3_11 + 228 z2_3_11
   <= 228
 must_adjacent_sb_5_7: z1_5_7 + z2_5_7 = 1
 horizontal_direction_sb_5_7: - z1_5_7 + z1L_5_7 + z1R_5_7 = 0
 vertical_direction_sb_5_7: - z2_5_7 + z2D_5_7 + z2U_5_7 = 0
 EMIB_rotate_eq_z2_5_7: r_EMIB_5_7 - z2_5_7 = 0
 horizontal_left_dist_lb_5_7: - w_var_5 - x_grid_var_5 + x_grid_var_7
   - 228 z1L_5_7 >= -228
 EMIB_left_overlap_5_7: w_var_5 + x_grid_var_5 - EMIB_x_grid_var_5_7
   - 228 z1L_5_7 >= -227.001
 EMIB_right_overlap_5_7: EMIB_w_var_5_7 - x_grid_var_7
   + EMIB_x_grid_var_5_7 - 228 z1L_5_7 >= -227.001
 horizontal_right_dist_lb_5_7: - w_var_7 + x_grid_var_5 - x_grid_var_7
   - 228 z1R_5_7 >= -228
 EMIB_left_overlap_right_5_7: w_var_7 + x_grid_var_7 - EMIB_x_grid_var_5_7
   - 228 z1R_5_7 >= -227.001
 EMIB_right_overlap_right_5_7: EMIB_w_var_5_7 - x_grid_var_5
   + EMIB_x_grid_var_5_7 - 228 z1R_5_7 >= -227.001
 vertical_down_dist_lb_5_7: - h_var_5 - y_grid_var_5 + y_grid_var_7
   - 228 z2D_5_7 >= -228
 EMIB_bottom_overlap_down_5_7: h_var_5 + y_grid_var_5 - EMIB_y_grid_var_5_7
   - 228 z2D_5_7 >= -227.001
 EMIB_top_overlap_down_5_7: EMIB_h_var_5_7 - y_grid_var_7
   + EMIB_y_grid_var_5_7 - 228 z2D_5_7 >= -227.001
 vertical_up_dist_lb_5_7: - h_var_7 + y_grid_var_5 - y_grid_var_7
   - 228 z2U_5_7 >= -228
 EMIB_bottom_overlap_up_5_7: h_var_7 + y_grid_var_7 - EMIB_y_grid_var_5_7
   - 228 z2U_5_7 >= -227.001
 EMIB_top_overlap_up_5_7: EMIB_h_var_5_7 - y_grid_var_5
   + EMIB_y_grid_var_5_7 - 228 z2U_5_7 >= -227.001
 shared_yi_ub1_5_7: h_var_5 - EMIB_h_var_5_7 + y_grid_var_5
   - EMIB_y_grid_var_5_7 - 228 z1_5_7 >= -228
 shared_yi_ub2_5_7: y_grid_var_5 - EMIB_y_grid_var_5_7 + 228 z1_5_7 <= 228
 shared_yj_ub1_5_7: h_var_7 - EMIB_h_var_5_7 + y_grid_var_7
   - EMIB_y_grid_var_5_7 - 228 z1_5_7 >= -228
 shared_yj_ub2_5_7: y_grid_var_7 - EMIB_y_grid_var_5_7 + 228 z1_5_7 <= 228
 shared_xi_ub1_5_7: w_var_5 - EMIB_w_var_5_7 + x_grid_var_5
   - EMIB_x_grid_var_5_7 - 228 z2_5_7 >= -228
 shared_xi_ub2_5_7: x_grid_var_5 - EMIB_x_grid_var_5_7 + 228 z2_5_7 <= 228
 shared_xj_ub1_5_7: w_var_7 - EMIB_w_var_5_7 + x_grid_var_7
   - EMIB_x_grid_var_5_7 - 228 z2_5_7 >= -228
 shared_xj_ub2_5_7: x_grid_var_7 - EMIB_x_grid_var_5_7 + 228 z2_5_7 <= 228
 must_adjacent_sb_5_9: z1_5_9 + z2_5_9 = 1
 horizontal_direction_sb_5_9: - z1_5_9 + z1L_5_9 + z1R_5_9 = 0
 vertical_direction_sb_5_9: - z2_5_9 + z2D_5_9 + z2U_5_9 = 0
 EMIB_rotate_eq_z2_5_9: r_EMIB_5_9 - z2_5_9 = 0
 horizontal_left_dist_lb_5_9: - w_var_5 - x_grid_var_5 + x_grid_var_9
   - 228 z1L_5_9 >= -228
 EMIB_left_overlap_5_9: w_var_5 + x_grid_var_5 - EMIB_x_grid_var_5_9
   - 228 z1L_5_9 >= -227.001
 EMIB_right_overlap_5_9: EMIB_w_var_5_9 - x_grid_var_9
   + EMIB_x_grid_var_5_9 - 228 z1L_5_9 >= -227.001
 horizontal_right_dist_lb_5_9: - w_var_9 + x_grid_var_5 - x_grid_var_9
   - 228 z1R_5_9 >= -228
 EMIB_left_overlap_right_5_9: w_var_9 + x_grid_var_9 - EMIB_x_grid_var_5_9
   - 228 z1R_5_9 >= -227.001
 EMIB_right_overlap_right_5_9: EMIB_w_var_5_9 - x_grid_var_5
   + EMIB_x_grid_var_5_9 - 228 z1R_5_9 >= -227.001
 vertical_down_dist_lb_5_9: - h_var_5 - y_grid_var_5 + y_grid_var_9
   - 228 z2D_5_9 >= -228
 EMIB_bottom_overlap_down_5_9: h_var_5 + y_grid_var_5 - EMIB_y_grid_var_5_9
   - 228 z2D_5_9 >= -227.001
 EMIB_top_overlap_down_5_9: EMIB_h_var_5_9 - y_grid_var_9
   + EMIB_y_grid_var_5_9 - 228 z2D_5_9 >= -227.001
 vertical_up_dist_lb_5_9: - h_var_9 + y_grid_var_5 - y_grid_var_9
   - 228 z2U_5_9 >= -228
 EMIB_bottom_overlap_up_5_9: h_var_9 + y_grid_var_9 - EMIB_y_grid_var_5_9
   - 228 z2U_5_9 >= -227.001
 EMIB_top_overlap_up_5_9: EMIB_h_var_5_9 - y_grid_var_5
   + EMIB_y_grid_var_5_9 - 228 z2U_5_9 >= -227.001
 shared_yi_ub1_5_9: h_var_5 - EMIB_h_var_5_9 + y_grid_var_5
   - EMIB_y_grid_var_5_9 - 228 z1_5_9 >= -228
 shared_yi_ub2_5_9: y_grid_var_5 - EMIB_y_grid_var_5_9 + 228 z1_5_9 <= 228
 shared_yj_ub1_5_9: h_var_9 - EMIB_h_var_5_9 + y_grid_var_9
   - EMIB_y_grid_var_5_9 - 228 z1_5_9 >= -228
 shared_yj_ub2_5_9: y_grid_var_9 - EMIB_y_grid_var_5_9 + 228 z1_5_9 <= 228
 shared_xi_ub1_5_9: w_var_5 - EMIB_w_var_5_9 + x_grid_var_5
   - EMIB_x_grid_var_5_9 - 228 z2_5_9 >= -228
 shared_xi_ub2_5_9: x_grid_var_5 - EMIB_x_grid_var_5_9 + 228 z2_5_9 <= 228
 shared_xj_ub1_5_9: w_var_9 - EMIB_w_var_5_9 + x_grid_var_9
   - EMIB_x_grid_var_5_9 - 228 z2_5_9 >= -228
 shared_xj_ub2_5_9: x_grid_var_9 - EMIB_x_grid_var_5_9 + 228 z2_5_9 <= 228
 must_adjacent_sb_5_11: z1_5_11 + z2_5_11 = 1
 horizontal_direction_sb_5_11: - z1_5_11 + z1L_5_11 + z1R_5_11 = 0
 vertical_direction_sb_5_11: - z2_5_11 + z2D_5_11 + z2U_5_11 = 0
 EMIB_rotate_eq_z2_5_11: r_EMIB_5_11 - z2_5_11 = 0
 horizontal_left_dist_lb_5_11: - w_var_5 - x_grid_var_5 + x_grid_var_11
   - 228 z1L_5_11 >= -228
 EMIB_left_overlap_5_11: w_var_5 + x_grid_var_5 - EMIB_x_grid_var_5_11
   - 228 z1L_5_11 >= -227.001
 EMIB_right_overlap_5_11: EMIB_w_var_5_11 - x_grid_var_11
   + EMIB_x_grid_var_5_11 - 228 z1L_5_11 >= -227.001
 horizontal_right_dist_lb_5_11: - w_var_11 + x_grid_var_5 - x_grid_var_11
   - 228 z1R_5_11 >= -228
 EMIB_left_overlap_right_5_11: w_var_11 + x_grid_var_11
   - EMIB_x_grid_var_5_11 - 228 z1R_5_11 >= -227.001
 EMIB_right_overlap_right_5_11: EMIB_w_var_5_11 - x_grid_var_5
   + EMIB_x_grid_var_5_11 - 228 z1R_5_11 >= -227.001
 vertical_down_dist_lb_5_11: - h_var_5 - y_grid_var_5 + y_grid_var_11
   - 228 z2D_5_11 >= -228
 EMIB_bottom_overlap_down_5_11: h_var_5 + y_grid_var_5
   - EMIB_y_grid_var_5_11 - 228 z2D_5_11 >= -227.001
 EMIB_top_overlap_down_5_11: EMIB_h_var_5_11 - y_grid_var_11
   + EMIB_y_grid_var_5_11 - 228 z2D_5_11 >= -227.001
 vertical_up_dist_lb_5_11: - h_var_11 + y_grid_var_5 - y_grid_var_11
   - 228 z2U_5_11 >= -228
 EMIB_bottom_overlap_up_5_11: h_var_11 + y_grid_var_11
   - EMIB_y_grid_var_5_11 - 228 z2U_5_11 >= -227.001
 EMIB_top_overlap_up_5_11: EMIB_h_var_5_11 - y_grid_var_5
   + EMIB_y_grid_var_5_11 - 228 z2U_5_11 >= -227.001
 shared_yi_ub1_5_11: h_var_5 - EMIB_h_var_5_11 + y_grid_var_5
   - EMIB_y_grid_var_5_11 - 228 z1_5_11 >= -228
 shared_yi_ub2_5_11: y_grid_var_5 - EMIB_y_grid_var_5_11 + 228 z1_5_11
   <= 228
 shared_yj_ub1_5_11: h_var_11 - EMIB_h_var_5_11 + y_grid_var_11
   - EMIB_y_grid_var_5_11 - 228 z1_5_11 >= -228
 shared_yj_ub2_5_11: y_grid_var_11 - EMIB_y_grid_var_5_11 + 228 z1_5_11
   <= 228
 shared_xi_ub1_5_11: w_var_5 - EMIB_w_var_5_11 + x_grid_var_5
   - EMIB_x_grid_var_5_11 - 228 z2_5_11 >= -228
 shared_xi_ub2_5_11: x_grid_var_5 - EMIB_x_grid_var_5_11 + 228 z2_5_11
   <= 228
 shared_xj_ub1_5_11: w_var_11 - EMIB_w_var_5_11 + x_grid_var_11
   - EMIB_x_grid_var_5_11 - 228 z2_5_11 >= -228
 shared_xj_ub2_5_11: x_grid_var_11 - EMIB_x_grid_var_5_11 + 228 z2_5_11
   <= 228
 must_adjacent_sb_5_12: z1_5_12 + z2_5_12 = 1
 horizontal_direction_sb_5_12: - z1_5_12 + z1L_5_12 + z1R_5_12 = 0
 vertical_direction_sb_5_12: - z2_5_12 + z2D_5_12 + z2U_5_12 = 0
 EMIB_rotate_eq_z2_5_12: r_EMIB_5_12 - z2_5_12 = 0
 horizontal_left_dist_lb_5_12: - w_var_5 - x_grid_var_5 + x_grid_var_12
   - 228 z1L_5_12 >= -228
 EMIB_left_overlap_5_12: w_var_5 + x_grid_var_5 - EMIB_x_grid_var_5_12
   - 228 z1L_5_12 >= -227.001
 EMIB_right_overlap_5_12: EMIB_w_var_5_12 - x_grid_var_12
   + EMIB_x_grid_var_5_12 - 228 z1L_5_12 >= -227.001
 horizontal_right_dist_lb_5_12: - w_var_12 + x_grid_var_5 - x_grid_var_12
   - 228 z1R_5_12 >= -228
 EMIB_left_overlap_right_5_12: w_var_12 + x_grid_var_12
   - EMIB_x_grid_var_5_12 - 228 z1R_5_12 >= -227.001
 EMIB_right_overlap_right_5_12: EMIB_w_var_5_12 - x_grid_var_5
   + EMIB_x_grid_var_5_12 - 228 z1R_5_12 >= -227.001
 vertical_down_dist_lb_5_12: - h_var_5 - y_grid_var_5 + y_grid_var_12
   - 228 z2D_5_12 >= -228
 EMIB_bottom_overlap_down_5_12: h_var_5 + y_grid_var_5
   - EMIB_y_grid_var_5_12 - 228 z2D_5_12 >= -227.001
 EMIB_top_overlap_down_5_12: EMIB_h_var_5_12 - y_grid_var_12
   + EMIB_y_grid_var_5_12 - 228 z2D_5_12 >= -227.001
 vertical_up_dist_lb_5_12: - h_var_12 + y_grid_var_5 - y_grid_var_12
   - 228 z2U_5_12 >= -228
 EMIB_bottom_overlap_up_5_12: h_var_12 + y_grid_var_12
   - EMIB_y_grid_var_5_12 - 228 z2U_5_12 >= -227.001
 EMIB_top_overlap_up_5_12: EMIB_h_var_5_12 - y_grid_var_5
   + EMIB_y_grid_var_5_12 - 228 z2U_5_12 >= -227.001
 shared_yi_ub1_5_12: h_var_5 - EMIB_h_var_5_12 + y_grid_var_5
   - EMIB_y_grid_var_5_12 - 228 z1_5_12 >= -228
 shared_yi_ub2_5_12: y_grid_var_5 - EMIB_y_grid_var_5_12 + 228 z1_5_12
   <= 228
 shared_yj_ub1_5_12: h_var_12 - EMIB_h_var_5_12 + y_grid_var_12
   - EMIB_y_grid_var_5_12 - 228 z1_5_12 >= -228
 shared_yj_ub2_5_12: y_grid_var_12 - EMIB_y_grid_var_5_12 + 228 z1_5_12
   <= 228
 shared_xi_ub1_5_12: w_var_5 - EMIB_w_var_5_12 + x_grid_var_5
   - EMIB_x_grid_var_5_12 - 228 z2_5_12 >= -228
 shared_xi_ub2_5_12: x_grid_var_5 - EMIB_x_grid_var_5_12 + 228 z2_5_12
   <= 228
 shared_xj_ub1_5_12: w_var_12 - EMIB_w_var_5_12 + x_grid_var_12
   - EMIB_x_grid_var_5_12 - 228 z2_5_12 >= -228
 shared_xj_ub2_5_12: x_grid_var_12 - EMIB_x_grid_var_5_12 + 228 z2_5_12
   <= 228
 must_adjacent_sb_5_14: z1_5_14 + z2_5_14 = 1
 horizontal_direction_sb_5_14: - z1_5_14 + z1L_5_14 + z1R_5_14 = 0
 vertical_direction_sb_5_14: - z2_5_14 + z2D_5_14 + z2U_5_14 = 0
 EMIB_rotate_eq_z2_5_14: r_EMIB_5_14 - z2_5_14 = 0
 horizontal_left_dist_lb_5_14: - w_var_5 - x_grid_var_5 + x_grid_var_14
   - 228 z1L_5_14 >= -228
 EMIB_left_overlap_5_14: w_var_5 + x_grid_var_5 - EMIB_x_grid_var_5_14
   - 228 z1L_5_14 >= -227.001
 EMIB_right_overlap_5_14: EMIB_w_var_5_14 - x_grid_var_14
   + EMIB_x_grid_var_5_14 - 228 z1L_5_14 >= -227.001
 horizontal_right_dist_lb_5_14: - w_var_14 + x_grid_var_5 - x_grid_var_14
   - 228 z1R_5_14 >= -228
 EMIB_left_overlap_right_5_14: w_var_14 + x_grid_var_14
   - EMIB_x_grid_var_5_14 - 228 z1R_5_14 >= -227.001
 EMIB_right_overlap_right_5_14: EMIB_w_var_5_14 - x_grid_var_5
   + EMIB_x_grid_var_5_14 - 228 z1R_5_14 >= -227.001
 vertical_down_dist_lb_5_14: - h_var_5 - y_grid_var_5 + y_grid_var_14
   - 228 z2D_5_14 >= -228
 EMIB_bottom_overlap_down_5_14: h_var_5 + y_grid_var_5
   - EMIB_y_grid_var_5_14 - 228 z2D_5_14 >= -227.001
 EMIB_top_overlap_down_5_14: EMIB_h_var_5_14 - y_grid_var_14
   + EMIB_y_grid_var_5_14 - 228 z2D_5_14 >= -227.001
 vertical_up_dist_lb_5_14: - h_var_14 + y_grid_var_5 - y_grid_var_14
   - 228 z2U_5_14 >= -228
 EMIB_bottom_overlap_up_5_14: h_var_14 + y_grid_var_14
   - EMIB_y_grid_var_5_14 - 228 z2U_5_14 >= -227.001
 EMIB_top_overlap_up_5_14: EMIB_h_var_5_14 - y_grid_var_5
   + EMIB_y_grid_var_5_14 - 228 z2U_5_14 >= -227.001
 shared_yi_ub1_5_14: h_var_5 - EMIB_h_var_5_14 + y_grid_var_5
   - EMIB_y_grid_var_5_14 - 228 z1_5_14 >= -228
 shared_yi_ub2_5_14: y_grid_var_5 - EMIB_y_grid_var_5_14 + 228 z1_5_14
   <= 228
 shared_yj_ub1_5_14: h_var_14 - EMIB_h_var_5_14 + y_grid_var_14
   - EMIB_y_grid_var_5_14 - 228 z1_5_14 >= -228
 shared_yj_ub2_5_14: y_grid_var_14 - EMIB_y_grid_var_5_14 + 228 z1_5_14
   <= 228
 shared_xi_ub1_5_14: w_var_5 - EMIB_w_var_5_14 + x_grid_var_5
   - EMIB_x_grid_var_5_14 - 228 z2_5_14 >= -228
 shared_xi_ub2_5_14: x_grid_var_5 - EMIB_x_grid_var_5_14 + 228 z2_5_14
   <= 228
 shared_xj_ub1_5_14: w_var_14 - EMIB_w_var_5_14 + x_grid_var_14
   - EMIB_x_grid_var_5_14 - 228 z2_5_14 >= -228
 shared_xj_ub2_5_14: x_grid_var_14 - EMIB_x_grid_var_5_14 + 228 z2_5_14
   <= 228
 must_adjacent_sb_6_12: z1_6_12 + z2_6_12 = 1
 horizontal_direction_sb_6_12: - z1_6_12 + z1L_6_12 + z1R_6_12 = 0
 vertical_direction_sb_6_12: - z2_6_12 + z2D_6_12 + z2U_6_12 = 0
 EMIB_rotate_eq_z2_6_12: r_EMIB_6_12 - z2_6_12 = 0
 horizontal_left_dist_lb_6_12: - w_var_6 - x_grid_var_6 + x_grid_var_12
   - 228 z1L_6_12 >= -228
 EMIB_left_overlap_6_12: w_var_6 + x_grid_var_6 - EMIB_x_grid_var_6_12
   - 228 z1L_6_12 >= -227.001
 EMIB_right_overlap_6_12: EMIB_w_var_6_12 - x_grid_var_12
   + EMIB_x_grid_var_6_12 - 228 z1L_6_12 >= -227.001
 horizontal_right_dist_lb_6_12: - w_var_12 + x_grid_var_6 - x_grid_var_12
   - 228 z1R_6_12 >= -228
 EMIB_left_overlap_right_6_12: w_var_12 + x_grid_var_12
   - EMIB_x_grid_var_6_12 - 228 z1R_6_12 >= -227.001
 EMIB_right_overlap_right_6_12: EMIB_w_var_6_12 - x_grid_var_6
   + EMIB_x_grid_var_6_12 - 228 z1R_6_12 >= -227.001
 vertical_down_dist_lb_6_12: - h_var_6 - y_grid_var_6 + y_grid_var_12
   - 228 z2D_6_12 >= -228
 EMIB_bottom_overlap_down_6_12: h_var_6 + y_grid_var_6
   - EMIB_y_grid_var_6_12 - 228 z2D_6_12 >= -227.001
 EMIB_top_overlap_down_6_12: EMIB_h_var_6_12 - y_grid_var_12
   + EMIB_y_grid_var_6_12 - 228 z2D_6_12 >= -227.001
 vertical_up_dist_lb_6_12: - h_var_12 + y_grid_var_6 - y_grid_var_12
   - 228 z2U_6_12 >= -228
 EMIB_bottom_overlap_up_6_12: h_var_12 + y_grid_var_12
   - EMIB_y_grid_var_6_12 - 228 z2U_6_12 >= -227.001
 EMIB_top_overlap_up_6_12: EMIB_h_var_6_12 - y_grid_var_6
   + EMIB_y_grid_var_6_12 - 228 z2U_6_12 >= -227.001
 shared_yi_ub1_6_12: h_var_6 - EMIB_h_var_6_12 + y_grid_var_6
   - EMIB_y_grid_var_6_12 - 228 z1_6_12 >= -228
 shared_yi_ub2_6_12: y_grid_var_6 - EMIB_y_grid_var_6_12 + 228 z1_6_12
   <= 228
 shared_yj_ub1_6_12: h_var_12 - EMIB_h_var_6_12 + y_grid_var_12
   - EMIB_y_grid_var_6_12 - 228 z1_6_12 >= -228
 shared_yj_ub2_6_12: y_grid_var_12 - EMIB_y_grid_var_6_12 + 228 z1_6_12
   <= 228
 shared_xi_ub1_6_12: w_var_6 - EMIB_w_var_6_12 + x_grid_var_6
   - EMIB_x_grid_var_6_12 - 228 z2_6_12 >= -228
 shared_xi_ub2_6_12: x_grid_var_6 - EMIB_x_grid_var_6_12 + 228 z2_6_12
   <= 228
 shared_xj_ub1_6_12: w_var_12 - EMIB_w_var_6_12 + x_grid_var_12
   - EMIB_x_grid_var_6_12 - 228 z2_6_12 >= -228
 shared_xj_ub2_6_12: x_grid_var_12 - EMIB_x_grid_var_6_12 + 228 z2_6_12
   <= 228
 must_adjacent_sb_7_13: z1_7_13 + z2_7_13 = 1
 horizontal_direction_sb_7_13: - z1_7_13 + z1L_7_13 + z1R_7_13 = 0
 vertical_direction_sb_7_13: - z2_7_13 + z2D_7_13 + z2U_7_13 = 0
 EMIB_rotate_eq_z2_7_13: r_EMIB_7_13 - z2_7_13 = 0
 horizontal_left_dist_lb_7_13: - w_var_7 - x_grid_var_7 + x_grid_var_13
   - 228 z1L_7_13 >= -228
 EMIB_left_overlap_7_13: w_var_7 + x_grid_var_7 - EMIB_x_grid_var_7_13
   - 228 z1L_7_13 >= -227.001
 EMIB_right_overlap_7_13: EMIB_w_var_7_13 - x_grid_var_13
   + EMIB_x_grid_var_7_13 - 228 z1L_7_13 >= -227.001
 horizontal_right_dist_lb_7_13: - w_var_13 + x_grid_var_7 - x_grid_var_13
   - 228 z1R_7_13 >= -228
 EMIB_left_overlap_right_7_13: w_var_13 + x_grid_var_13
   - EMIB_x_grid_var_7_13 - 228 z1R_7_13 >= -227.001
 EMIB_right_overlap_right_7_13: EMIB_w_var_7_13 - x_grid_var_7
   + EMIB_x_grid_var_7_13 - 228 z1R_7_13 >= -227.001
 vertical_down_dist_lb_7_13: - h_var_7 - y_grid_var_7 + y_grid_var_13
   - 228 z2D_7_13 >= -228
 EMIB_bottom_overlap_down_7_13: h_var_7 + y_grid_var_7
   - EMIB_y_grid_var_7_13 - 228 z2D_7_13 >= -227.001
 EMIB_top_overlap_down_7_13: EMIB_h_var_7_13 - y_grid_var_13
   + EMIB_y_grid_var_7_13 - 228 z2D_7_13 >= -227.001
 vertical_up_dist_lb_7_13: - h_var_13 + y_grid_var_7 - y_grid_var_13
   - 228 z2U_7_13 >= -228
 EMIB_bottom_overlap_up_7_13: h_var_13 + y_grid_var_13
   - EMIB_y_grid_var_7_13 - 228 z2U_7_13 >= -227.001
 EMIB_top_overlap_up_7_13: EMIB_h_var_7_13 - y_grid_var_7
   + EMIB_y_grid_var_7_13 - 228 z2U_7_13 >= -227.001
 shared_yi_ub1_7_13: h_var_7 - EMIB_h_var_7_13 + y_grid_var_7
   - EMIB_y_grid_var_7_13 - 228 z1_7_13 >= -228
 shared_yi_ub2_7_13: y_grid_var_7 - EMIB_y_grid_var_7_13 + 228 z1_7_13
   <= 228
 shared_yj_ub1_7_13: h_var_13 - EMIB_h_var_7_13 + y_grid_var_13
   - EMIB_y_grid_var_7_13 - 228 z1_7_13 >= -228
 shared_yj_ub2_7_13: y_grid_var_13 - EMIB_y_grid_var_7_13 + 228 z1_7_13
   <= 228
 shared_xi_ub1_7_13: w_var_7 - EMIB_w_var_7_13 + x_grid_var_7
   - EMIB_x_grid_var_7_13 - 228 z2_7_13 >= -228
 shared_xi_ub2_7_13: x_grid_var_7 - EMIB_x_grid_var_7_13 + 228 z2_7_13
   <= 228
 shared_xj_ub1_7_13: w_var_13 - EMIB_w_var_7_13 + x_grid_var_13
   - EMIB_x_grid_var_7_13 - 228 z2_7_13 >= -228
 shared_xj_ub2_7_13: x_grid_var_13 - EMIB_x_grid_var_7_13 + 228 z2_7_13
   <= 228
 must_adjacent_sb_7_14: z1_7_14 + z2_7_14 = 1
 horizontal_direction_sb_7_14: - z1_7_14 + z1L_7_14 + z1R_7_14 = 0
 vertical_direction_sb_7_14: - z2_7_14 + z2D_7_14 + z2U_7_14 = 0
 EMIB_rotate_eq_z2_7_14: r_EMIB_7_14 - z2_7_14 = 0
 horizontal_left_dist_lb_7_14: - w_var_7 - x_grid_var_7 + x_grid_var_14
   - 228 z1L_7_14 >= -228
 EMIB_left_overlap_7_14: w_var_7 + x_grid_var_7 - EMIB_x_grid_var_7_14
   - 228 z1L_7_14 >= -227.001
 EMIB_right_overlap_7_14: EMIB_w_var_7_14 - x_grid_var_14
   + EMIB_x_grid_var_7_14 - 228 z1L_7_14 >= -227.001
 horizontal_right_dist_lb_7_14: - w_var_14 + x_grid_var_7 - x_grid_var_14
   - 228 z1R_7_14 >= -228
 EMIB_left_overlap_right_7_14: w_var_14 + x_grid_var_14
   - EMIB_x_grid_var_7_14 - 228 z1R_7_14 >= -227.001
 EMIB_right_overlap_right_7_14: EMIB_w_var_7_14 - x_grid_var_7
   + EMIB_x_grid_var_7_14 - 228 z1R_7_14 >= -227.001
 vertical_down_dist_lb_7_14: - h_var_7 - y_grid_var_7 + y_grid_var_14
   - 228 z2D_7_14 >= -228
 EMIB_bottom_overlap_down_7_14: h_var_7 + y_grid_var_7
   - EMIB_y_grid_var_7_14 - 228 z2D_7_14 >= -227.001
 EMIB_top_overlap_down_7_14: EMIB_h_var_7_14 - y_grid_var_14
   + EMIB_y_grid_var_7_14 - 228 z2D_7_14 >= -227.001
 vertical_up_dist_lb_7_14: - h_var_14 + y_grid_var_7 - y_grid_var_14
   - 228 z2U_7_14 >= -228
 EMIB_bottom_overlap_up_7_14: h_var_14 + y_grid_var_14
   - EMIB_y_grid_var_7_14 - 228 z2U_7_14 >= -227.001
 EMIB_top_overlap_up_7_14: EMIB_h_var_7_14 - y_grid_var_7
   + EMIB_y_grid_var_7_14 - 228 z2U_7_14 >= -227.001
 shared_yi_ub1_7_14: h_var_7 - EMIB_h_var_7_14 + y_grid_var_7
   - EMIB_y_grid_var_7_14 - 228 z1_7_14 >= -228
 shared_yi_ub2_7_14: y_grid_var_7 - EMIB_y_grid_var_7_14 + 228 z1_7_14
   <= 228
 shared_yj_ub1_7_14: h_var_14 - EMIB_h_var_7_14 + y_grid_var_14
   - EMIB_y_grid_var_7_14 - 228 z1_7_14 >= -228
 shared_yj_ub2_7_14: y_grid_var_14 - EMIB_y_grid_var_7_14 + 228 z1_7_14
   <= 228
 shared_xi_ub1_7_14: w_var_7 - EMIB_w_var_7_14 + x_grid_var_7
   - EMIB_x_grid_var_7_14 - 228 z2_7_14 >= -228
 shared_xi_ub2_7_14: x_grid_var_7 - EMIB_x_grid_var_7_14 + 228 z2_7_14
   <= 228
 shared_xj_ub1_7_14: w_var_14 - EMIB_w_var_7_14 + x_grid_var_14
   - EMIB_x_grid_var_7_14 - 228 z2_7_14 >= -228
 shared_xj_ub2_7_14: x_grid_var_14 - EMIB_x_grid_var_7_14 + 228 z2_7_14
   <= 228
 must_adjacent_sb_9_14: z1_9_14 + z2_9_14 = 1
 horizontal_direction_sb_9_14: - z1_9_14 + z1L_9_14 + z1R_9_14 = 0
 vertical_direction_sb_9_14: - z2_9_14 + z2D_9_14 + z2U_9_14 = 0
 EMIB_rotate_eq_z2_9_14: r_EMIB_9_14 - z2_9_14 = 0
 horizontal_left_dist_lb_9_14: - w_var_9 - x_grid_var_9 + x_grid_var_14
   - 228 z1L_9_14 >= -228
 EMIB_left_overlap_9_14: w_var_9 + x_grid_var_9 - EMIB_x_grid_var_9_14
   - 228 z1L_9_14 >= -227.001
 EMIB_right_overlap_9_14: EMIB_w_var_9_14 - x_grid_var_14
   + EMIB_x_grid_var_9_14 - 228 z1L_9_14 >= -227.001
 horizontal_right_dist_lb_9_14: - w_var_14 + x_grid_var_9 - x_grid_var_14
   - 228 z1R_9_14 >= -228
 EMIB_left_overlap_right_9_14: w_var_14 + x_grid_var_14
   - EMIB_x_grid_var_9_14 - 228 z1R_9_14 >= -227.001
 EMIB_right_overlap_right_9_14: EMIB_w_var_9_14 - x_grid_var_9
   + EMIB_x_grid_var_9_14 - 228 z1R_9_14 >= -227.001
 vertical_down_dist_lb_9_14: - h_var_9 - y_grid_var_9 + y_grid_var_14
   - 228 z2D_9_14 >= -228
 EMIB_bottom_overlap_down_9_14: h_var_9 + y_grid_var_9
   - EMIB_y_grid_var_9_14 - 228 z2D_9_14 >= -227.001
 EMIB_top_overlap_down_9_14: EMIB_h_var_9_14 - y_grid_var_14
   + EMIB_y_grid_var_9_14 - 228 z2D_9_14 >= -227.001
 vertical_up_dist_lb_9_14: - h_var_14 + y_grid_var_9 - y_grid_var_14
   - 228 z2U_9_14 >= -228
 EMIB_bottom_overlap_up_9_14: h_var_14 + y_grid_var_14
   - EMIB_y_grid_var_9_14 - 228 z2U_9_14 >= -227.001
 EMIB_top_overlap_up_9_14: EMIB_h_var_9_14 - y_grid_var_9
   + EMIB_y_grid_var_9_14 - 228 z2U_9_14 >= -227.001
 shared_yi_ub1_9_14: h_var_9 - EMIB_h_var_9_14 + y_grid_var_9
   - EMIB_y_grid_var_9_14 - 228 z1_9_14 >= -228
 shared_yi_ub2_9_14: y_grid_var_9 - EMIB_y_grid_var_9_14 + 228 z1_9_14
   <= 228
 shared_yj_ub1_9_14: h_var_14 - EMIB_h_var_9_14 + y_grid_var_14
   - EMIB_y_grid_var_9_14 - 228 z1_9_14 >= -228
 shared_yj_ub2_9_14: y_grid_var_14 - EMIB_y_grid_var_9_14 + 228 z1_9_14
   <= 228
 shared_xi_ub1_9_14: w_var_9 - EMIB_w_var_9_14 + x_grid_var_9
   - EMIB_x_grid_var_9_14 - 228 z2_9_14 >= -228
 shared_xi_ub2_9_14: x_grid_var_9 - EMIB_x_grid_var_9_14 + 228 z2_9_14
   <= 228
 shared_xj_ub1_9_14: w_var_14 - EMIB_w_var_9_14 + x_grid_var_14
   - EMIB_x_grid_var_9_14 - 228 z2_9_14 >= -228
 shared_xj_ub2_9_14: x_grid_var_14 - EMIB_x_grid_var_9_14 + 228 z2_9_14
   <= 228
 must_adjacent_sb_10_12: z1_10_12 + z2_10_12 = 1
 horizontal_direction_sb_10_12: - z1_10_12 + z1L_10_12 + z1R_10_12 = 0
 vertical_direction_sb_10_12: - z2_10_12 + z2D_10_12 + z2U_10_12 = 0
 EMIB_rotate_eq_z2_10_12: r_EMIB_10_12 - z2_10_12 = 0
 horizontal_left_dist_lb_10_12: - w_var_10 - x_grid_var_10 + x_grid_var_12
   - 228 z1L_10_12 >= -228
 EMIB_left_overlap_10_12: w_var_10 + x_grid_var_10 - EMIB_x_grid_var_10_12
   - 228 z1L_10_12 >= -227.001
 EMIB_right_overlap_10_12: EMIB_w_var_10_12 - x_grid_var_12
   + EMIB_x_grid_var_10_12 - 228 z1L_10_12 >= -227.001
 horizontal_right_dist_lb_10_12: - w_var_12 + x_grid_var_10 - x_grid_var_12
   - 228 z1R_10_12 >= -228
 EMIB_left_overlap_right_10_12: w_var_12 + x_grid_var_12
   - EMIB_x_grid_var_10_12 - 228 z1R_10_12 >= -227.001
 EMIB_right_overlap_right_10_12: EMIB_w_var_10_12 - x_grid_var_10
   + EMIB_x_grid_var_10_12 - 228 z1R_10_12 >= -227.001
 vertical_down_dist_lb_10_12: - h_var_10 - y_grid_var_10 + y_grid_var_12
   - 228 z2D_10_12 >= -228
 EMIB_bottom_overlap_down_10_12: h_var_10 + y_grid_var_10
   - EMIB_y_grid_var_10_12 - 228 z2D_10_12 >= -227.001
 EMIB_top_overlap_down_10_12: EMIB_h_var_10_12 - y_grid_var_12
   + EMIB_y_grid_var_10_12 - 228 z2D_10_12 >= -227.001
 vertical_up_dist_lb_10_12: - h_var_12 + y_grid_var_10 - y_grid_var_12
   - 228 z2U_10_12 >= -228
 EMIB_bottom_overlap_up_10_12: h_var_12 + y_grid_var_12
   - EMIB_y_grid_var_10_12 - 228 z2U_10_12 >= -227.001
 EMIB_top_overlap_up_10_12: EMIB_h_var_10_12 - y_grid_var_10
   + EMIB_y_grid_var_10_12 - 228 z2U_10_12 >= -227.001
 shared_yi_ub1_10_12: h_var_10 - EMIB_h_var_10_12 + y_grid_var_10
   - EMIB_y_grid_var_10_12 - 228 z1_10_12 >= -228
 shared_yi_ub2_10_12: y_grid_var_10 - EMIB_y_grid_var_10_12 + 228 z1_10_12
   <= 228
 shared_yj_ub1_10_12: h_var_12 - EMIB_h_var_10_12 + y_grid_var_12
   - EMIB_y_grid_var_10_12 - 228 z1_10_12 >= -228
 shared_yj_ub2_10_12: y_grid_var_12 - EMIB_y_grid_var_10_12 + 228 z1_10_12
   <= 228
 shared_xi_ub1_10_12: w_var_10 - EMIB_w_var_10_12 + x_grid_var_10
   - EMIB_x_grid_var_10_12 - 228 z2_10_12 >= -228
 shared_xi_ub2_10_12: x_grid_var_10 - EMIB_x_grid_var_10_12 + 228 z2_10_12
   <= 228
 shared_xj_ub1_10_12: w_var_12 - EMIB_w_var_10_12 + x_grid_var_12
   - EMIB_x_grid_var_10_12 - 228 z2_10_12 >= -228
 shared_xj_ub2_10_12: x_grid_var_12 - EMIB_x_grid_var_10_12 + 228 z2_10_12
   <= 228
 must_adjacent_sb_11_12: z1_11_12 + z2_11_12 = 1
 horizontal_direction_sb_11_12: - z1_11_12 + z1L_11_12 + z1R_11_12 = 0
 vertical_direction_sb_11_12: - z2_11_12 + z2D_11_12 + z2U_11_12 = 0
 EMIB_rotate_eq_z2_11_12: r_EMIB_11_12 - z2_11_12 = 0
 horizontal_left_dist_lb_11_12: - w_var_11 - x_grid_var_11 + x_grid_var_12
   - 228 z1L_11_12 >= -228
 EMIB_left_overlap_11_12: w_var_11 + x_grid_var_11 - EMIB_x_grid_var_11_12
   - 228 z1L_11_12 >= -227.001
 EMIB_right_overlap_11_12: EMIB_w_var_11_12 - x_grid_var_12
   + EMIB_x_grid_var_11_12 - 228 z1L_11_12 >= -227.001
 horizontal_right_dist_lb_11_12: - w_var_12 + x_grid_var_11 - x_grid_var_12
   - 228 z1R_11_12 >= -228
 EMIB_left_overlap_right_11_12: w_var_12 + x_grid_var_12
   - EMIB_x_grid_var_11_12 - 228 z1R_11_12 >= -227.001
 EMIB_right_overlap_right_11_12: EMIB_w_var_11_12 - x_grid_var_11
   + EMIB_x_grid_var_11_12 - 228 z1R_11_12 >= -227.001
 vertical_down_dist_lb_11_12: - h_var_11 - y_grid_var_11 + y_grid_var_12
   - 228 z2D_11_12 >= -228
 EMIB_bottom_overlap_down_11_12: h_var_11 + y_grid_var_11
   - EMIB_y_grid_var_11_12 - 228 z2D_11_12 >= -227.001
 EMIB_top_overlap_down_11_12: EMIB_h_var_11_12 - y_grid_var_12
   + EMIB_y_grid_var_11_12 - 228 z2D_11_12 >= -227.001
 vertical_up_dist_lb_11_12: - h_var_12 + y_grid_var_11 - y_grid_var_12
   - 228 z2U_11_12 >= -228
 EMIB_bottom_overlap_up_11_12: h_var_12 + y_grid_var_12
   - EMIB_y_grid_var_11_12 - 228 z2U_11_12 >= -227.001
 EMIB_top_overlap_up_11_12: EMIB_h_var_11_12 - y_grid_var_11
   + EMIB_y_grid_var_11_12 - 228 z2U_11_12 >= -227.001
 shared_yi_ub1_11_12: h_var_11 - EMIB_h_var_11_12 + y_grid_var_11
   - EMIB_y_grid_var_11_12 - 228 z1_11_12 >= -228
 shared_yi_ub2_11_12: y_grid_var_11 - EMIB_y_grid_var_11_12 + 228 z1_11_12
   <= 228
 shared_yj_ub1_11_12: h_var_12 - EMIB_h_var_11_12 + y_grid_var_12
   - EMIB_y_grid_var_11_12 - 228 z1_11_12 >= -228
 shared_yj_ub2_11_12: y_grid_var_12 - EMIB_y_grid_var_11_12 + 228 z1_11_12
   <= 228
 shared_xi_ub1_11_12: w_var_11 - EMIB_w_var_11_12 + x_grid_var_11
   - EMIB_x_grid_var_11_12 - 228 z2_11_12 >= -228
 shared_xi_ub2_11_12: x_grid_var_11 - EMIB_x_grid_var_11_12 + 228 z2_11_12
   <= 228
 shared_xj_ub1_11_12: w_var_12 - EMIB_w_var_11_12 + x_grid_var_12
   - EMIB_x_grid_var_11_12 - 228 z2_11_12 >= -228
 shared_xj_ub2_11_12: x_grid_var_12 - EMIB_x_grid_var_11_12 + 228 z2_11_12
   <= 228
 must_adjacent_sb_12_13: z1_12_13 + z2_12_13 = 1
 horizontal_direction_sb_12_13: - z1_12_13 + z1L_12_13 + z1R_12_13 = 0
 vertical_direction_sb_12_13: - z2_12_13 + z2D_12_13 + z2U_12_13 = 0
 EMIB_rotate_eq_z2_12_13: r_EMIB_12_13 - z2_12_13 = 0
 horizontal_left_dist_lb_12_13: - w_var_12 - x_grid_var_12 + x_grid_var_13
   - 228 z1L_12_13 >= -228
 EMIB_left_overlap_12_13: w_var_12 + x_grid_var_12 - EMIB_x_grid_var_12_13
   - 228 z1L_12_13 >= -227.001
 EMIB_right_overlap_12_13: EMIB_w_var_12_13 - x_grid_var_13
   + EMIB_x_grid_var_12_13 - 228 z1L_12_13 >= -227.001
 horizontal_right_dist_lb_12_13: - w_var_13 + x_grid_var_12 - x_grid_var_13
   - 228 z1R_12_13 >= -228
 EMIB_left_overlap_right_12_13: w_var_13 + x_grid_var_13
   - EMIB_x_grid_var_12_13 - 228 z1R_12_13 >= -227.001
 EMIB_right_overlap_right_12_13: EMIB_w_var_12_13 - x_grid_var_12
   + EMIB_x_grid_var_12_13 - 228 z1R_12_13 >= -227.001
 vertical_down_dist_lb_12_13: - h_var_12 - y_grid_var_12 + y_grid_var_13
   - 228 z2D_12_13 >= -228
 EMIB_bottom_overlap_down_12_13: h_var_12 + y_grid_var_12
   - EMIB_y_grid_var_12_13 - 228 z2D_12_13 >= -227.001
 EMIB_top_overlap_down_12_13: EMIB_h_var_12_13 - y_grid_var_13
   + EMIB_y_grid_var_12_13 - 228 z2D_12_13 >= -227.001
 vertical_up_dist_lb_12_13: - h_var_13 + y_grid_var_12 - y_grid_var_13
   - 228 z2U_12_13 >= -228
 EMIB_bottom_overlap_up_12_13: h_var_13 + y_grid_var_13
   - EMIB_y_grid_var_12_13 - 228 z2U_12_13 >= -227.001
 EMIB_top_overlap_up_12_13: EMIB_h_var_12_13 - y_grid_var_12
   + EMIB_y_grid_var_12_13 - 228 z2U_12_13 >= -227.001
 shared_yi_ub1_12_13: h_var_12 - EMIB_h_var_12_13 + y_grid_var_12
   - EMIB_y_grid_var_12_13 - 228 z1_12_13 >= -228
 shared_yi_ub2_12_13: y_grid_var_12 - EMIB_y_grid_var_12_13 + 228 z1_12_13
   <= 228
 shared_yj_ub1_12_13: h_var_13 - EMIB_h_var_12_13 + y_grid_var_13
   - EMIB_y_grid_var_12_13 - 228 z1_12_13 >= -228
 shared_yj_ub2_12_13: y_grid_var_13 - EMIB_y_grid_var_12_13 + 228 z1_12_13
   <= 228
 shared_xi_ub1_12_13: w_var_12 - EMIB_w_var_12_13 + x_grid_var_12
   - EMIB_x_grid_var_12_13 - 228 z2_12_13 >= -228
 shared_xi_ub2_12_13: x_grid_var_12 - EMIB_x_grid_var_12_13 + 228 z2_12_13
   <= 228
 shared_xj_ub1_12_13: w_var_13 - EMIB_w_var_12_13 + x_grid_var_13
   - EMIB_x_grid_var_12_13 - 228 z2_12_13 >= -228
 shared_xj_ub2_12_13: x_grid_var_13 - EMIB_x_grid_var_12_13 + 228 z2_12_13
   <= 228
 must_adjacent_sb_13_14: z1_13_14 + z2_13_14 = 1
 horizontal_direction_sb_13_14: - z1_13_14 + z1L_13_14 + z1R_13_14 = 0
 vertical_direction_sb_13_14: - z2_13_14 + z2D_13_14 + z2U_13_14 = 0
 EMIB_rotate_eq_z2_13_14: r_EMIB_13_14 - z2_13_14 = 0
 horizontal_left_dist_lb_13_14: - w_var_13 - x_grid_var_13 + x_grid_var_14
   - 228 z1L_13_14 >= -228
 EMIB_left_overlap_13_14: w_var_13 + x_grid_var_13 - EMIB_x_grid_var_13_14
   - 228 z1L_13_14 >= -227.001
 EMIB_right_overlap_13_14: EMIB_w_var_13_14 - x_grid_var_14
   + EMIB_x_grid_var_13_14 - 228 z1L_13_14 >= -227.001
 horizontal_right_dist_lb_13_14: - w_var_14 + x_grid_var_13 - x_grid_var_14
   - 228 z1R_13_14 >= -228
 EMIB_left_overlap_right_13_14: w_var_14 + x_grid_var_14
   - EMIB_x_grid_var_13_14 - 228 z1R_13_14 >= -227.001
 EMIB_right_overlap_right_13_14: EMIB_w_var_13_14 - x_grid_var_13
   + EMIB_x_grid_var_13_14 - 228 z1R_13_14 >= -227.001
 vertical_down_dist_lb_13_14: - h_var_13 - y_grid_var_13 + y_grid_var_14
   - 228 z2D_13_14 >= -228
 EMIB_bottom_overlap_down_13_14: h_var_13 + y_grid_var_13
   - EMIB_y_grid_var_13_14 - 228 z2D_13_14 >= -227.001
 EMIB_top_overlap_down_13_14: EMIB_h_var_13_14 - y_grid_var_14
   + EMIB_y_grid_var_13_14 - 228 z2D_13_14 >= -227.001
 vertical_up_dist_lb_13_14: - h_var_14 + y_grid_var_13 - y_grid_var_14
   - 228 z2U_13_14 >= -228
 EMIB_bottom_overlap_up_13_14: h_var_14 + y_grid_var_14
   - EMIB_y_grid_var_13_14 - 228 z2U_13_14 >= -227.001
 EMIB_top_overlap_up_13_14: EMIB_h_var_13_14 - y_grid_var_13
   + EMIB_y_grid_var_13_14 - 228 z2U_13_14 >= -227.001
 shared_yi_ub1_13_14: h_var_13 - EMIB_h_var_13_14 + y_grid_var_13
   - EMIB_y_grid_var_13_14 - 228 z1_13_14 >= -228
 shared_yi_ub2_13_14: y_grid_var_13 - EMIB_y_grid_var_13_14 + 228 z1_13_14
   <= 228
 shared_yj_ub1_13_14: h_var_14 - EMIB_h_var_13_14 + y_grid_var_14
   - EMIB_y_grid_var_13_14 - 228 z1_13_14 >= -228
 shared_yj_ub2_13_14: y_grid_var_14 - EMIB_y_grid_var_13_14 + 228 z1_13_14
   <= 228
 shared_xi_ub1_13_14: w_var_13 - EMIB_w_var_13_14 + x_grid_var_13
   - EMIB_x_grid_var_13_14 - 228 z2_13_14 >= -228
 shared_xi_ub2_13_14: x_grid_var_13 - EMIB_x_grid_var_13_14 + 228 z2_13_14
   <= 228
 shared_xj_ub1_13_14: w_var_14 - EMIB_w_var_13_14 + x_grid_var_14
   - EMIB_x_grid_var_13_14 - 228 z2_13_14 >= -228
 shared_xj_ub2_13_14: x_grid_var_14 - EMIB_x_grid_var_13_14 + 228 z2_13_14
   <= 228
 non_overlap_any_0_1: p_left_0_1 + p_right_0_1 + p_down_0_1 + p_up_0_1
   >= 1
 non_overlap_left_0_1: w_var_0 + x_grid_var_0 - x_grid_var_1
   + 228 p_left_0_1 <= 228
 non_overlap_left_rev_0_1: - w_var_0 - x_grid_var_0 + x_grid_var_1
   - 228 p_left_0_1 <= 0
 non_overlap_right_0_1: w_var_1 - x_grid_var_0 + x_grid_var_1
   + 228 p_right_0_1 <= 228
 non_overlap_right_rev_0_1: - w_var_1 + x_grid_var_0 - x_grid_var_1
   - 228 p_right_0_1 <= 0
 non_overlap_down_0_1: h_var_0 + y_grid_var_0 - y_grid_var_1
   + 228 p_down_0_1 <= 228
 non_overlap_down_rev_0_1: - h_var_0 - y_grid_var_0 + y_grid_var_1
   - 228 p_down_0_1 <= 0
 non_overlap_up_0_1: h_var_1 - y_grid_var_0 + y_grid_var_1 + 228 p_up_0_1
   <= 228
 non_overlap_up_rev_0_1: - h_var_1 + y_grid_var_0 - y_grid_var_1
   - 228 p_up_0_1 <= 0
 non_overlap_any_0_2: p_left_0_2 + p_right_0_2 + p_down_0_2 + p_up_0_2
   >= 1
 non_overlap_left_0_2: w_var_0 + x_grid_var_0 - x_grid_var_2
   + 228 p_left_0_2 <= 228
 non_overlap_left_rev_0_2: - w_var_0 - x_grid_var_0 + x_grid_var_2
   - 228 p_left_0_2 <= 0
 non_overlap_right_0_2: w_var_2 - x_grid_var_0 + x_grid_var_2
   + 228 p_right_0_2 <= 228
 non_overlap_right_rev_0_2: - w_var_2 + x_grid_var_0 - x_grid_var_2
   - 228 p_right_0_2 <= 0
 non_overlap_down_0_2: h_var_0 + y_grid_var_0 - y_grid_var_2
   + 228 p_down_0_2 <= 228
 non_overlap_down_rev_0_2: - h_var_0 - y_grid_var_0 + y_grid_var_2
   - 228 p_down_0_2 <= 0
 non_overlap_up_0_2: h_var_2 - y_grid_var_0 + y_grid_var_2 + 228 p_up_0_2
   <= 228
 non_overlap_up_rev_0_2: - h_var_2 + y_grid_var_0 - y_grid_var_2
   - 228 p_up_0_2 <= 0
 non_overlap_any_0_3: p_left_0_3 + p_right_0_3 + p_down_0_3 + p_up_0_3
   >= 1
 non_overlap_left_0_3: w_var_0 + x_grid_var_0 - x_grid_var_3
   + 228 p_left_0_3 <= 228
 non_overlap_left_rev_0_3: - w_var_0 - x_grid_var_0 + x_grid_var_3
   - 228 p_left_0_3 <= 0
 non_overlap_right_0_3: w_var_3 - x_grid_var_0 + x_grid_var_3
   + 228 p_right_0_3 <= 228
 non_overlap_right_rev_0_3: - w_var_3 + x_grid_var_0 - x_grid_var_3
   - 228 p_right_0_3 <= 0
 non_overlap_down_0_3: h_var_0 + y_grid_var_0 - y_grid_var_3
   + 228 p_down_0_3 <= 228
 non_overlap_down_rev_0_3: - h_var_0 - y_grid_var_0 + y_grid_var_3
   - 228 p_down_0_3 <= 0
 non_overlap_up_0_3: h_var_3 - y_grid_var_0 + y_grid_var_3 + 228 p_up_0_3
   <= 228
 non_overlap_up_rev_0_3: - h_var_3 + y_grid_var_0 - y_grid_var_3
   - 228 p_up_0_3 <= 0
 non_overlap_any_0_4: p_left_0_4 + p_right_0_4 + p_down_0_4 + p_up_0_4
   >= 1
 non_overlap_left_0_4: w_var_0 + x_grid_var_0 - x_grid_var_4
   + 228 p_left_0_4 <= 228
 non_overlap_left_rev_0_4: - w_var_0 - x_grid_var_0 + x_grid_var_4
   - 228 p_left_0_4 <= 0
 non_overlap_right_0_4: w_var_4 - x_grid_var_0 + x_grid_var_4
   + 228 p_right_0_4 <= 228
 non_overlap_right_rev_0_4: - w_var_4 + x_grid_var_0 - x_grid_var_4
   - 228 p_right_0_4 <= 0
 non_overlap_down_0_4: h_var_0 + y_grid_var_0 - y_grid_var_4
   + 228 p_down_0_4 <= 228
 non_overlap_down_rev_0_4: - h_var_0 - y_grid_var_0 + y_grid_var_4
   - 228 p_down_0_4 <= 0
 non_overlap_up_0_4: h_var_4 - y_grid_var_0 + y_grid_var_4 + 228 p_up_0_4
   <= 228
 non_overlap_up_rev_0_4: - h_var_4 + y_grid_var_0 - y_grid_var_4
   - 228 p_up_0_4 <= 0
 non_overlap_any_0_5: p_left_0_5 + p_right_0_5 + p_down_0_5 + p_up_0_5
   >= 1
 non_overlap_left_0_5: w_var_0 + x_grid_var_0 - x_grid_var_5
   + 228 p_left_0_5 <= 228
 non_overlap_left_rev_0_5: - w_var_0 - x_grid_var_0 + x_grid_var_5
   - 228 p_left_0_5 <= 0
 non_overlap_right_0_5: w_var_5 - x_grid_var_0 + x_grid_var_5
   + 228 p_right_0_5 <= 228
 non_overlap_right_rev_0_5: - w_var_5 + x_grid_var_0 - x_grid_var_5
   - 228 p_right_0_5 <= 0
 non_overlap_down_0_5: h_var_0 + y_grid_var_0 - y_grid_var_5
   + 228 p_down_0_5 <= 228
 non_overlap_down_rev_0_5: - h_var_0 - y_grid_var_0 + y_grid_var_5
   - 228 p_down_0_5 <= 0
 non_overlap_up_0_5: h_var_5 - y_grid_var_0 + y_grid_var_5 + 228 p_up_0_5
   <= 228
 non_overlap_up_rev_0_5: - h_var_5 + y_grid_var_0 - y_grid_var_5
   - 228 p_up_0_5 <= 0
 non_overlap_any_0_6: p_left_0_6 + p_right_0_6 + p_down_0_6 + p_up_0_6
   >= 1
 non_overlap_left_0_6: w_var_0 + x_grid_var_0 - x_grid_var_6
   + 228 p_left_0_6 <= 228
 non_overlap_left_rev_0_6: - w_var_0 - x_grid_var_0 + x_grid_var_6
   - 228 p_left_0_6 <= 0
 non_overlap_right_0_6: w_var_6 - x_grid_var_0 + x_grid_var_6
   + 228 p_right_0_6 <= 228
 non_overlap_right_rev_0_6: - w_var_6 + x_grid_var_0 - x_grid_var_6
   - 228 p_right_0_6 <= 0
 non_overlap_down_0_6: h_var_0 + y_grid_var_0 - y_grid_var_6
   + 228 p_down_0_6 <= 228
 non_overlap_down_rev_0_6: - h_var_0 - y_grid_var_0 + y_grid_var_6
   - 228 p_down_0_6 <= 0
 non_overlap_up_0_6: h_var_6 - y_grid_var_0 + y_grid_var_6 + 228 p_up_0_6
   <= 228
 non_overlap_up_rev_0_6: - h_var_6 + y_grid_var_0 - y_grid_var_6
   - 228 p_up_0_6 <= 0
 non_overlap_any_0_7: p_left_0_7 + p_right_0_7 + p_down_0_7 + p_up_0_7
   >= 1
 non_overlap_left_0_7: w_var_0 + x_grid_var_0 - x_grid_var_7
   + 228 p_left_0_7 <= 228
 non_overlap_left_rev_0_7: - w_var_0 - x_grid_var_0 + x_grid_var_7
   - 228 p_left_0_7 <= 0
 non_overlap_right_0_7: w_var_7 - x_grid_var_0 + x_grid_var_7
   + 228 p_right_0_7 <= 228
 non_overlap_right_rev_0_7: - w_var_7 + x_grid_var_0 - x_grid_var_7
   - 228 p_right_0_7 <= 0
 non_overlap_down_0_7: h_var_0 + y_grid_var_0 - y_grid_var_7
   + 228 p_down_0_7 <= 228
 non_overlap_down_rev_0_7: - h_var_0 - y_grid_var_0 + y_grid_var_7
   - 228 p_down_0_7 <= 0
 non_overlap_up_0_7: h_var_7 - y_grid_var_0 + y_grid_var_7 + 228 p_up_0_7
   <= 228
 non_overlap_up_rev_0_7: - h_var_7 + y_grid_var_0 - y_grid_var_7
   - 228 p_up_0_7 <= 0
 non_overlap_any_0_8: p_left_0_8 + p_right_0_8 + p_down_0_8 + p_up_0_8
   >= 1
 non_overlap_left_0_8: w_var_0 + x_grid_var_0 - x_grid_var_8
   + 228 p_left_0_8 <= 228
 non_overlap_left_rev_0_8: - w_var_0 - x_grid_var_0 + x_grid_var_8
   - 228 p_left_0_8 <= 0
 non_overlap_right_0_8: w_var_8 - x_grid_var_0 + x_grid_var_8
   + 228 p_right_0_8 <= 228
 non_overlap_right_rev_0_8: - w_var_8 + x_grid_var_0 - x_grid_var_8
   - 228 p_right_0_8 <= 0
 non_overlap_down_0_8: h_var_0 + y_grid_var_0 - y_grid_var_8
   + 228 p_down_0_8 <= 228
 non_overlap_down_rev_0_8: - h_var_0 - y_grid_var_0 + y_grid_var_8
   - 228 p_down_0_8 <= 0
 non_overlap_up_0_8: h_var_8 - y_grid_var_0 + y_grid_var_8 + 228 p_up_0_8
   <= 228
 non_overlap_up_rev_0_8: - h_var_8 + y_grid_var_0 - y_grid_var_8
   - 228 p_up_0_8 <= 0
 non_overlap_any_0_9: p_left_0_9 + p_right_0_9 + p_down_0_9 + p_up_0_9
   >= 1
 non_overlap_left_0_9: w_var_0 + x_grid_var_0 - x_grid_var_9
   + 228 p_left_0_9 <= 228
 non_overlap_left_rev_0_9: - w_var_0 - x_grid_var_0 + x_grid_var_9
   - 228 p_left_0_9 <= 0
 non_overlap_right_0_9: w_var_9 - x_grid_var_0 + x_grid_var_9
   + 228 p_right_0_9 <= 228
 non_overlap_right_rev_0_9: - w_var_9 + x_grid_var_0 - x_grid_var_9
   - 228 p_right_0_9 <= 0
 non_overlap_down_0_9: h_var_0 + y_grid_var_0 - y_grid_var_9
   + 228 p_down_0_9 <= 228
 non_overlap_down_rev_0_9: - h_var_0 - y_grid_var_0 + y_grid_var_9
   - 228 p_down_0_9 <= 0
 non_overlap_up_0_9: h_var_9 - y_grid_var_0 + y_grid_var_9 + 228 p_up_0_9
   <= 228
 non_overlap_up_rev_0_9: - h_var_9 + y_grid_var_0 - y_grid_var_9
   - 228 p_up_0_9 <= 0
 non_overlap_any_0_10: p_left_0_10 + p_right_0_10 + p_down_0_10 + p_up_0_10
   >= 1
 non_overlap_left_0_10: w_var_0 + x_grid_var_0 - x_grid_var_10
   + 228 p_left_0_10 <= 228
 non_overlap_left_rev_0_10: - w_var_0 - x_grid_var_0 + x_grid_var_10
   - 228 p_left_0_10 <= 0
 non_overlap_right_0_10: w_var_10 - x_grid_var_0 + x_grid_var_10
   + 228 p_right_0_10 <= 228
 non_overlap_right_rev_0_10: - w_var_10 + x_grid_var_0 - x_grid_var_10
   - 228 p_right_0_10 <= 0
 non_overlap_down_0_10: h_var_0 + y_grid_var_0 - y_grid_var_10
   + 228 p_down_0_10 <= 228
 non_overlap_down_rev_0_10: - h_var_0 - y_grid_var_0 + y_grid_var_10
   - 228 p_down_0_10 <= 0
 non_overlap_up_0_10: h_var_10 - y_grid_var_0 + y_grid_var_10
   + 228 p_up_0_10 <= 228
 non_overlap_up_rev_0_10: - h_var_10 + y_grid_var_0 - y_grid_var_10
   - 228 p_up_0_10 <= 0
 non_overlap_any_0_11: p_left_0_11 + p_right_0_11 + p_down_0_11 + p_up_0_11
   >= 1
 non_overlap_left_0_11: w_var_0 + x_grid_var_0 - x_grid_var_11
   + 228 p_left_0_11 <= 228
 non_overlap_left_rev_0_11: - w_var_0 - x_grid_var_0 + x_grid_var_11
   - 228 p_left_0_11 <= 0
 non_overlap_right_0_11: w_var_11 - x_grid_var_0 + x_grid_var_11
   + 228 p_right_0_11 <= 228
 non_overlap_right_rev_0_11: - w_var_11 + x_grid_var_0 - x_grid_var_11
   - 228 p_right_0_11 <= 0
 non_overlap_down_0_11: h_var_0 + y_grid_var_0 - y_grid_var_11
   + 228 p_down_0_11 <= 228
 non_overlap_down_rev_0_11: - h_var_0 - y_grid_var_0 + y_grid_var_11
   - 228 p_down_0_11 <= 0
 non_overlap_up_0_11: h_var_11 - y_grid_var_0 + y_grid_var_11
   + 228 p_up_0_11 <= 228
 non_overlap_up_rev_0_11: - h_var_11 + y_grid_var_0 - y_grid_var_11
   - 228 p_up_0_11 <= 0
 non_overlap_any_0_12: p_left_0_12 + p_right_0_12 + p_down_0_12 + p_up_0_12
   >= 1
 non_overlap_left_0_12: w_var_0 + x_grid_var_0 - x_grid_var_12
   + 228 p_left_0_12 <= 228
 non_overlap_left_rev_0_12: - w_var_0 - x_grid_var_0 + x_grid_var_12
   - 228 p_left_0_12 <= 0
 non_overlap_right_0_12: w_var_12 - x_grid_var_0 + x_grid_var_12
   + 228 p_right_0_12 <= 228
 non_overlap_right_rev_0_12: - w_var_12 + x_grid_var_0 - x_grid_var_12
   - 228 p_right_0_12 <= 0
 non_overlap_down_0_12: h_var_0 + y_grid_var_0 - y_grid_var_12
   + 228 p_down_0_12 <= 228
 non_overlap_down_rev_0_12: - h_var_0 - y_grid_var_0 + y_grid_var_12
   - 228 p_down_0_12 <= 0
 non_overlap_up_0_12: h_var_12 - y_grid_var_0 + y_grid_var_12
   + 228 p_up_0_12 <= 228
 non_overlap_up_rev_0_12: - h_var_12 + y_grid_var_0 - y_grid_var_12
   - 228 p_up_0_12 <= 0
 non_overlap_any_0_13: p_left_0_13 + p_right_0_13 + p_down_0_13 + p_up_0_13
   >= 1
 non_overlap_left_0_13: w_var_0 + x_grid_var_0 - x_grid_var_13
   + 228 p_left_0_13 <= 228
 non_overlap_left_rev_0_13: - w_var_0 - x_grid_var_0 + x_grid_var_13
   - 228 p_left_0_13 <= 0
 non_overlap_right_0_13: w_var_13 - x_grid_var_0 + x_grid_var_13
   + 228 p_right_0_13 <= 228
 non_overlap_right_rev_0_13: - w_var_13 + x_grid_var_0 - x_grid_var_13
   - 228 p_right_0_13 <= 0
 non_overlap_down_0_13: h_var_0 + y_grid_var_0 - y_grid_var_13
   + 228 p_down_0_13 <= 228
 non_overlap_down_rev_0_13: - h_var_0 - y_grid_var_0 + y_grid_var_13
   - 228 p_down_0_13 <= 0
 non_overlap_up_0_13: h_var_13 - y_grid_var_0 + y_grid_var_13
   + 228 p_up_0_13 <= 228
 non_overlap_up_rev_0_13: - h_var_13 + y_grid_var_0 - y_grid_var_13
   - 228 p_up_0_13 <= 0
 non_overlap_any_0_14: p_left_0_14 + p_right_0_14 + p_down_0_14 + p_up_0_14
   >= 1
 non_overlap_left_0_14: w_var_0 + x_grid_var_0 - x_grid_var_14
   + 228 p_left_0_14 <= 228
 non_overlap_left_rev_0_14: - w_var_0 - x_grid_var_0 + x_grid_var_14
   - 228 p_left_0_14 <= 0
 non_overlap_right_0_14: w_var_14 - x_grid_var_0 + x_grid_var_14
   + 228 p_right_0_14 <= 228
 non_overlap_right_rev_0_14: - w_var_14 + x_grid_var_0 - x_grid_var_14
   - 228 p_right_0_14 <= 0
 non_overlap_down_0_14: h_var_0 + y_grid_var_0 - y_grid_var_14
   + 228 p_down_0_14 <= 228
 non_overlap_down_rev_0_14: - h_var_0 - y_grid_var_0 + y_grid_var_14
   - 228 p_down_0_14 <= 0
 non_overlap_up_0_14: h_var_14 - y_grid_var_0 + y_grid_var_14
   + 228 p_up_0_14 <= 228
 non_overlap_up_rev_0_14: - h_var_14 + y_grid_var_0 - y_grid_var_14
   - 228 p_up_0_14 <= 0
 non_overlap_any_1_2: p_left_1_2 + p_right_1_2 + p_down_1_2 + p_up_1_2
   >= 1
 non_overlap_left_1_2: w_var_1 + x_grid_var_1 - x_grid_var_2
   + 228 p_left_1_2 <= 228
 non_overlap_left_rev_1_2: - w_var_1 - x_grid_var_1 + x_grid_var_2
   - 228 p_left_1_2 <= 0
 non_overlap_right_1_2: w_var_2 - x_grid_var_1 + x_grid_var_2
   + 228 p_right_1_2 <= 228
 non_overlap_right_rev_1_2: - w_var_2 + x_grid_var_1 - x_grid_var_2
   - 228 p_right_1_2 <= 0
 non_overlap_down_1_2: h_var_1 + y_grid_var_1 - y_grid_var_2
   + 228 p_down_1_2 <= 228
 non_overlap_down_rev_1_2: - h_var_1 - y_grid_var_1 + y_grid_var_2
   - 228 p_down_1_2 <= 0
 non_overlap_up_1_2: h_var_2 - y_grid_var_1 + y_grid_var_2 + 228 p_up_1_2
   <= 228
 non_overlap_up_rev_1_2: - h_var_2 + y_grid_var_1 - y_grid_var_2
   - 228 p_up_1_2 <= 0
 non_overlap_any_1_3: p_left_1_3 + p_right_1_3 + p_down_1_3 + p_up_1_3
   >= 1
 non_overlap_left_1_3: w_var_1 + x_grid_var_1 - x_grid_var_3
   + 228 p_left_1_3 <= 228
 non_overlap_left_rev_1_3: - w_var_1 - x_grid_var_1 + x_grid_var_3
   - 228 p_left_1_3 <= 0
 non_overlap_right_1_3: w_var_3 - x_grid_var_1 + x_grid_var_3
   + 228 p_right_1_3 <= 228
 non_overlap_right_rev_1_3: - w_var_3 + x_grid_var_1 - x_grid_var_3
   - 228 p_right_1_3 <= 0
 non_overlap_down_1_3: h_var_1 + y_grid_var_1 - y_grid_var_3
   + 228 p_down_1_3 <= 228
 non_overlap_down_rev_1_3: - h_var_1 - y_grid_var_1 + y_grid_var_3
   - 228 p_down_1_3 <= 0
 non_overlap_up_1_3: h_var_3 - y_grid_var_1 + y_grid_var_3 + 228 p_up_1_3
   <= 228
 non_overlap_up_rev_1_3: - h_var_3 + y_grid_var_1 - y_grid_var_3
   - 228 p_up_1_3 <= 0
 non_overlap_any_1_4: p_left_1_4 + p_right_1_4 + p_down_1_4 + p_up_1_4
   >= 1
 non_overlap_left_1_4: w_var_1 + x_grid_var_1 - x_grid_var_4
   + 228 p_left_1_4 <= 228
 non_overlap_left_rev_1_4: - w_var_1 - x_grid_var_1 + x_grid_var_4
   - 228 p_left_1_4 <= 0
 non_overlap_right_1_4: w_var_4 - x_grid_var_1 + x_grid_var_4
   + 228 p_right_1_4 <= 228
 non_overlap_right_rev_1_4: - w_var_4 + x_grid_var_1 - x_grid_var_4
   - 228 p_right_1_4 <= 0
 non_overlap_down_1_4: h_var_1 + y_grid_var_1 - y_grid_var_4
   + 228 p_down_1_4 <= 228
 non_overlap_down_rev_1_4: - h_var_1 - y_grid_var_1 + y_grid_var_4
   - 228 p_down_1_4 <= 0
 non_overlap_up_1_4: h_var_4 - y_grid_var_1 + y_grid_var_4 + 228 p_up_1_4
   <= 228
 non_overlap_up_rev_1_4: - h_var_4 + y_grid_var_1 - y_grid_var_4
   - 228 p_up_1_4 <= 0
 non_overlap_any_1_5: p_left_1_5 + p_right_1_5 + p_down_1_5 + p_up_1_5
   >= 1
 non_overlap_left_1_5: w_var_1 + x_grid_var_1 - x_grid_var_5
   + 228 p_left_1_5 <= 228
 non_overlap_left_rev_1_5: - w_var_1 - x_grid_var_1 + x_grid_var_5
   - 228 p_left_1_5 <= 0
 non_overlap_right_1_5: w_var_5 - x_grid_var_1 + x_grid_var_5
   + 228 p_right_1_5 <= 228
 non_overlap_right_rev_1_5: - w_var_5 + x_grid_var_1 - x_grid_var_5
   - 228 p_right_1_5 <= 0
 non_overlap_down_1_5: h_var_1 + y_grid_var_1 - y_grid_var_5
   + 228 p_down_1_5 <= 228
 non_overlap_down_rev_1_5: - h_var_1 - y_grid_var_1 + y_grid_var_5
   - 228 p_down_1_5 <= 0
 non_overlap_up_1_5: h_var_5 - y_grid_var_1 + y_grid_var_5 + 228 p_up_1_5
   <= 228
 non_overlap_up_rev_1_5: - h_var_5 + y_grid_var_1 - y_grid_var_5
   - 228 p_up_1_5 <= 0
 non_overlap_any_1_6: p_left_1_6 + p_right_1_6 + p_down_1_6 + p_up_1_6
   >= 1
 non_overlap_left_1_6: w_var_1 + x_grid_var_1 - x_grid_var_6
   + 228 p_left_1_6 <= 228
 non_overlap_left_rev_1_6: - w_var_1 - x_grid_var_1 + x_grid_var_6
   - 228 p_left_1_6 <= 0
 non_overlap_right_1_6: w_var_6 - x_grid_var_1 + x_grid_var_6
   + 228 p_right_1_6 <= 228
 non_overlap_right_rev_1_6: - w_var_6 + x_grid_var_1 - x_grid_var_6
   - 228 p_right_1_6 <= 0
 non_overlap_down_1_6: h_var_1 + y_grid_var_1 - y_grid_var_6
   + 228 p_down_1_6 <= 228
 non_overlap_down_rev_1_6: - h_var_1 - y_grid_var_1 + y_grid_var_6
   - 228 p_down_1_6 <= 0
 non_overlap_up_1_6: h_var_6 - y_grid_var_1 + y_grid_var_6 + 228 p_up_1_6
   <= 228
 non_overlap_up_rev_1_6: - h_var_6 + y_grid_var_1 - y_grid_var_6
   - 228 p_up_1_6 <= 0
 non_overlap_any_1_7: p_left_1_7 + p_right_1_7 + p_down_1_7 + p_up_1_7
   >= 1
 non_overlap_left_1_7: w_var_1 + x_grid_var_1 - x_grid_var_7
   + 228 p_left_1_7 <= 228
 non_overlap_left_rev_1_7: - w_var_1 - x_grid_var_1 + x_grid_var_7
   - 228 p_left_1_7 <= 0
 non_overlap_right_1_7: w_var_7 - x_grid_var_1 + x_grid_var_7
   + 228 p_right_1_7 <= 228
 non_overlap_right_rev_1_7: - w_var_7 + x_grid_var_1 - x_grid_var_7
   - 228 p_right_1_7 <= 0
 non_overlap_down_1_7: h_var_1 + y_grid_var_1 - y_grid_var_7
   + 228 p_down_1_7 <= 228
 non_overlap_down_rev_1_7: - h_var_1 - y_grid_var_1 + y_grid_var_7
   - 228 p_down_1_7 <= 0
 non_overlap_up_1_7: h_var_7 - y_grid_var_1 + y_grid_var_7 + 228 p_up_1_7
   <= 228
 non_overlap_up_rev_1_7: - h_var_7 + y_grid_var_1 - y_grid_var_7
   - 228 p_up_1_7 <= 0
 non_overlap_any_1_8: p_left_1_8 + p_right_1_8 + p_down_1_8 + p_up_1_8
   >= 1
 non_overlap_left_1_8: w_var_1 + x_grid_var_1 - x_grid_var_8
   + 228 p_left_1_8 <= 228
 non_overlap_left_rev_1_8: - w_var_1 - x_grid_var_1 + x_grid_var_8
   - 228 p_left_1_8 <= 0
 non_overlap_right_1_8: w_var_8 - x_grid_var_1 + x_grid_var_8
   + 228 p_right_1_8 <= 228
 non_overlap_right_rev_1_8: - w_var_8 + x_grid_var_1 - x_grid_var_8
   - 228 p_right_1_8 <= 0
 non_overlap_down_1_8: h_var_1 + y_grid_var_1 - y_grid_var_8
   + 228 p_down_1_8 <= 228
 non_overlap_down_rev_1_8: - h_var_1 - y_grid_var_1 + y_grid_var_8
   - 228 p_down_1_8 <= 0
 non_overlap_up_1_8: h_var_8 - y_grid_var_1 + y_grid_var_8 + 228 p_up_1_8
   <= 228
 non_overlap_up_rev_1_8: - h_var_8 + y_grid_var_1 - y_grid_var_8
   - 228 p_up_1_8 <= 0
 non_overlap_any_1_9: p_left_1_9 + p_right_1_9 + p_down_1_9 + p_up_1_9
   >= 1
 non_overlap_left_1_9: w_var_1 + x_grid_var_1 - x_grid_var_9
   + 228 p_left_1_9 <= 228
 non_overlap_left_rev_1_9: - w_var_1 - x_grid_var_1 + x_grid_var_9
   - 228 p_left_1_9 <= 0
 non_overlap_right_1_9: w_var_9 - x_grid_var_1 + x_grid_var_9
   + 228 p_right_1_9 <= 228
 non_overlap_right_rev_1_9: - w_var_9 + x_grid_var_1 - x_grid_var_9
   - 228 p_right_1_9 <= 0
 non_overlap_down_1_9: h_var_1 + y_grid_var_1 - y_grid_var_9
   + 228 p_down_1_9 <= 228
 non_overlap_down_rev_1_9: - h_var_1 - y_grid_var_1 + y_grid_var_9
   - 228 p_down_1_9 <= 0
 non_overlap_up_1_9: h_var_9 - y_grid_var_1 + y_grid_var_9 + 228 p_up_1_9
   <= 228
 non_overlap_up_rev_1_9: - h_var_9 + y_grid_var_1 - y_grid_var_9
   - 228 p_up_1_9 <= 0
 non_overlap_any_1_10: p_left_1_10 + p_right_1_10 + p_down_1_10 + p_up_1_10
   >= 1
 non_overlap_left_1_10: w_var_1 + x_grid_var_1 - x_grid_var_10
   + 228 p_left_1_10 <= 228
 non_overlap_left_rev_1_10: - w_var_1 - x_grid_var_1 + x_grid_var_10
   - 228 p_left_1_10 <= 0
 non_overlap_right_1_10: w_var_10 - x_grid_var_1 + x_grid_var_10
   + 228 p_right_1_10 <= 228
 non_overlap_right_rev_1_10: - w_var_10 + x_grid_var_1 - x_grid_var_10
   - 228 p_right_1_10 <= 0
 non_overlap_down_1_10: h_var_1 + y_grid_var_1 - y_grid_var_10
   + 228 p_down_1_10 <= 228
 non_overlap_down_rev_1_10: - h_var_1 - y_grid_var_1 + y_grid_var_10
   - 228 p_down_1_10 <= 0
 non_overlap_up_1_10: h_var_10 - y_grid_var_1 + y_grid_var_10
   + 228 p_up_1_10 <= 228
 non_overlap_up_rev_1_10: - h_var_10 + y_grid_var_1 - y_grid_var_10
   - 228 p_up_1_10 <= 0
 non_overlap_any_1_11: p_left_1_11 + p_right_1_11 + p_down_1_11 + p_up_1_11
   >= 1
 non_overlap_left_1_11: w_var_1 + x_grid_var_1 - x_grid_var_11
   + 228 p_left_1_11 <= 228
 non_overlap_left_rev_1_11: - w_var_1 - x_grid_var_1 + x_grid_var_11
   - 228 p_left_1_11 <= 0
 non_overlap_right_1_11: w_var_11 - x_grid_var_1 + x_grid_var_11
   + 228 p_right_1_11 <= 228
 non_overlap_right_rev_1_11: - w_var_11 + x_grid_var_1 - x_grid_var_11
   - 228 p_right_1_11 <= 0
 non_overlap_down_1_11: h_var_1 + y_grid_var_1 - y_grid_var_11
   + 228 p_down_1_11 <= 228
 non_overlap_down_rev_1_11: - h_var_1 - y_grid_var_1 + y_grid_var_11
   - 228 p_down_1_11 <= 0
 non_overlap_up_1_11: h_var_11 - y_grid_var_1 + y_grid_var_11
   + 228 p_up_1_11 <= 228
 non_overlap_up_rev_1_11: - h_var_11 + y_grid_var_1 - y_grid_var_11
   - 228 p_up_1_11 <= 0
 non_overlap_any_1_12: p_left_1_12 + p_right_1_12 + p_down_1_12 + p_up_1_12
   >= 1
 non_overlap_left_1_12: w_var_1 + x_grid_var_1 - x_grid_var_12
   + 228 p_left_1_12 <= 228
 non_overlap_left_rev_1_12: - w_var_1 - x_grid_var_1 + x_grid_var_12
   - 228 p_left_1_12 <= 0
 non_overlap_right_1_12: w_var_12 - x_grid_var_1 + x_grid_var_12
   + 228 p_right_1_12 <= 228
 non_overlap_right_rev_1_12: - w_var_12 + x_grid_var_1 - x_grid_var_12
   - 228 p_right_1_12 <= 0
 non_overlap_down_1_12: h_var_1 + y_grid_var_1 - y_grid_var_12
   + 228 p_down_1_12 <= 228
 non_overlap_down_rev_1_12: - h_var_1 - y_grid_var_1 + y_grid_var_12
   - 228 p_down_1_12 <= 0
 non_overlap_up_1_12: h_var_12 - y_grid_var_1 + y_grid_var_12
   + 228 p_up_1_12 <= 228
 non_overlap_up_rev_1_12: - h_var_12 + y_grid_var_1 - y_grid_var_12
   - 228 p_up_1_12 <= 0
 non_overlap_any_1_13: p_left_1_13 + p_right_1_13 + p_down_1_13 + p_up_1_13
   >= 1
 non_overlap_left_1_13: w_var_1 + x_grid_var_1 - x_grid_var_13
   + 228 p_left_1_13 <= 228
 non_overlap_left_rev_1_13: - w_var_1 - x_grid_var_1 + x_grid_var_13
   - 228 p_left_1_13 <= 0
 non_overlap_right_1_13: w_var_13 - x_grid_var_1 + x_grid_var_13
   + 228 p_right_1_13 <= 228
 non_overlap_right_rev_1_13: - w_var_13 + x_grid_var_1 - x_grid_var_13
   - 228 p_right_1_13 <= 0
 non_overlap_down_1_13: h_var_1 + y_grid_var_1 - y_grid_var_13
   + 228 p_down_1_13 <= 228
 non_overlap_down_rev_1_13: - h_var_1 - y_grid_var_1 + y_grid_var_13
   - 228 p_down_1_13 <= 0
 non_overlap_up_1_13: h_var_13 - y_grid_var_1 + y_grid_var_13
   + 228 p_up_1_13 <= 228
 non_overlap_up_rev_1_13: - h_var_13 + y_grid_var_1 - y_grid_var_13
   - 228 p_up_1_13 <= 0
 non_overlap_any_1_14: p_left_1_14 + p_right_1_14 + p_down_1_14 + p_up_1_14
   >= 1
 non_overlap_left_1_14: w_var_1 + x_grid_var_1 - x_grid_var_14
   + 228 p_left_1_14 <= 228
 non_overlap_left_rev_1_14: - w_var_1 - x_grid_var_1 + x_grid_var_14
   - 228 p_left_1_14 <= 0
 non_overlap_right_1_14: w_var_14 - x_grid_var_1 + x_grid_var_14
   + 228 p_right_1_14 <= 228
 non_overlap_right_rev_1_14: - w_var_14 + x_grid_var_1 - x_grid_var_14
   - 228 p_right_1_14 <= 0
 non_overlap_down_1_14: h_var_1 + y_grid_var_1 - y_grid_var_14
   + 228 p_down_1_14 <= 228
 non_overlap_down_rev_1_14: - h_var_1 - y_grid_var_1 + y_grid_var_14
   - 228 p_down_1_14 <= 0
 non_overlap_up_1_14: h_var_14 - y_grid_var_1 + y_grid_var_14
   + 228 p_up_1_14 <= 228
 non_overlap_up_rev_1_14: - h_var_14 + y_grid_var_1 - y_grid_var_14
   - 228 p_up_1_14 <= 0
 non_overlap_any_2_3: p_left_2_3 + p_right_2_3 + p_down_2_3 + p_up_2_3
   >= 1
 non_overlap_left_2_3: w_var_2 + x_grid_var_2 - x_grid_var_3
   + 228 p_left_2_3 <= 228
 non_overlap_left_rev_2_3: - w_var_2 - x_grid_var_2 + x_grid_var_3
   - 228 p_left_2_3 <= 0
 non_overlap_right_2_3: w_var_3 - x_grid_var_2 + x_grid_var_3
   + 228 p_right_2_3 <= 228
 non_overlap_right_rev_2_3: - w_var_3 + x_grid_var_2 - x_grid_var_3
   - 228 p_right_2_3 <= 0
 non_overlap_down_2_3: h_var_2 + y_grid_var_2 - y_grid_var_3
   + 228 p_down_2_3 <= 228
 non_overlap_down_rev_2_3: - h_var_2 - y_grid_var_2 + y_grid_var_3
   - 228 p_down_2_3 <= 0
 non_overlap_up_2_3: h_var_3 - y_grid_var_2 + y_grid_var_3 + 228 p_up_2_3
   <= 228
 non_overlap_up_rev_2_3: - h_var_3 + y_grid_var_2 - y_grid_var_3
   - 228 p_up_2_3 <= 0
 non_overlap_any_2_4: p_left_2_4 + p_right_2_4 + p_down_2_4 + p_up_2_4
   >= 1
 non_overlap_left_2_4: w_var_2 + x_grid_var_2 - x_grid_var_4
   + 228 p_left_2_4 <= 228
 non_overlap_left_rev_2_4: - w_var_2 - x_grid_var_2 + x_grid_var_4
   - 228 p_left_2_4 <= 0
 non_overlap_right_2_4: w_var_4 - x_grid_var_2 + x_grid_var_4
   + 228 p_right_2_4 <= 228
 non_overlap_right_rev_2_4: - w_var_4 + x_grid_var_2 - x_grid_var_4
   - 228 p_right_2_4 <= 0
 non_overlap_down_2_4: h_var_2 + y_grid_var_2 - y_grid_var_4
   + 228 p_down_2_4 <= 228
 non_overlap_down_rev_2_4: - h_var_2 - y_grid_var_2 + y_grid_var_4
   - 228 p_down_2_4 <= 0
 non_overlap_up_2_4: h_var_4 - y_grid_var_2 + y_grid_var_4 + 228 p_up_2_4
   <= 228
 non_overlap_up_rev_2_4: - h_var_4 + y_grid_var_2 - y_grid_var_4
   - 228 p_up_2_4 <= 0
 non_overlap_any_2_5: p_left_2_5 + p_right_2_5 + p_down_2_5 + p_up_2_5
   >= 1
 non_overlap_left_2_5: w_var_2 + x_grid_var_2 - x_grid_var_5
   + 228 p_left_2_5 <= 228
 non_overlap_left_rev_2_5: - w_var_2 - x_grid_var_2 + x_grid_var_5
   - 228 p_left_2_5 <= 0
 non_overlap_right_2_5: w_var_5 - x_grid_var_2 + x_grid_var_5
   + 228 p_right_2_5 <= 228
 non_overlap_right_rev_2_5: - w_var_5 + x_grid_var_2 - x_grid_var_5
   - 228 p_right_2_5 <= 0
 non_overlap_down_2_5: h_var_2 + y_grid_var_2 - y_grid_var_5
   + 228 p_down_2_5 <= 228
 non_overlap_down_rev_2_5: - h_var_2 - y_grid_var_2 + y_grid_var_5
   - 228 p_down_2_5 <= 0
 non_overlap_up_2_5: h_var_5 - y_grid_var_2 + y_grid_var_5 + 228 p_up_2_5
   <= 228
 non_overlap_up_rev_2_5: - h_var_5 + y_grid_var_2 - y_grid_var_5
   - 228 p_up_2_5 <= 0
 non_overlap_any_2_6: p_left_2_6 + p_right_2_6 + p_down_2_6 + p_up_2_6
   >= 1
 non_overlap_left_2_6: w_var_2 + x_grid_var_2 - x_grid_var_6
   + 228 p_left_2_6 <= 228
 non_overlap_left_rev_2_6: - w_var_2 - x_grid_var_2 + x_grid_var_6
   - 228 p_left_2_6 <= 0
 non_overlap_right_2_6: w_var_6 - x_grid_var_2 + x_grid_var_6
   + 228 p_right_2_6 <= 228
 non_overlap_right_rev_2_6: - w_var_6 + x_grid_var_2 - x_grid_var_6
   - 228 p_right_2_6 <= 0
 non_overlap_down_2_6: h_var_2 + y_grid_var_2 - y_grid_var_6
   + 228 p_down_2_6 <= 228
 non_overlap_down_rev_2_6: - h_var_2 - y_grid_var_2 + y_grid_var_6
   - 228 p_down_2_6 <= 0
 non_overlap_up_2_6: h_var_6 - y_grid_var_2 + y_grid_var_6 + 228 p_up_2_6
   <= 228
 non_overlap_up_rev_2_6: - h_var_6 + y_grid_var_2 - y_grid_var_6
   - 228 p_up_2_6 <= 0
 non_overlap_any_2_7: p_left_2_7 + p_right_2_7 + p_down_2_7 + p_up_2_7
   >= 1
 non_overlap_left_2_7: w_var_2 + x_grid_var_2 - x_grid_var_7
   + 228 p_left_2_7 <= 228
 non_overlap_left_rev_2_7: - w_var_2 - x_grid_var_2 + x_grid_var_7
   - 228 p_left_2_7 <= 0
 non_overlap_right_2_7: w_var_7 - x_grid_var_2 + x_grid_var_7
   + 228 p_right_2_7 <= 228
 non_overlap_right_rev_2_7: - w_var_7 + x_grid_var_2 - x_grid_var_7
   - 228 p_right_2_7 <= 0
 non_overlap_down_2_7: h_var_2 + y_grid_var_2 - y_grid_var_7
   + 228 p_down_2_7 <= 228
 non_overlap_down_rev_2_7: - h_var_2 - y_grid_var_2 + y_grid_var_7
   - 228 p_down_2_7 <= 0
 non_overlap_up_2_7: h_var_7 - y_grid_var_2 + y_grid_var_7 + 228 p_up_2_7
   <= 228
 non_overlap_up_rev_2_7: - h_var_7 + y_grid_var_2 - y_grid_var_7
   - 228 p_up_2_7 <= 0
 non_overlap_any_2_8: p_left_2_8 + p_right_2_8 + p_down_2_8 + p_up_2_8
   >= 1
 non_overlap_left_2_8: w_var_2 + x_grid_var_2 - x_grid_var_8
   + 228 p_left_2_8 <= 228
 non_overlap_left_rev_2_8: - w_var_2 - x_grid_var_2 + x_grid_var_8
   - 228 p_left_2_8 <= 0
 non_overlap_right_2_8: w_var_8 - x_grid_var_2 + x_grid_var_8
   + 228 p_right_2_8 <= 228
 non_overlap_right_rev_2_8: - w_var_8 + x_grid_var_2 - x_grid_var_8
   - 228 p_right_2_8 <= 0
 non_overlap_down_2_8: h_var_2 + y_grid_var_2 - y_grid_var_8
   + 228 p_down_2_8 <= 228
 non_overlap_down_rev_2_8: - h_var_2 - y_grid_var_2 + y_grid_var_8
   - 228 p_down_2_8 <= 0
 non_overlap_up_2_8: h_var_8 - y_grid_var_2 + y_grid_var_8 + 228 p_up_2_8
   <= 228
 non_overlap_up_rev_2_8: - h_var_8 + y_grid_var_2 - y_grid_var_8
   - 228 p_up_2_8 <= 0
 non_overlap_any_2_9: p_left_2_9 + p_right_2_9 + p_down_2_9 + p_up_2_9
   >= 1
 non_overlap_left_2_9: w_var_2 + x_grid_var_2 - x_grid_var_9
   + 228 p_left_2_9 <= 228
 non_overlap_left_rev_2_9: - w_var_2 - x_grid_var_2 + x_grid_var_9
   - 228 p_left_2_9 <= 0
 non_overlap_right_2_9: w_var_9 - x_grid_var_2 + x_grid_var_9
   + 228 p_right_2_9 <= 228
 non_overlap_right_rev_2_9: - w_var_9 + x_grid_var_2 - x_grid_var_9
   - 228 p_right_2_9 <= 0
 non_overlap_down_2_9: h_var_2 + y_grid_var_2 - y_grid_var_9
   + 228 p_down_2_9 <= 228
 non_overlap_down_rev_2_9: - h_var_2 - y_grid_var_2 + y_grid_var_9
   - 228 p_down_2_9 <= 0
 non_overlap_up_2_9: h_var_9 - y_grid_var_2 + y_grid_var_9 + 228 p_up_2_9
   <= 228
 non_overlap_up_rev_2_9: - h_var_9 + y_grid_var_2 - y_grid_var_9
   - 228 p_up_2_9 <= 0
 non_overlap_any_2_10: p_left_2_10 + p_right_2_10 + p_down_2_10 + p_up_2_10
   >= 1
 non_overlap_left_2_10: w_var_2 + x_grid_var_2 - x_grid_var_10
   + 228 p_left_2_10 <= 228
 non_overlap_left_rev_2_10: - w_var_2 - x_grid_var_2 + x_grid_var_10
   - 228 p_left_2_10 <= 0
 non_overlap_right_2_10: w_var_10 - x_grid_var_2 + x_grid_var_10
   + 228 p_right_2_10 <= 228
 non_overlap_right_rev_2_10: - w_var_10 + x_grid_var_2 - x_grid_var_10
   - 228 p_right_2_10 <= 0
 non_overlap_down_2_10: h_var_2 + y_grid_var_2 - y_grid_var_10
   + 228 p_down_2_10 <= 228
 non_overlap_down_rev_2_10: - h_var_2 - y_grid_var_2 + y_grid_var_10
   - 228 p_down_2_10 <= 0
 non_overlap_up_2_10: h_var_10 - y_grid_var_2 + y_grid_var_10
   + 228 p_up_2_10 <= 228
 non_overlap_up_rev_2_10: - h_var_10 + y_grid_var_2 - y_grid_var_10
   - 228 p_up_2_10 <= 0
 non_overlap_any_2_11: p_left_2_11 + p_right_2_11 + p_down_2_11 + p_up_2_11
   >= 1
 non_overlap_left_2_11: w_var_2 + x_grid_var_2 - x_grid_var_11
   + 228 p_left_2_11 <= 228
 non_overlap_left_rev_2_11: - w_var_2 - x_grid_var_2 + x_grid_var_11
   - 228 p_left_2_11 <= 0
 non_overlap_right_2_11: w_var_11 - x_grid_var_2 + x_grid_var_11
   + 228 p_right_2_11 <= 228
 non_overlap_right_rev_2_11: - w_var_11 + x_grid_var_2 - x_grid_var_11
   - 228 p_right_2_11 <= 0
 non_overlap_down_2_11: h_var_2 + y_grid_var_2 - y_grid_var_11
   + 228 p_down_2_11 <= 228
 non_overlap_down_rev_2_11: - h_var_2 - y_grid_var_2 + y_grid_var_11
   - 228 p_down_2_11 <= 0
 non_overlap_up_2_11: h_var_11 - y_grid_var_2 + y_grid_var_11
   + 228 p_up_2_11 <= 228
 non_overlap_up_rev_2_11: - h_var_11 + y_grid_var_2 - y_grid_var_11
   - 228 p_up_2_11 <= 0
 non_overlap_any_2_12: p_left_2_12 + p_right_2_12 + p_down_2_12 + p_up_2_12
   >= 1
 non_overlap_left_2_12: w_var_2 + x_grid_var_2 - x_grid_var_12
   + 228 p_left_2_12 <= 228
 non_overlap_left_rev_2_12: - w_var_2 - x_grid_var_2 + x_grid_var_12
   - 228 p_left_2_12 <= 0
 non_overlap_right_2_12: w_var_12 - x_grid_var_2 + x_grid_var_12
   + 228 p_right_2_12 <= 228
 non_overlap_right_rev_2_12: - w_var_12 + x_grid_var_2 - x_grid_var_12
   - 228 p_right_2_12 <= 0
 non_overlap_down_2_12: h_var_2 + y_grid_var_2 - y_grid_var_12
   + 228 p_down_2_12 <= 228
 non_overlap_down_rev_2_12: - h_var_2 - y_grid_var_2 + y_grid_var_12
   - 228 p_down_2_12 <= 0
 non_overlap_up_2_12: h_var_12 - y_grid_var_2 + y_grid_var_12
   + 228 p_up_2_12 <= 228
 non_overlap_up_rev_2_12: - h_var_12 + y_grid_var_2 - y_grid_var_12
   - 228 p_up_2_12 <= 0
 non_overlap_any_2_13: p_left_2_13 + p_right_2_13 + p_down_2_13 + p_up_2_13
   >= 1
 non_overlap_left_2_13: w_var_2 + x_grid_var_2 - x_grid_var_13
   + 228 p_left_2_13 <= 228
 non_overlap_left_rev_2_13: - w_var_2 - x_grid_var_2 + x_grid_var_13
   - 228 p_left_2_13 <= 0
 non_overlap_right_2_13: w_var_13 - x_grid_var_2 + x_grid_var_13
   + 228 p_right_2_13 <= 228
 non_overlap_right_rev_2_13: - w_var_13 + x_grid_var_2 - x_grid_var_13
   - 228 p_right_2_13 <= 0
 non_overlap_down_2_13: h_var_2 + y_grid_var_2 - y_grid_var_13
   + 228 p_down_2_13 <= 228
 non_overlap_down_rev_2_13: - h_var_2 - y_grid_var_2 + y_grid_var_13
   - 228 p_down_2_13 <= 0
 non_overlap_up_2_13: h_var_13 - y_grid_var_2 + y_grid_var_13
   + 228 p_up_2_13 <= 228
 non_overlap_up_rev_2_13: - h_var_13 + y_grid_var_2 - y_grid_var_13
   - 228 p_up_2_13 <= 0
 non_overlap_any_2_14: p_left_2_14 + p_right_2_14 + p_down_2_14 + p_up_2_14
   >= 1
 non_overlap_left_2_14: w_var_2 + x_grid_var_2 - x_grid_var_14
   + 228 p_left_2_14 <= 228
 non_overlap_left_rev_2_14: - w_var_2 - x_grid_var_2 + x_grid_var_14
   - 228 p_left_2_14 <= 0
 non_overlap_right_2_14: w_var_14 - x_grid_var_2 + x_grid_var_14
   + 228 p_right_2_14 <= 228
 non_overlap_right_rev_2_14: - w_var_14 + x_grid_var_2 - x_grid_var_14
   - 228 p_right_2_14 <= 0
 non_overlap_down_2_14: h_var_2 + y_grid_var_2 - y_grid_var_14
   + 228 p_down_2_14 <= 228
 non_overlap_down_rev_2_14: - h_var_2 - y_grid_var_2 + y_grid_var_14
   - 228 p_down_2_14 <= 0
 non_overlap_up_2_14: h_var_14 - y_grid_var_2 + y_grid_var_14
   + 228 p_up_2_14 <= 228
 non_overlap_up_rev_2_14: - h_var_14 + y_grid_var_2 - y_grid_var_14
   - 228 p_up_2_14 <= 0
 non_overlap_any_3_4: p_left_3_4 + p_right_3_4 + p_down_3_4 + p_up_3_4
   >= 1
 non_overlap_left_3_4: w_var_3 + x_grid_var_3 - x_grid_var_4
   + 228 p_left_3_4 <= 228
 non_overlap_left_rev_3_4: - w_var_3 - x_grid_var_3 + x_grid_var_4
   - 228 p_left_3_4 <= 0
 non_overlap_right_3_4: w_var_4 - x_grid_var_3 + x_grid_var_4
   + 228 p_right_3_4 <= 228
 non_overlap_right_rev_3_4: - w_var_4 + x_grid_var_3 - x_grid_var_4
   - 228 p_right_3_4 <= 0
 non_overlap_down_3_4: h_var_3 + y_grid_var_3 - y_grid_var_4
   + 228 p_down_3_4 <= 228
 non_overlap_down_rev_3_4: - h_var_3 - y_grid_var_3 + y_grid_var_4
   - 228 p_down_3_4 <= 0
 non_overlap_up_3_4: h_var_4 - y_grid_var_3 + y_grid_var_4 + 228 p_up_3_4
   <= 228
 non_overlap_up_rev_3_4: - h_var_4 + y_grid_var_3 - y_grid_var_4
   - 228 p_up_3_4 <= 0
 non_overlap_any_3_5: p_left_3_5 + p_right_3_5 + p_down_3_5 + p_up_3_5
   >= 1
 non_overlap_left_3_5: w_var_3 + x_grid_var_3 - x_grid_var_5
   + 228 p_left_3_5 <= 228
 non_overlap_left_rev_3_5: - w_var_3 - x_grid_var_3 + x_grid_var_5
   - 228 p_left_3_5 <= 0
 non_overlap_right_3_5: w_var_5 - x_grid_var_3 + x_grid_var_5
   + 228 p_right_3_5 <= 228
 non_overlap_right_rev_3_5: - w_var_5 + x_grid_var_3 - x_grid_var_5
   - 228 p_right_3_5 <= 0
 non_overlap_down_3_5: h_var_3 + y_grid_var_3 - y_grid_var_5
   + 228 p_down_3_5 <= 228
 non_overlap_down_rev_3_5: - h_var_3 - y_grid_var_3 + y_grid_var_5
   - 228 p_down_3_5 <= 0
 non_overlap_up_3_5: h_var_5 - y_grid_var_3 + y_grid_var_5 + 228 p_up_3_5
   <= 228
 non_overlap_up_rev_3_5: - h_var_5 + y_grid_var_3 - y_grid_var_5
   - 228 p_up_3_5 <= 0
 non_overlap_any_3_6: p_left_3_6 + p_right_3_6 + p_down_3_6 + p_up_3_6
   >= 1
 non_overlap_left_3_6: w_var_3 + x_grid_var_3 - x_grid_var_6
   + 228 p_left_3_6 <= 228
 non_overlap_left_rev_3_6: - w_var_3 - x_grid_var_3 + x_grid_var_6
   - 228 p_left_3_6 <= 0
 non_overlap_right_3_6: w_var_6 - x_grid_var_3 + x_grid_var_6
   + 228 p_right_3_6 <= 228
 non_overlap_right_rev_3_6: - w_var_6 + x_grid_var_3 - x_grid_var_6
   - 228 p_right_3_6 <= 0
 non_overlap_down_3_6: h_var_3 + y_grid_var_3 - y_grid_var_6
   + 228 p_down_3_6 <= 228
 non_overlap_down_rev_3_6: - h_var_3 - y_grid_var_3 + y_grid_var_6
   - 228 p_down_3_6 <= 0
 non_overlap_up_3_6: h_var_6 - y_grid_var_3 + y_grid_var_6 + 228 p_up_3_6
   <= 228
 non_overlap_up_rev_3_6: - h_var_6 + y_grid_var_3 - y_grid_var_6
   - 228 p_up_3_6 <= 0
 non_overlap_any_3_7: p_left_3_7 + p_right_3_7 + p_down_3_7 + p_up_3_7
   >= 1
 non_overlap_left_3_7: w_var_3 + x_grid_var_3 - x_grid_var_7
   + 228 p_left_3_7 <= 228
 non_overlap_left_rev_3_7: - w_var_3 - x_grid_var_3 + x_grid_var_7
   - 228 p_left_3_7 <= 0
 non_overlap_right_3_7: w_var_7 - x_grid_var_3 + x_grid_var_7
   + 228 p_right_3_7 <= 228
 non_overlap_right_rev_3_7: - w_var_7 + x_grid_var_3 - x_grid_var_7
   - 228 p_right_3_7 <= 0
 non_overlap_down_3_7: h_var_3 + y_grid_var_3 - y_grid_var_7
   + 228 p_down_3_7 <= 228
 non_overlap_down_rev_3_7: - h_var_3 - y_grid_var_3 + y_grid_var_7
   - 228 p_down_3_7 <= 0
 non_overlap_up_3_7: h_var_7 - y_grid_var_3 + y_grid_var_7 + 228 p_up_3_7
   <= 228
 non_overlap_up_rev_3_7: - h_var_7 + y_grid_var_3 - y_grid_var_7
   - 228 p_up_3_7 <= 0
 non_overlap_any_3_8: p_left_3_8 + p_right_3_8 + p_down_3_8 + p_up_3_8
   >= 1
 non_overlap_left_3_8: w_var_3 + x_grid_var_3 - x_grid_var_8
   + 228 p_left_3_8 <= 228
 non_overlap_left_rev_3_8: - w_var_3 - x_grid_var_3 + x_grid_var_8
   - 228 p_left_3_8 <= 0
 non_overlap_right_3_8: w_var_8 - x_grid_var_3 + x_grid_var_8
   + 228 p_right_3_8 <= 228
 non_overlap_right_rev_3_8: - w_var_8 + x_grid_var_3 - x_grid_var_8
   - 228 p_right_3_8 <= 0
 non_overlap_down_3_8: h_var_3 + y_grid_var_3 - y_grid_var_8
   + 228 p_down_3_8 <= 228
 non_overlap_down_rev_3_8: - h_var_3 - y_grid_var_3 + y_grid_var_8
   - 228 p_down_3_8 <= 0
 non_overlap_up_3_8: h_var_8 - y_grid_var_3 + y_grid_var_8 + 228 p_up_3_8
   <= 228
 non_overlap_up_rev_3_8: - h_var_8 + y_grid_var_3 - y_grid_var_8
   - 228 p_up_3_8 <= 0
 non_overlap_any_3_9: p_left_3_9 + p_right_3_9 + p_down_3_9 + p_up_3_9
   >= 1
 non_overlap_left_3_9: w_var_3 + x_grid_var_3 - x_grid_var_9
   + 228 p_left_3_9 <= 228
 non_overlap_left_rev_3_9: - w_var_3 - x_grid_var_3 + x_grid_var_9
   - 228 p_left_3_9 <= 0
 non_overlap_right_3_9: w_var_9 - x_grid_var_3 + x_grid_var_9
   + 228 p_right_3_9 <= 228
 non_overlap_right_rev_3_9: - w_var_9 + x_grid_var_3 - x_grid_var_9
   - 228 p_right_3_9 <= 0
 non_overlap_down_3_9: h_var_3 + y_grid_var_3 - y_grid_var_9
   + 228 p_down_3_9 <= 228
 non_overlap_down_rev_3_9: - h_var_3 - y_grid_var_3 + y_grid_var_9
   - 228 p_down_3_9 <= 0
 non_overlap_up_3_9: h_var_9 - y_grid_var_3 + y_grid_var_9 + 228 p_up_3_9
   <= 228
 non_overlap_up_rev_3_9: - h_var_9 + y_grid_var_3 - y_grid_var_9
   - 228 p_up_3_9 <= 0
 non_overlap_any_3_10: p_left_3_10 + p_right_3_10 + p_down_3_10 + p_up_3_10
   >= 1
 non_overlap_left_3_10: w_var_3 + x_grid_var_3 - x_grid_var_10
   + 228 p_left_3_10 <= 228
 non_overlap_left_rev_3_10: - w_var_3 - x_grid_var_3 + x_grid_var_10
   - 228 p_left_3_10 <= 0
 non_overlap_right_3_10: w_var_10 - x_grid_var_3 + x_grid_var_10
   + 228 p_right_3_10 <= 228
 non_overlap_right_rev_3_10: - w_var_10 + x_grid_var_3 - x_grid_var_10
   - 228 p_right_3_10 <= 0
 non_overlap_down_3_10: h_var_3 + y_grid_var_3 - y_grid_var_10
   + 228 p_down_3_10 <= 228
 non_overlap_down_rev_3_10: - h_var_3 - y_grid_var_3 + y_grid_var_10
   - 228 p_down_3_10 <= 0
 non_overlap_up_3_10: h_var_10 - y_grid_var_3 + y_grid_var_10
   + 228 p_up_3_10 <= 228
 non_overlap_up_rev_3_10: - h_var_10 + y_grid_var_3 - y_grid_var_10
   - 228 p_up_3_10 <= 0
 non_overlap_any_3_11: p_left_3_11 + p_right_3_11 + p_down_3_11 + p_up_3_11
   >= 1
 non_overlap_left_3_11: w_var_3 + x_grid_var_3 - x_grid_var_11
   + 228 p_left_3_11 <= 228
 non_overlap_left_rev_3_11: - w_var_3 - x_grid_var_3 + x_grid_var_11
   - 228 p_left_3_11 <= 0
 non_overlap_right_3_11: w_var_11 - x_grid_var_3 + x_grid_var_11
   + 228 p_right_3_11 <= 228
 non_overlap_right_rev_3_11: - w_var_11 + x_grid_var_3 - x_grid_var_11
   - 228 p_right_3_11 <= 0
 non_overlap_down_3_11: h_var_3 + y_grid_var_3 - y_grid_var_11
   + 228 p_down_3_11 <= 228
 non_overlap_down_rev_3_11: - h_var_3 - y_grid_var_3 + y_grid_var_11
   - 228 p_down_3_11 <= 0
 non_overlap_up_3_11: h_var_11 - y_grid_var_3 + y_grid_var_11
   + 228 p_up_3_11 <= 228
 non_overlap_up_rev_3_11: - h_var_11 + y_grid_var_3 - y_grid_var_11
   - 228 p_up_3_11 <= 0
 non_overlap_any_3_12: p_left_3_12 + p_right_3_12 + p_down_3_12 + p_up_3_12
   >= 1
 non_overlap_left_3_12: w_var_3 + x_grid_var_3 - x_grid_var_12
   + 228 p_left_3_12 <= 228
 non_overlap_left_rev_3_12: - w_var_3 - x_grid_var_3 + x_grid_var_12
   - 228 p_left_3_12 <= 0
 non_overlap_right_3_12: w_var_12 - x_grid_var_3 + x_grid_var_12
   + 228 p_right_3_12 <= 228
 non_overlap_right_rev_3_12: - w_var_12 + x_grid_var_3 - x_grid_var_12
   - 228 p_right_3_12 <= 0
 non_overlap_down_3_12: h_var_3 + y_grid_var_3 - y_grid_var_12
   + 228 p_down_3_12 <= 228
 non_overlap_down_rev_3_12: - h_var_3 - y_grid_var_3 + y_grid_var_12
   - 228 p_down_3_12 <= 0
 non_overlap_up_3_12: h_var_12 - y_grid_var_3 + y_grid_var_12
   + 228 p_up_3_12 <= 228
 non_overlap_up_rev_3_12: - h_var_12 + y_grid_var_3 - y_grid_var_12
   - 228 p_up_3_12 <= 0
 non_overlap_any_3_13: p_left_3_13 + p_right_3_13 + p_down_3_13 + p_up_3_13
   >= 1
 non_overlap_left_3_13: w_var_3 + x_grid_var_3 - x_grid_var_13
   + 228 p_left_3_13 <= 228
 non_overlap_left_rev_3_13: - w_var_3 - x_grid_var_3 + x_grid_var_13
   - 228 p_left_3_13 <= 0
 non_overlap_right_3_13: w_var_13 - x_grid_var_3 + x_grid_var_13
   + 228 p_right_3_13 <= 228
 non_overlap_right_rev_3_13: - w_var_13 + x_grid_var_3 - x_grid_var_13
   - 228 p_right_3_13 <= 0
 non_overlap_down_3_13: h_var_3 + y_grid_var_3 - y_grid_var_13
   + 228 p_down_3_13 <= 228
 non_overlap_down_rev_3_13: - h_var_3 - y_grid_var_3 + y_grid_var_13
   - 228 p_down_3_13 <= 0
 non_overlap_up_3_13: h_var_13 - y_grid_var_3 + y_grid_var_13
   + 228 p_up_3_13 <= 228
 non_overlap_up_rev_3_13: - h_var_13 + y_grid_var_3 - y_grid_var_13
   - 228 p_up_3_13 <= 0
 non_overlap_any_3_14: p_left_3_14 + p_right_3_14 + p_down_3_14 + p_up_3_14
   >= 1
 non_overlap_left_3_14: w_var_3 + x_grid_var_3 - x_grid_var_14
   + 228 p_left_3_14 <= 228
 non_overlap_left_rev_3_14: - w_var_3 - x_grid_var_3 + x_grid_var_14
   - 228 p_left_3_14 <= 0
 non_overlap_right_3_14: w_var_14 - x_grid_var_3 + x_grid_var_14
   + 228 p_right_3_14 <= 228
 non_overlap_right_rev_3_14: - w_var_14 + x_grid_var_3 - x_grid_var_14
   - 228 p_right_3_14 <= 0
 non_overlap_down_3_14: h_var_3 + y_grid_var_3 - y_grid_var_14
   + 228 p_down_3_14 <= 228
 non_overlap_down_rev_3_14: - h_var_3 - y_grid_var_3 + y_grid_var_14
   - 228 p_down_3_14 <= 0
 non_overlap_up_3_14: h_var_14 - y_grid_var_3 + y_grid_var_14
   + 228 p_up_3_14 <= 228
 non_overlap_up_rev_3_14: - h_var_14 + y_grid_var_3 - y_grid_var_14
   - 228 p_up_3_14 <= 0
 non_overlap_any_4_5: p_left_4_5 + p_right_4_5 + p_down_4_5 + p_up_4_5
   >= 1
 non_overlap_left_4_5: w_var_4 + x_grid_var_4 - x_grid_var_5
   + 228 p_left_4_5 <= 228
 non_overlap_left_rev_4_5: - w_var_4 - x_grid_var_4 + x_grid_var_5
   - 228 p_left_4_5 <= 0
 non_overlap_right_4_5: w_var_5 - x_grid_var_4 + x_grid_var_5
   + 228 p_right_4_5 <= 228
 non_overlap_right_rev_4_5: - w_var_5 + x_grid_var_4 - x_grid_var_5
   - 228 p_right_4_5 <= 0
 non_overlap_down_4_5: h_var_4 + y_grid_var_4 - y_grid_var_5
   + 228 p_down_4_5 <= 228
 non_overlap_down_rev_4_5: - h_var_4 - y_grid_var_4 + y_grid_var_5
   - 228 p_down_4_5 <= 0
 non_overlap_up_4_5: h_var_5 - y_grid_var_4 + y_grid_var_5 + 228 p_up_4_5
   <= 228
 non_overlap_up_rev_4_5: - h_var_5 + y_grid_var_4 - y_grid_var_5
   - 228 p_up_4_5 <= 0
 non_overlap_any_4_6: p_left_4_6 + p_right_4_6 + p_down_4_6 + p_up_4_6
   >= 1
 non_overlap_left_4_6: w_var_4 + x_grid_var_4 - x_grid_var_6
   + 228 p_left_4_6 <= 228
 non_overlap_left_rev_4_6: - w_var_4 - x_grid_var_4 + x_grid_var_6
   - 228 p_left_4_6 <= 0
 non_overlap_right_4_6: w_var_6 - x_grid_var_4 + x_grid_var_6
   + 228 p_right_4_6 <= 228
 non_overlap_right_rev_4_6: - w_var_6 + x_grid_var_4 - x_grid_var_6
   - 228 p_right_4_6 <= 0
 non_overlap_down_4_6: h_var_4 + y_grid_var_4 - y_grid_var_6
   + 228 p_down_4_6 <= 228
 non_overlap_down_rev_4_6: - h_var_4 - y_grid_var_4 + y_grid_var_6
   - 228 p_down_4_6 <= 0
 non_overlap_up_4_6: h_var_6 - y_grid_var_4 + y_grid_var_6 + 228 p_up_4_6
   <= 228
 non_overlap_up_rev_4_6: - h_var_6 + y_grid_var_4 - y_grid_var_6
   - 228 p_up_4_6 <= 0
 non_overlap_any_4_7: p_left_4_7 + p_right_4_7 + p_down_4_7 + p_up_4_7
   >= 1
 non_overlap_left_4_7: w_var_4 + x_grid_var_4 - x_grid_var_7
   + 228 p_left_4_7 <= 228
 non_overlap_left_rev_4_7: - w_var_4 - x_grid_var_4 + x_grid_var_7
   - 228 p_left_4_7 <= 0
 non_overlap_right_4_7: w_var_7 - x_grid_var_4 + x_grid_var_7
   + 228 p_right_4_7 <= 228
 non_overlap_right_rev_4_7: - w_var_7 + x_grid_var_4 - x_grid_var_7
   - 228 p_right_4_7 <= 0
 non_overlap_down_4_7: h_var_4 + y_grid_var_4 - y_grid_var_7
   + 228 p_down_4_7 <= 228
 non_overlap_down_rev_4_7: - h_var_4 - y_grid_var_4 + y_grid_var_7
   - 228 p_down_4_7 <= 0
 non_overlap_up_4_7: h_var_7 - y_grid_var_4 + y_grid_var_7 + 228 p_up_4_7
   <= 228
 non_overlap_up_rev_4_7: - h_var_7 + y_grid_var_4 - y_grid_var_7
   - 228 p_up_4_7 <= 0
 non_overlap_any_4_8: p_left_4_8 + p_right_4_8 + p_down_4_8 + p_up_4_8
   >= 1
 non_overlap_left_4_8: w_var_4 + x_grid_var_4 - x_grid_var_8
   + 228 p_left_4_8 <= 228
 non_overlap_left_rev_4_8: - w_var_4 - x_grid_var_4 + x_grid_var_8
   - 228 p_left_4_8 <= 0
 non_overlap_right_4_8: w_var_8 - x_grid_var_4 + x_grid_var_8
   + 228 p_right_4_8 <= 228
 non_overlap_right_rev_4_8: - w_var_8 + x_grid_var_4 - x_grid_var_8
   - 228 p_right_4_8 <= 0
 non_overlap_down_4_8: h_var_4 + y_grid_var_4 - y_grid_var_8
   + 228 p_down_4_8 <= 228
 non_overlap_down_rev_4_8: - h_var_4 - y_grid_var_4 + y_grid_var_8
   - 228 p_down_4_8 <= 0
 non_overlap_up_4_8: h_var_8 - y_grid_var_4 + y_grid_var_8 + 228 p_up_4_8
   <= 228
 non_overlap_up_rev_4_8: - h_var_8 + y_grid_var_4 - y_grid_var_8
   - 228 p_up_4_8 <= 0
 non_overlap_any_4_9: p_left_4_9 + p_right_4_9 + p_down_4_9 + p_up_4_9
   >= 1
 non_overlap_left_4_9: w_var_4 + x_grid_var_4 - x_grid_var_9
   + 228 p_left_4_9 <= 228
 non_overlap_left_rev_4_9: - w_var_4 - x_grid_var_4 + x_grid_var_9
   - 228 p_left_4_9 <= 0
 non_overlap_right_4_9: w_var_9 - x_grid_var_4 + x_grid_var_9
   + 228 p_right_4_9 <= 228
 non_overlap_right_rev_4_9: - w_var_9 + x_grid_var_4 - x_grid_var_9
   - 228 p_right_4_9 <= 0
 non_overlap_down_4_9: h_var_4 + y_grid_var_4 - y_grid_var_9
   + 228 p_down_4_9 <= 228
 non_overlap_down_rev_4_9: - h_var_4 - y_grid_var_4 + y_grid_var_9
   - 228 p_down_4_9 <= 0
 non_overlap_up_4_9: h_var_9 - y_grid_var_4 + y_grid_var_9 + 228 p_up_4_9
   <= 228
 non_overlap_up_rev_4_9: - h_var_9 + y_grid_var_4 - y_grid_var_9
   - 228 p_up_4_9 <= 0
 non_overlap_any_4_10: p_left_4_10 + p_right_4_10 + p_down_4_10 + p_up_4_10
   >= 1
 non_overlap_left_4_10: w_var_4 + x_grid_var_4 - x_grid_var_10
   + 228 p_left_4_10 <= 228
 non_overlap_left_rev_4_10: - w_var_4 - x_grid_var_4 + x_grid_var_10
   - 228 p_left_4_10 <= 0
 non_overlap_right_4_10: w_var_10 - x_grid_var_4 + x_grid_var_10
   + 228 p_right_4_10 <= 228
 non_overlap_right_rev_4_10: - w_var_10 + x_grid_var_4 - x_grid_var_10
   - 228 p_right_4_10 <= 0
 non_overlap_down_4_10: h_var_4 + y_grid_var_4 - y_grid_var_10
   + 228 p_down_4_10 <= 228
 non_overlap_down_rev_4_10: - h_var_4 - y_grid_var_4 + y_grid_var_10
   - 228 p_down_4_10 <= 0
 non_overlap_up_4_10: h_var_10 - y_grid_var_4 + y_grid_var_10
   + 228 p_up_4_10 <= 228
 non_overlap_up_rev_4_10: - h_var_10 + y_grid_var_4 - y_grid_var_10
   - 228 p_up_4_10 <= 0
 non_overlap_any_4_11: p_left_4_11 + p_right_4_11 + p_down_4_11 + p_up_4_11
   >= 1
 non_overlap_left_4_11: w_var_4 + x_grid_var_4 - x_grid_var_11
   + 228 p_left_4_11 <= 228
 non_overlap_left_rev_4_11: - w_var_4 - x_grid_var_4 + x_grid_var_11
   - 228 p_left_4_11 <= 0
 non_overlap_right_4_11: w_var_11 - x_grid_var_4 + x_grid_var_11
   + 228 p_right_4_11 <= 228
 non_overlap_right_rev_4_11: - w_var_11 + x_grid_var_4 - x_grid_var_11
   - 228 p_right_4_11 <= 0
 non_overlap_down_4_11: h_var_4 + y_grid_var_4 - y_grid_var_11
   + 228 p_down_4_11 <= 228
 non_overlap_down_rev_4_11: - h_var_4 - y_grid_var_4 + y_grid_var_11
   - 228 p_down_4_11 <= 0
 non_overlap_up_4_11: h_var_11 - y_grid_var_4 + y_grid_var_11
   + 228 p_up_4_11 <= 228
 non_overlap_up_rev_4_11: - h_var_11 + y_grid_var_4 - y_grid_var_11
   - 228 p_up_4_11 <= 0
 non_overlap_any_4_12: p_left_4_12 + p_right_4_12 + p_down_4_12 + p_up_4_12
   >= 1
 non_overlap_left_4_12: w_var_4 + x_grid_var_4 - x_grid_var_12
   + 228 p_left_4_12 <= 228
 non_overlap_left_rev_4_12: - w_var_4 - x_grid_var_4 + x_grid_var_12
   - 228 p_left_4_12 <= 0
 non_overlap_right_4_12: w_var_12 - x_grid_var_4 + x_grid_var_12
   + 228 p_right_4_12 <= 228
 non_overlap_right_rev_4_12: - w_var_12 + x_grid_var_4 - x_grid_var_12
   - 228 p_right_4_12 <= 0
 non_overlap_down_4_12: h_var_4 + y_grid_var_4 - y_grid_var_12
   + 228 p_down_4_12 <= 228
 non_overlap_down_rev_4_12: - h_var_4 - y_grid_var_4 + y_grid_var_12
   - 228 p_down_4_12 <= 0
 non_overlap_up_4_12: h_var_12 - y_grid_var_4 + y_grid_var_12
   + 228 p_up_4_12 <= 228
 non_overlap_up_rev_4_12: - h_var_12 + y_grid_var_4 - y_grid_var_12
   - 228 p_up_4_12 <= 0
 non_overlap_any_4_13: p_left_4_13 + p_right_4_13 + p_down_4_13 + p_up_4_13
   >= 1
 non_overlap_left_4_13: w_var_4 + x_grid_var_4 - x_grid_var_13
   + 228 p_left_4_13 <= 228
 non_overlap_left_rev_4_13: - w_var_4 - x_grid_var_4 + x_grid_var_13
   - 228 p_left_4_13 <= 0
 non_overlap_right_4_13: w_var_13 - x_grid_var_4 + x_grid_var_13
   + 228 p_right_4_13 <= 228
 non_overlap_right_rev_4_13: - w_var_13 + x_grid_var_4 - x_grid_var_13
   - 228 p_right_4_13 <= 0
 non_overlap_down_4_13: h_var_4 + y_grid_var_4 - y_grid_var_13
   + 228 p_down_4_13 <= 228
 non_overlap_down_rev_4_13: - h_var_4 - y_grid_var_4 + y_grid_var_13
   - 228 p_down_4_13 <= 0
 non_overlap_up_4_13: h_var_13 - y_grid_var_4 + y_grid_var_13
   + 228 p_up_4_13 <= 228
 non_overlap_up_rev_4_13: - h_var_13 + y_grid_var_4 - y_grid_var_13
   - 228 p_up_4_13 <= 0
 non_overlap_any_4_14: p_left_4_14 + p_right_4_14 + p_down_4_14 + p_up_4_14
   >= 1
 non_overlap_left_4_14: w_var_4 + x_grid_var_4 - x_grid_var_14
   + 228 p_left_4_14 <= 228
 non_overlap_left_rev_4_14: - w_var_4 - x_grid_var_4 + x_grid_var_14
   - 228 p_left_4_14 <= 0
 non_overlap_right_4_14: w_var_14 - x_grid_var_4 + x_grid_var_14
   + 228 p_right_4_14 <= 228
 non_overlap_right_rev_4_14: - w_var_14 + x_grid_var_4 - x_grid_var_14
   - 228 p_right_4_14 <= 0
 non_overlap_down_4_14: h_var_4 + y_grid_var_4 - y_grid_var_14
   + 228 p_down_4_14 <= 228
 non_overlap_down_rev_4_14: - h_var_4 - y_grid_var_4 + y_grid_var_14
   - 228 p_down_4_14 <= 0
 non_overlap_up_4_14: h_var_14 - y_grid_var_4 + y_grid_var_14
   + 228 p_up_4_14 <= 228
 non_overlap_up_rev_4_14: - h_var_14 + y_grid_var_4 - y_grid_var_14
   - 228 p_up_4_14 <= 0
 non_overlap_any_5_6: p_left_5_6 + p_right_5_6 + p_down_5_6 + p_up_5_6
   >= 1
 non_overlap_left_5_6: w_var_5 + x_grid_var_5 - x_grid_var_6
   + 228 p_left_5_6 <= 228
 non_overlap_left_rev_5_6: - w_var_5 - x_grid_var_5 + x_grid_var_6
   - 228 p_left_5_6 <= 0
 non_overlap_right_5_6: w_var_6 - x_grid_var_5 + x_grid_var_6
   + 228 p_right_5_6 <= 228
 non_overlap_right_rev_5_6: - w_var_6 + x_grid_var_5 - x_grid_var_6
   - 228 p_right_5_6 <= 0
 non_overlap_down_5_6: h_var_5 + y_grid_var_5 - y_grid_var_6
   + 228 p_down_5_6 <= 228
 non_overlap_down_rev_5_6: - h_var_5 - y_grid_var_5 + y_grid_var_6
   - 228 p_down_5_6 <= 0
 non_overlap_up_5_6: h_var_6 - y_grid_var_5 + y_grid_var_6 + 228 p_up_5_6
   <= 228
 non_overlap_up_rev_5_6: - h_var_6 + y_grid_var_5 - y_grid_var_6
   - 228 p_up_5_6 <= 0
 non_overlap_any_5_7: p_left_5_7 + p_right_5_7 + p_down_5_7 + p_up_5_7
   >= 1
 non_overlap_left_5_7: w_var_5 + x_grid_var_5 - x_grid_var_7
   + 228 p_left_5_7 <= 228
 non_overlap_left_rev_5_7: - w_var_5 - x_grid_var_5 + x_grid_var_7
   - 228 p_left_5_7 <= 0
 non_overlap_right_5_7: w_var_7 - x_grid_var_5 + x_grid_var_7
   + 228 p_right_5_7 <= 228
 non_overlap_right_rev_5_7: - w_var_7 + x_grid_var_5 - x_grid_var_7
   - 228 p_right_5_7 <= 0
 non_overlap_down_5_7: h_var_5 + y_grid_var_5 - y_grid_var_7
   + 228 p_down_5_7 <= 228
 non_overlap_down_rev_5_7: - h_var_5 - y_grid_var_5 + y_grid_var_7
   - 228 p_down_5_7 <= 0
 non_overlap_up_5_7: h_var_7 - y_grid_var_5 + y_grid_var_7 + 228 p_up_5_7
   <= 228
 non_overlap_up_rev_5_7: - h_var_7 + y_grid_var_5 - y_grid_var_7
   - 228 p_up_5_7 <= 0
 non_overlap_any_5_8: p_left_5_8 + p_right_5_8 + p_down_5_8 + p_up_5_8
   >= 1
 non_overlap_left_5_8: w_var_5 + x_grid_var_5 - x_grid_var_8
   + 228 p_left_5_8 <= 228
 non_overlap_left_rev_5_8: - w_var_5 - x_grid_var_5 + x_grid_var_8
   - 228 p_left_5_8 <= 0
 non_overlap_right_5_8: w_var_8 - x_grid_var_5 + x_grid_var_8
   + 228 p_right_5_8 <= 228
 non_overlap_right_rev_5_8: - w_var_8 + x_grid_var_5 - x_grid_var_8
   - 228 p_right_5_8 <= 0
 non_overlap_down_5_8: h_var_5 + y_grid_var_5 - y_grid_var_8
   + 228 p_down_5_8 <= 228
 non_overlap_down_rev_5_8: - h_var_5 - y_grid_var_5 + y_grid_var_8
   - 228 p_down_5_8 <= 0
 non_overlap_up_5_8: h_var_8 - y_grid_var_5 + y_grid_var_8 + 228 p_up_5_8
   <= 228
 non_overlap_up_rev_5_8: - h_var_8 + y_grid_var_5 - y_grid_var_8
   - 228 p_up_5_8 <= 0
 non_overlap_any_5_9: p_left_5_9 + p_right_5_9 + p_down_5_9 + p_up_5_9
   >= 1
 non_overlap_left_5_9: w_var_5 + x_grid_var_5 - x_grid_var_9
   + 228 p_left_5_9 <= 228
 non_overlap_left_rev_5_9: - w_var_5 - x_grid_var_5 + x_grid_var_9
   - 228 p_left_5_9 <= 0
 non_overlap_right_5_9: w_var_9 - x_grid_var_5 + x_grid_var_9
   + 228 p_right_5_9 <= 228
 non_overlap_right_rev_5_9: - w_var_9 + x_grid_var_5 - x_grid_var_9
   - 228 p_right_5_9 <= 0
 non_overlap_down_5_9: h_var_5 + y_grid_var_5 - y_grid_var_9
   + 228 p_down_5_9 <= 228
 non_overlap_down_rev_5_9: - h_var_5 - y_grid_var_5 + y_grid_var_9
   - 228 p_down_5_9 <= 0
 non_overlap_up_5_9: h_var_9 - y_grid_var_5 + y_grid_var_9 + 228 p_up_5_9
   <= 228
 non_overlap_up_rev_5_9: - h_var_9 + y_grid_var_5 - y_grid_var_9
   - 228 p_up_5_9 <= 0
 non_overlap_any_5_10: p_left_5_10 + p_right_5_10 + p_down_5_10 + p_up_5_10
   >= 1
 non_overlap_left_5_10: w_var_5 + x_grid_var_5 - x_grid_var_10
   + 228 p_left_5_10 <= 228
 non_overlap_left_rev_5_10: - w_var_5 - x_grid_var_5 + x_grid_var_10
   - 228 p_left_5_10 <= 0
 non_overlap_right_5_10: w_var_10 - x_grid_var_5 + x_grid_var_10
   + 228 p_right_5_10 <= 228
 non_overlap_right_rev_5_10: - w_var_10 + x_grid_var_5 - x_grid_var_10
   - 228 p_right_5_10 <= 0
 non_overlap_down_5_10: h_var_5 + y_grid_var_5 - y_grid_var_10
   + 228 p_down_5_10 <= 228
 non_overlap_down_rev_5_10: - h_var_5 - y_grid_var_5 + y_grid_var_10
   - 228 p_down_5_10 <= 0
 non_overlap_up_5_10: h_var_10 - y_grid_var_5 + y_grid_var_10
   + 228 p_up_5_10 <= 228
 non_overlap_up_rev_5_10: - h_var_10 + y_grid_var_5 - y_grid_var_10
   - 228 p_up_5_10 <= 0
 non_overlap_any_5_11: p_left_5_11 + p_right_5_11 + p_down_5_11 + p_up_5_11
   >= 1
 non_overlap_left_5_11: w_var_5 + x_grid_var_5 - x_grid_var_11
   + 228 p_left_5_11 <= 228
 non_overlap_left_rev_5_11: - w_var_5 - x_grid_var_5 + x_grid_var_11
   - 228 p_left_5_11 <= 0
 non_overlap_right_5_11: w_var_11 - x_grid_var_5 + x_grid_var_11
   + 228 p_right_5_11 <= 228
 non_overlap_right_rev_5_11: - w_var_11 + x_grid_var_5 - x_grid_var_11
   - 228 p_right_5_11 <= 0
 non_overlap_down_5_11: h_var_5 + y_grid_var_5 - y_grid_var_11
   + 228 p_down_5_11 <= 228
 non_overlap_down_rev_5_11: - h_var_5 - y_grid_var_5 + y_grid_var_11
   - 228 p_down_5_11 <= 0
 non_overlap_up_5_11: h_var_11 - y_grid_var_5 + y_grid_var_11
   + 228 p_up_5_11 <= 228
 non_overlap_up_rev_5_11: - h_var_11 + y_grid_var_5 - y_grid_var_11
   - 228 p_up_5_11 <= 0
 non_overlap_any_5_12: p_left_5_12 + p_right_5_12 + p_down_5_12 + p_up_5_12
   >= 1
 non_overlap_left_5_12: w_var_5 + x_grid_var_5 - x_grid_var_12
   + 228 p_left_5_12 <= 228
 non_overlap_left_rev_5_12: - w_var_5 - x_grid_var_5 + x_grid_var_12
   - 228 p_left_5_12 <= 0
 non_overlap_right_5_12: w_var_12 - x_grid_var_5 + x_grid_var_12
   + 228 p_right_5_12 <= 228
 non_overlap_right_rev_5_12: - w_var_12 + x_grid_var_5 - x_grid_var_12
   - 228 p_right_5_12 <= 0
 non_overlap_down_5_12: h_var_5 + y_grid_var_5 - y_grid_var_12
   + 228 p_down_5_12 <= 228
 non_overlap_down_rev_5_12: - h_var_5 - y_grid_var_5 + y_grid_var_12
   - 228 p_down_5_12 <= 0
 non_overlap_up_5_12: h_var_12 - y_grid_var_5 + y_grid_var_12
   + 228 p_up_5_12 <= 228
 non_overlap_up_rev_5_12: - h_var_12 + y_grid_var_5 - y_grid_var_12
   - 228 p_up_5_12 <= 0
 non_overlap_any_5_13: p_left_5_13 + p_right_5_13 + p_down_5_13 + p_up_5_13
   >= 1
 non_overlap_left_5_13: w_var_5 + x_grid_var_5 - x_grid_var_13
   + 228 p_left_5_13 <= 228
 non_overlap_left_rev_5_13: - w_var_5 - x_grid_var_5 + x_grid_var_13
   - 228 p_left_5_13 <= 0
 non_overlap_right_5_13: w_var_13 - x_grid_var_5 + x_grid_var_13
   + 228 p_right_5_13 <= 228
 non_overlap_right_rev_5_13: - w_var_13 + x_grid_var_5 - x_grid_var_13
   - 228 p_right_5_13 <= 0
 non_overlap_down_5_13: h_var_5 + y_grid_var_5 - y_grid_var_13
   + 228 p_down_5_13 <= 228
 non_overlap_down_rev_5_13: - h_var_5 - y_grid_var_5 + y_grid_var_13
   - 228 p_down_5_13 <= 0
 non_overlap_up_5_13: h_var_13 - y_grid_var_5 + y_grid_var_13
   + 228 p_up_5_13 <= 228
 non_overlap_up_rev_5_13: - h_var_13 + y_grid_var_5 - y_grid_var_13
   - 228 p_up_5_13 <= 0
 non_overlap_any_5_14: p_left_5_14 + p_right_5_14 + p_down_5_14 + p_up_5_14
   >= 1
 non_overlap_left_5_14: w_var_5 + x_grid_var_5 - x_grid_var_14
   + 228 p_left_5_14 <= 228
 non_overlap_left_rev_5_14: - w_var_5 - x_grid_var_5 + x_grid_var_14
   - 228 p_left_5_14 <= 0
 non_overlap_right_5_14: w_var_14 - x_grid_var_5 + x_grid_var_14
   + 228 p_right_5_14 <= 228
 non_overlap_right_rev_5_14: - w_var_14 + x_grid_var_5 - x_grid_var_14
   - 228 p_right_5_14 <= 0
 non_overlap_down_5_14: h_var_5 + y_grid_var_5 - y_grid_var_14
   + 228 p_down_5_14 <= 228
 non_overlap_down_rev_5_14: - h_var_5 - y_grid_var_5 + y_grid_var_14
   - 228 p_down_5_14 <= 0
 non_overlap_up_5_14: h_var_14 - y_grid_var_5 + y_grid_var_14
   + 228 p_up_5_14 <= 228
 non_overlap_up_rev_5_14: - h_var_14 + y_grid_var_5 - y_grid_var_14
   - 228 p_up_5_14 <= 0
 non_overlap_any_6_7: p_left_6_7 + p_right_6_7 + p_down_6_7 + p_up_6_7
   >= 1
 non_overlap_left_6_7: w_var_6 + x_grid_var_6 - x_grid_var_7
   + 228 p_left_6_7 <= 228
 non_overlap_left_rev_6_7: - w_var_6 - x_grid_var_6 + x_grid_var_7
   - 228 p_left_6_7 <= 0
 non_overlap_right_6_7: w_var_7 - x_grid_var_6 + x_grid_var_7
   + 228 p_right_6_7 <= 228
 non_overlap_right_rev_6_7: - w_var_7 + x_grid_var_6 - x_grid_var_7
   - 228 p_right_6_7 <= 0
 non_overlap_down_6_7: h_var_6 + y_grid_var_6 - y_grid_var_7
   + 228 p_down_6_7 <= 228
 non_overlap_down_rev_6_7: - h_var_6 - y_grid_var_6 + y_grid_var_7
   - 228 p_down_6_7 <= 0
 non_overlap_up_6_7: h_var_7 - y_grid_var_6 + y_grid_var_7 + 228 p_up_6_7
   <= 228
 non_overlap_up_rev_6_7: - h_var_7 + y_grid_var_6 - y_grid_var_7
   - 228 p_up_6_7 <= 0
 non_overlap_any_6_8: p_left_6_8 + p_right_6_8 + p_down_6_8 + p_up_6_8
   >= 1
 non_overlap_left_6_8: w_var_6 + x_grid_var_6 - x_grid_var_8
   + 228 p_left_6_8 <= 228
 non_overlap_left_rev_6_8: - w_var_6 - x_grid_var_6 + x_grid_var_8
   - 228 p_left_6_8 <= 0
 non_overlap_right_6_8: w_var_8 - x_grid_var_6 + x_grid_var_8
   + 228 p_right_6_8 <= 228
 non_overlap_right_rev_6_8: - w_var_8 + x_grid_var_6 - x_grid_var_8
   - 228 p_right_6_8 <= 0
 non_overlap_down_6_8: h_var_6 + y_grid_var_6 - y_grid_var_8
   + 228 p_down_6_8 <= 228
 non_overlap_down_rev_6_8: - h_var_6 - y_grid_var_6 + y_grid_var_8
   - 228 p_down_6_8 <= 0
 non_overlap_up_6_8: h_var_8 - y_grid_var_6 + y_grid_var_8 + 228 p_up_6_8
   <= 228
 non_overlap_up_rev_6_8: - h_var_8 + y_grid_var_6 - y_grid_var_8
   - 228 p_up_6_8 <= 0
 non_overlap_any_6_9: p_left_6_9 + p_right_6_9 + p_down_6_9 + p_up_6_9
   >= 1
 non_overlap_left_6_9: w_var_6 + x_grid_var_6 - x_grid_var_9
   + 228 p_left_6_9 <= 228
 non_overlap_left_rev_6_9: - w_var_6 - x_grid_var_6 + x_grid_var_9
   - 228 p_left_6_9 <= 0
 non_overlap_right_6_9: w_var_9 - x_grid_var_6 + x_grid_var_9
   + 228 p_right_6_9 <= 228
 non_overlap_right_rev_6_9: - w_var_9 + x_grid_var_6 - x_grid_var_9
   - 228 p_right_6_9 <= 0
 non_overlap_down_6_9: h_var_6 + y_grid_var_6 - y_grid_var_9
   + 228 p_down_6_9 <= 228
 non_overlap_down_rev_6_9: - h_var_6 - y_grid_var_6 + y_grid_var_9
   - 228 p_down_6_9 <= 0
 non_overlap_up_6_9: h_var_9 - y_grid_var_6 + y_grid_var_9 + 228 p_up_6_9
   <= 228
 non_overlap_up_rev_6_9: - h_var_9 + y_grid_var_6 - y_grid_var_9
   - 228 p_up_6_9 <= 0
 non_overlap_any_6_10: p_left_6_10 + p_right_6_10 + p_down_6_10 + p_up_6_10
   >= 1
 non_overlap_left_6_10: w_var_6 + x_grid_var_6 - x_grid_var_10
   + 228 p_left_6_10 <= 228
 non_overlap_left_rev_6_10: - w_var_6 - x_grid_var_6 + x_grid_var_10
   - 228 p_left_6_10 <= 0
 non_overlap_right_6_10: w_var_10 - x_grid_var_6 + x_grid_var_10
   + 228 p_right_6_10 <= 228
 non_overlap_right_rev_6_10: - w_var_10 + x_grid_var_6 - x_grid_var_10
   - 228 p_right_6_10 <= 0
 non_overlap_down_6_10: h_var_6 + y_grid_var_6 - y_grid_var_10
   + 228 p_down_6_10 <= 228
 non_overlap_down_rev_6_10: - h_var_6 - y_grid_var_6 + y_grid_var_10
   - 228 p_down_6_10 <= 0
 non_overlap_up_6_10: h_var_10 - y_grid_var_6 + y_grid_var_10
   + 228 p_up_6_10 <= 228
 non_overlap_up_rev_6_10: - h_var_10 + y_grid_var_6 - y_grid_var_10
   - 228 p_up_6_10 <= 0
 non_overlap_any_6_11: p_left_6_11 + p_right_6_11 + p_down_6_11 + p_up_6_11
   >= 1
 non_overlap_left_6_11: w_var_6 + x_grid_var_6 - x_grid_var_11
   + 228 p_left_6_11 <= 228
 non_overlap_left_rev_6_11: - w_var_6 - x_grid_var_6 + x_grid_var_11
   - 228 p_left_6_11 <= 0
 non_overlap_right_6_11: w_var_11 - x_grid_var_6 + x_grid_var_11
   + 228 p_right_6_11 <= 228
 non_overlap_right_rev_6_11: - w_var_11 + x_grid_var_6 - x_grid_var_11
   - 228 p_right_6_11 <= 0
 non_overlap_down_6_11: h_var_6 + y_grid_var_6 - y_grid_var_11
   + 228 p_down_6_11 <= 228
 non_overlap_down_rev_6_11: - h_var_6 - y_grid_var_6 + y_grid_var_11
   - 228 p_down_6_11 <= 0
 non_overlap_up_6_11: h_var_11 - y_grid_var_6 + y_grid_var_11
   + 228 p_up_6_11 <= 228
 non_overlap_up_rev_6_11: - h_var_11 + y_grid_var_6 - y_grid_var_11
   - 228 p_up_6_11 <= 0
 non_overlap_any_6_12: p_left_6_12 + p_right_6_12 + p_down_6_12 + p_up_6_12
   >= 1
 non_overlap_left_6_12: w_var_6 + x_grid_var_6 - x_grid_var_12
   + 228 p_left_6_12 <= 228
 non_overlap_left_rev_6_12: - w_var_6 - x_grid_var_6 + x_grid_var_12
   - 228 p_left_6_12 <= 0
 non_overlap_right_6_12: w_var_12 - x_grid_var_6 + x_grid_var_12
   + 228 p_right_6_12 <= 228
 non_overlap_right_rev_6_12: - w_var_12 + x_grid_var_6 - x_grid_var_12
   - 228 p_right_6_12 <= 0
 non_overlap_down_6_12: h_var_6 + y_grid_var_6 - y_grid_var_12
   + 228 p_down_6_12 <= 228
 non_overlap_down_rev_6_12: - h_var_6 - y_grid_var_6 + y_grid_var_12
   - 228 p_down_6_12 <= 0
 non_overlap_up_6_12: h_var_12 - y_grid_var_6 + y_grid_var_12
   + 228 p_up_6_12 <= 228
 non_overlap_up_rev_6_12: - h_var_12 + y_grid_var_6 - y_grid_var_12
   - 228 p_up_6_12 <= 0
 non_overlap_any_6_13: p_left_6_13 + p_right_6_13 + p_down_6_13 + p_up_6_13
   >= 1
 non_overlap_left_6_13: w_var_6 + x_grid_var_6 - x_grid_var_13
   + 228 p_left_6_13 <= 228
 non_overlap_left_rev_6_13: - w_var_6 - x_grid_var_6 + x_grid_var_13
   - 228 p_left_6_13 <= 0
 non_overlap_right_6_13: w_var_13 - x_grid_var_6 + x_grid_var_13
   + 228 p_right_6_13 <= 228
 non_overlap_right_rev_6_13: - w_var_13 + x_grid_var_6 - x_grid_var_13
   - 228 p_right_6_13 <= 0
 non_overlap_down_6_13: h_var_6 + y_grid_var_6 - y_grid_var_13
   + 228 p_down_6_13 <= 228
 non_overlap_down_rev_6_13: - h_var_6 - y_grid_var_6 + y_grid_var_13
   - 228 p_down_6_13 <= 0
 non_overlap_up_6_13: h_var_13 - y_grid_var_6 + y_grid_var_13
   + 228 p_up_6_13 <= 228
 non_overlap_up_rev_6_13: - h_var_13 + y_grid_var_6 - y_grid_var_13
   - 228 p_up_6_13 <= 0
 non_overlap_any_6_14: p_left_6_14 + p_right_6_14 + p_down_6_14 + p_up_6_14
   >= 1
 non_overlap_left_6_14: w_var_6 + x_grid_var_6 - x_grid_var_14
   + 228 p_left_6_14 <= 228
 non_overlap_left_rev_6_14: - w_var_6 - x_grid_var_6 + x_grid_var_14
   - 228 p_left_6_14 <= 0
 non_overlap_right_6_14: w_var_14 - x_grid_var_6 + x_grid_var_14
   + 228 p_right_6_14 <= 228
 non_overlap_right_rev_6_14: - w_var_14 + x_grid_var_6 - x_grid_var_14
   - 228 p_right_6_14 <= 0
 non_overlap_down_6_14: h_var_6 + y_grid_var_6 - y_grid_var_14
   + 228 p_down_6_14 <= 228
 non_overlap_down_rev_6_14: - h_var_6 - y_grid_var_6 + y_grid_var_14
   - 228 p_down_6_14 <= 0
 non_overlap_up_6_14: h_var_14 - y_grid_var_6 + y_grid_var_14
   + 228 p_up_6_14 <= 228
 non_overlap_up_rev_6_14: - h_var_14 + y_grid_var_6 - y_grid_var_14
   - 228 p_up_6_14 <= 0
 non_overlap_any_7_8: p_left_7_8 + p_right_7_8 + p_down_7_8 + p_up_7_8
   >= 1
 non_overlap_left_7_8: w_var_7 + x_grid_var_7 - x_grid_var_8
   + 228 p_left_7_8 <= 228
 non_overlap_left_rev_7_8: - w_var_7 - x_grid_var_7 + x_grid_var_8
   - 228 p_left_7_8 <= 0
 non_overlap_right_7_8: w_var_8 - x_grid_var_7 + x_grid_var_8
   + 228 p_right_7_8 <= 228
 non_overlap_right_rev_7_8: - w_var_8 + x_grid_var_7 - x_grid_var_8
   - 228 p_right_7_8 <= 0
 non_overlap_down_7_8: h_var_7 + y_grid_var_7 - y_grid_var_8
   + 228 p_down_7_8 <= 228
 non_overlap_down_rev_7_8: - h_var_7 - y_grid_var_7 + y_grid_var_8
   - 228 p_down_7_8 <= 0
 non_overlap_up_7_8: h_var_8 - y_grid_var_7 + y_grid_var_8 + 228 p_up_7_8
   <= 228
 non_overlap_up_rev_7_8: - h_var_8 + y_grid_var_7 - y_grid_var_8
   - 228 p_up_7_8 <= 0
 non_overlap_any_7_9: p_left_7_9 + p_right_7_9 + p_down_7_9 + p_up_7_9
   >= 1
 non_overlap_left_7_9: w_var_7 + x_grid_var_7 - x_grid_var_9
   + 228 p_left_7_9 <= 228
 non_overlap_left_rev_7_9: - w_var_7 - x_grid_var_7 + x_grid_var_9
   - 228 p_left_7_9 <= 0
 non_overlap_right_7_9: w_var_9 - x_grid_var_7 + x_grid_var_9
   + 228 p_right_7_9 <= 228
 non_overlap_right_rev_7_9: - w_var_9 + x_grid_var_7 - x_grid_var_9
   - 228 p_right_7_9 <= 0
 non_overlap_down_7_9: h_var_7 + y_grid_var_7 - y_grid_var_9
   + 228 p_down_7_9 <= 228
 non_overlap_down_rev_7_9: - h_var_7 - y_grid_var_7 + y_grid_var_9
   - 228 p_down_7_9 <= 0
 non_overlap_up_7_9: h_var_9 - y_grid_var_7 + y_grid_var_9 + 228 p_up_7_9
   <= 228
 non_overlap_up_rev_7_9: - h_var_9 + y_grid_var_7 - y_grid_var_9
   - 228 p_up_7_9 <= 0
 non_overlap_any_7_10: p_left_7_10 + p_right_7_10 + p_down_7_10 + p_up_7_10
   >= 1
 non_overlap_left_7_10: w_var_7 + x_grid_var_7 - x_grid_var_10
   + 228 p_left_7_10 <= 228
 non_overlap_left_rev_7_10: - w_var_7 - x_grid_var_7 + x_grid_var_10
   - 228 p_left_7_10 <= 0
 non_overlap_right_7_10: w_var_10 - x_grid_var_7 + x_grid_var_10
   + 228 p_right_7_10 <= 228
 non_overlap_right_rev_7_10: - w_var_10 + x_grid_var_7 - x_grid_var_10
   - 228 p_right_7_10 <= 0
 non_overlap_down_7_10: h_var_7 + y_grid_var_7 - y_grid_var_10
   + 228 p_down_7_10 <= 228
 non_overlap_down_rev_7_10: - h_var_7 - y_grid_var_7 + y_grid_var_10
   - 228 p_down_7_10 <= 0
 non_overlap_up_7_10: h_var_10 - y_grid_var_7 + y_grid_var_10
   + 228 p_up_7_10 <= 228
 non_overlap_up_rev_7_10: - h_var_10 + y_grid_var_7 - y_grid_var_10
   - 228 p_up_7_10 <= 0
 non_overlap_any_7_11: p_left_7_11 + p_right_7_11 + p_down_7_11 + p_up_7_11
   >= 1
 non_overlap_left_7_11: w_var_7 + x_grid_var_7 - x_grid_var_11
   + 228 p_left_7_11 <= 228
 non_overlap_left_rev_7_11: - w_var_7 - x_grid_var_7 + x_grid_var_11
   - 228 p_left_7_11 <= 0
 non_overlap_right_7_11: w_var_11 - x_grid_var_7 + x_grid_var_11
   + 228 p_right_7_11 <= 228
 non_overlap_right_rev_7_11: - w_var_11 + x_grid_var_7 - x_grid_var_11
   - 228 p_right_7_11 <= 0
 non_overlap_down_7_11: h_var_7 + y_grid_var_7 - y_grid_var_11
   + 228 p_down_7_11 <= 228
 non_overlap_down_rev_7_11: - h_var_7 - y_grid_var_7 + y_grid_var_11
   - 228 p_down_7_11 <= 0
 non_overlap_up_7_11: h_var_11 - y_grid_var_7 + y_grid_var_11
   + 228 p_up_7_11 <= 228
 non_overlap_up_rev_7_11: - h_var_11 + y_grid_var_7 - y_grid_var_11
   - 228 p_up_7_11 <= 0
 non_overlap_any_7_12: p_left_7_12 + p_right_7_12 + p_down_7_12 + p_up_7_12
   >= 1
 non_overlap_left_7_12: w_var_7 + x_grid_var_7 - x_grid_var_12
   + 228 p_left_7_12 <= 228
 non_overlap_left_rev_7_12: - w_var_7 - x_grid_var_7 + x_grid_var_12
   - 228 p_left_7_12 <= 0
 non_overlap_right_7_12: w_var_12 - x_grid_var_7 + x_grid_var_12
   + 228 p_right_7_12 <= 228
 non_overlap_right_rev_7_12: - w_var_12 + x_grid_var_7 - x_grid_var_12
   - 228 p_right_7_12 <= 0
 non_overlap_down_7_12: h_var_7 + y_grid_var_7 - y_grid_var_12
   + 228 p_down_7_12 <= 228
 non_overlap_down_rev_7_12: - h_var_7 - y_grid_var_7 + y_grid_var_12
   - 228 p_down_7_12 <= 0
 non_overlap_up_7_12: h_var_12 - y_grid_var_7 + y_grid_var_12
   + 228 p_up_7_12 <= 228
 non_overlap_up_rev_7_12: - h_var_12 + y_grid_var_7 - y_grid_var_12
   - 228 p_up_7_12 <= 0
 non_overlap_any_7_13: p_left_7_13 + p_right_7_13 + p_down_7_13 + p_up_7_13
   >= 1
 non_overlap_left_7_13: w_var_7 + x_grid_var_7 - x_grid_var_13
   + 228 p_left_7_13 <= 228
 non_overlap_left_rev_7_13: - w_var_7 - x_grid_var_7 + x_grid_var_13
   - 228 p_left_7_13 <= 0
 non_overlap_right_7_13: w_var_13 - x_grid_var_7 + x_grid_var_13
   + 228 p_right_7_13 <= 228
 non_overlap_right_rev_7_13: - w_var_13 + x_grid_var_7 - x_grid_var_13
   - 228 p_right_7_13 <= 0
 non_overlap_down_7_13: h_var_7 + y_grid_var_7 - y_grid_var_13
   + 228 p_down_7_13 <= 228
 non_overlap_down_rev_7_13: - h_var_7 - y_grid_var_7 + y_grid_var_13
   - 228 p_down_7_13 <= 0
 non_overlap_up_7_13: h_var_13 - y_grid_var_7 + y_grid_var_13
   + 228 p_up_7_13 <= 228
 non_overlap_up_rev_7_13: - h_var_13 + y_grid_var_7 - y_grid_var_13
   - 228 p_up_7_13 <= 0
 non_overlap_any_7_14: p_left_7_14 + p_right_7_14 + p_down_7_14 + p_up_7_14
   >= 1
 non_overlap_left_7_14: w_var_7 + x_grid_var_7 - x_grid_var_14
   + 228 p_left_7_14 <= 228
 non_overlap_left_rev_7_14: - w_var_7 - x_grid_var_7 + x_grid_var_14
   - 228 p_left_7_14 <= 0
 non_overlap_right_7_14: w_var_14 - x_grid_var_7 + x_grid_var_14
   + 228 p_right_7_14 <= 228
 non_overlap_right_rev_7_14: - w_var_14 + x_grid_var_7 - x_grid_var_14
   - 228 p_right_7_14 <= 0
 non_overlap_down_7_14: h_var_7 + y_grid_var_7 - y_grid_var_14
   + 228 p_down_7_14 <= 228
 non_overlap_down_rev_7_14: - h_var_7 - y_grid_var_7 + y_grid_var_14
   - 228 p_down_7_14 <= 0
 non_overlap_up_7_14: h_var_14 - y_grid_var_7 + y_grid_var_14
   + 228 p_up_7_14 <= 228
 non_overlap_up_rev_7_14: - h_var_14 + y_grid_var_7 - y_grid_var_14
   - 228 p_up_7_14 <= 0
 non_overlap_any_8_9: p_left_8_9 + p_right_8_9 + p_down_8_9 + p_up_8_9
   >= 1
 non_overlap_left_8_9: w_var_8 + x_grid_var_8 - x_grid_var_9
   + 228 p_left_8_9 <= 228
 non_overlap_left_rev_8_9: - w_var_8 - x_grid_var_8 + x_grid_var_9
   - 228 p_left_8_9 <= 0
 non_overlap_right_8_9: w_var_9 - x_grid_var_8 + x_grid_var_9
   + 228 p_right_8_9 <= 228
 non_overlap_right_rev_8_9: - w_var_9 + x_grid_var_8 - x_grid_var_9
   - 228 p_right_8_9 <= 0
 non_overlap_down_8_9: h_var_8 + y_grid_var_8 - y_grid_var_9
   + 228 p_down_8_9 <= 228
 non_overlap_down_rev_8_9: - h_var_8 - y_grid_var_8 + y_grid_var_9
   - 228 p_down_8_9 <= 0
 non_overlap_up_8_9: h_var_9 - y_grid_var_8 + y_grid_var_9 + 228 p_up_8_9
   <= 228
 non_overlap_up_rev_8_9: - h_var_9 + y_grid_var_8 - y_grid_var_9
   - 228 p_up_8_9 <= 0
 non_overlap_any_8_10: p_left_8_10 + p_right_8_10 + p_down_8_10 + p_up_8_10
   >= 1
 non_overlap_left_8_10: w_var_8 + x_grid_var_8 - x_grid_var_10
   + 228 p_left_8_10 <= 228
 non_overlap_left_rev_8_10: - w_var_8 - x_grid_var_8 + x_grid_var_10
   - 228 p_left_8_10 <= 0
 non_overlap_right_8_10: w_var_10 - x_grid_var_8 + x_grid_var_10
   + 228 p_right_8_10 <= 228
 non_overlap_right_rev_8_10: - w_var_10 + x_grid_var_8 - x_grid_var_10
   - 228 p_right_8_10 <= 0
 non_overlap_down_8_10: h_var_8 + y_grid_var_8 - y_grid_var_10
   + 228 p_down_8_10 <= 228
 non_overlap_down_rev_8_10: - h_var_8 - y_grid_var_8 + y_grid_var_10
   - 228 p_down_8_10 <= 0
 non_overlap_up_8_10: h_var_10 - y_grid_var_8 + y_grid_var_10
   + 228 p_up_8_10 <= 228
 non_overlap_up_rev_8_10: - h_var_10 + y_grid_var_8 - y_grid_var_10
   - 228 p_up_8_10 <= 0
 non_overlap_any_8_11: p_left_8_11 + p_right_8_11 + p_down_8_11 + p_up_8_11
   >= 1
 non_overlap_left_8_11: w_var_8 + x_grid_var_8 - x_grid_var_11
   + 228 p_left_8_11 <= 228
 non_overlap_left_rev_8_11: - w_var_8 - x_grid_var_8 + x_grid_var_11
   - 228 p_left_8_11 <= 0
 non_overlap_right_8_11: w_var_11 - x_grid_var_8 + x_grid_var_11
   + 228 p_right_8_11 <= 228
 non_overlap_right_rev_8_11: - w_var_11 + x_grid_var_8 - x_grid_var_11
   - 228 p_right_8_11 <= 0
 non_overlap_down_8_11: h_var_8 + y_grid_var_8 - y_grid_var_11
   + 228 p_down_8_11 <= 228
 non_overlap_down_rev_8_11: - h_var_8 - y_grid_var_8 + y_grid_var_11
   - 228 p_down_8_11 <= 0
 non_overlap_up_8_11: h_var_11 - y_grid_var_8 + y_grid_var_11
   + 228 p_up_8_11 <= 228
 non_overlap_up_rev_8_11: - h_var_11 + y_grid_var_8 - y_grid_var_11
   - 228 p_up_8_11 <= 0
 non_overlap_any_8_12: p_left_8_12 + p_right_8_12 + p_down_8_12 + p_up_8_12
   >= 1
 non_overlap_left_8_12: w_var_8 + x_grid_var_8 - x_grid_var_12
   + 228 p_left_8_12 <= 228
 non_overlap_left_rev_8_12: - w_var_8 - x_grid_var_8 + x_grid_var_12
   - 228 p_left_8_12 <= 0
 non_overlap_right_8_12: w_var_12 - x_grid_var_8 + x_grid_var_12
   + 228 p_right_8_12 <= 228
 non_overlap_right_rev_8_12: - w_var_12 + x_grid_var_8 - x_grid_var_12
   - 228 p_right_8_12 <= 0
 non_overlap_down_8_12: h_var_8 + y_grid_var_8 - y_grid_var_12
   + 228 p_down_8_12 <= 228
 non_overlap_down_rev_8_12: - h_var_8 - y_grid_var_8 + y_grid_var_12
   - 228 p_down_8_12 <= 0
 non_overlap_up_8_12: h_var_12 - y_grid_var_8 + y_grid_var_12
   + 228 p_up_8_12 <= 228
 non_overlap_up_rev_8_12: - h_var_12 + y_grid_var_8 - y_grid_var_12
   - 228 p_up_8_12 <= 0
 non_overlap_any_8_13: p_left_8_13 + p_right_8_13 + p_down_8_13 + p_up_8_13
   >= 1
 non_overlap_left_8_13: w_var_8 + x_grid_var_8 - x_grid_var_13
   + 228 p_left_8_13 <= 228
 non_overlap_left_rev_8_13: - w_var_8 - x_grid_var_8 + x_grid_var_13
   - 228 p_left_8_13 <= 0
 non_overlap_right_8_13: w_var_13 - x_grid_var_8 + x_grid_var_13
   + 228 p_right_8_13 <= 228
 non_overlap_right_rev_8_13: - w_var_13 + x_grid_var_8 - x_grid_var_13
   - 228 p_right_8_13 <= 0
 non_overlap_down_8_13: h_var_8 + y_grid_var_8 - y_grid_var_13
   + 228 p_down_8_13 <= 228
 non_overlap_down_rev_8_13: - h_var_8 - y_grid_var_8 + y_grid_var_13
   - 228 p_down_8_13 <= 0
 non_overlap_up_8_13: h_var_13 - y_grid_var_8 + y_grid_var_13
   + 228 p_up_8_13 <= 228
 non_overlap_up_rev_8_13: - h_var_13 + y_grid_var_8 - y_grid_var_13
   - 228 p_up_8_13 <= 0
 non_overlap_any_8_14: p_left_8_14 + p_right_8_14 + p_down_8_14 + p_up_8_14
   >= 1
 non_overlap_left_8_14: w_var_8 + x_grid_var_8 - x_grid_var_14
   + 228 p_left_8_14 <= 228
 non_overlap_left_rev_8_14: - w_var_8 - x_grid_var_8 + x_grid_var_14
   - 228 p_left_8_14 <= 0
 non_overlap_right_8_14: w_var_14 - x_grid_var_8 + x_grid_var_14
   + 228 p_right_8_14 <= 228
 non_overlap_right_rev_8_14: - w_var_14 + x_grid_var_8 - x_grid_var_14
   - 228 p_right_8_14 <= 0
 non_overlap_down_8_14: h_var_8 + y_grid_var_8 - y_grid_var_14
   + 228 p_down_8_14 <= 228
 non_overlap_down_rev_8_14: - h_var_8 - y_grid_var_8 + y_grid_var_14
   - 228 p_down_8_14 <= 0
 non_overlap_up_8_14: h_var_14 - y_grid_var_8 + y_grid_var_14
   + 228 p_up_8_14 <= 228
 non_overlap_up_rev_8_14: - h_var_14 + y_grid_var_8 - y_grid_var_14
   - 228 p_up_8_14 <= 0
 non_overlap_any_9_10: p_left_9_10 + p_right_9_10 + p_down_9_10 + p_up_9_10
   >= 1
 non_overlap_left_9_10: w_var_9 + x_grid_var_9 - x_grid_var_10
   + 228 p_left_9_10 <= 228
 non_overlap_left_rev_9_10: - w_var_9 - x_grid_var_9 + x_grid_var_10
   - 228 p_left_9_10 <= 0
 non_overlap_right_9_10: w_var_10 - x_grid_var_9 + x_grid_var_10
   + 228 p_right_9_10 <= 228
 non_overlap_right_rev_9_10: - w_var_10 + x_grid_var_9 - x_grid_var_10
   - 228 p_right_9_10 <= 0
 non_overlap_down_9_10: h_var_9 + y_grid_var_9 - y_grid_var_10
   + 228 p_down_9_10 <= 228
 non_overlap_down_rev_9_10: - h_var_9 - y_grid_var_9 + y_grid_var_10
   - 228 p_down_9_10 <= 0
 non_overlap_up_9_10: h_var_10 - y_grid_var_9 + y_grid_var_10
   + 228 p_up_9_10 <= 228
 non_overlap_up_rev_9_10: - h_var_10 + y_grid_var_9 - y_grid_var_10
   - 228 p_up_9_10 <= 0
 non_overlap_any_9_11: p_left_9_11 + p_right_9_11 + p_down_9_11 + p_up_9_11
   >= 1
 non_overlap_left_9_11: w_var_9 + x_grid_var_9 - x_grid_var_11
   + 228 p_left_9_11 <= 228
 non_overlap_left_rev_9_11: - w_var_9 - x_grid_var_9 + x_grid_var_11
   - 228 p_left_9_11 <= 0
 non_overlap_right_9_11: w_var_11 - x_grid_var_9 + x_grid_var_11
   + 228 p_right_9_11 <= 228
 non_overlap_right_rev_9_11: - w_var_11 + x_grid_var_9 - x_grid_var_11
   - 228 p_right_9_11 <= 0
 non_overlap_down_9_11: h_var_9 + y_grid_var_9 - y_grid_var_11
   + 228 p_down_9_11 <= 228
 non_overlap_down_rev_9_11: - h_var_9 - y_grid_var_9 + y_grid_var_11
   - 228 p_down_9_11 <= 0
 non_overlap_up_9_11: h_var_11 - y_grid_var_9 + y_grid_var_11
   + 228 p_up_9_11 <= 228
 non_overlap_up_rev_9_11: - h_var_11 + y_grid_var_9 - y_grid_var_11
   - 228 p_up_9_11 <= 0
 non_overlap_any_9_12: p_left_9_12 + p_right_9_12 + p_down_9_12 + p_up_9_12
   >= 1
 non_overlap_left_9_12: w_var_9 + x_grid_var_9 - x_grid_var_12
   + 228 p_left_9_12 <= 228
 non_overlap_left_rev_9_12: - w_var_9 - x_grid_var_9 + x_grid_var_12
   - 228 p_left_9_12 <= 0
 non_overlap_right_9_12: w_var_12 - x_grid_var_9 + x_grid_var_12
   + 228 p_right_9_12 <= 228
 non_overlap_right_rev_9_12: - w_var_12 + x_grid_var_9 - x_grid_var_12
   - 228 p_right_9_12 <= 0
 non_overlap_down_9_12: h_var_9 + y_grid_var_9 - y_grid_var_12
   + 228 p_down_9_12 <= 228
 non_overlap_down_rev_9_12: - h_var_9 - y_grid_var_9 + y_grid_var_12
   - 228 p_down_9_12 <= 0
 non_overlap_up_9_12: h_var_12 - y_grid_var_9 + y_grid_var_12
   + 228 p_up_9_12 <= 228
 non_overlap_up_rev_9_12: - h_var_12 + y_grid_var_9 - y_grid_var_12
   - 228 p_up_9_12 <= 0
 non_overlap_any_9_13: p_left_9_13 + p_right_9_13 + p_down_9_13 + p_up_9_13
   >= 1
 non_overlap_left_9_13: w_var_9 + x_grid_var_9 - x_grid_var_13
   + 228 p_left_9_13 <= 228
 non_overlap_left_rev_9_13: - w_var_9 - x_grid_var_9 + x_grid_var_13
   - 228 p_left_9_13 <= 0
 non_overlap_right_9_13: w_var_13 - x_grid_var_9 + x_grid_var_13
   + 228 p_right_9_13 <= 228
 non_overlap_right_rev_9_13: - w_var_13 + x_grid_var_9 - x_grid_var_13
   - 228 p_right_9_13 <= 0
 non_overlap_down_9_13: h_var_9 + y_grid_var_9 - y_grid_var_13
   + 228 p_down_9_13 <= 228
 non_overlap_down_rev_9_13: - h_var_9 - y_grid_var_9 + y_grid_var_13
   - 228 p_down_9_13 <= 0
 non_overlap_up_9_13: h_var_13 - y_grid_var_9 + y_grid_var_13
   + 228 p_up_9_13 <= 228
 non_overlap_up_rev_9_13: - h_var_13 + y_grid_var_9 - y_grid_var_13
   - 228 p_up_9_13 <= 0
 non_overlap_any_9_14: p_left_9_14 + p_right_9_14 + p_down_9_14 + p_up_9_14
   >= 1
 non_overlap_left_9_14: w_var_9 + x_grid_var_9 - x_grid_var_14
   + 228 p_left_9_14 <= 228
 non_overlap_left_rev_9_14: - w_var_9 - x_grid_var_9 + x_grid_var_14
   - 228 p_left_9_14 <= 0
 non_overlap_right_9_14: w_var_14 - x_grid_var_9 + x_grid_var_14
   + 228 p_right_9_14 <= 228
 non_overlap_right_rev_9_14: - w_var_14 + x_grid_var_9 - x_grid_var_14
   - 228 p_right_9_14 <= 0
 non_overlap_down_9_14: h_var_9 + y_grid_var_9 - y_grid_var_14
   + 228 p_down_9_14 <= 228
 non_overlap_down_rev_9_14: - h_var_9 - y_grid_var_9 + y_grid_var_14
   - 228 p_down_9_14 <= 0
 non_overlap_up_9_14: h_var_14 - y_grid_var_9 + y_grid_var_14
   + 228 p_up_9_14 <= 228
 non_overlap_up_rev_9_14: - h_var_14 + y_grid_var_9 - y_grid_var_14
   - 228 p_up_9_14 <= 0
 non_overlap_any_10_11: p_left_10_11 + p_right_10_11 + p_down_10_11
   + p_up_10_11 >= 1
 non_overlap_left_10_11: w_var_10 + x_grid_var_10 - x_grid_var_11
   + 228 p_left_10_11 <= 228
 non_overlap_left_rev_10_11: - w_var_10 - x_grid_var_10 + x_grid_var_11
   - 228 p_left_10_11 <= 0
 non_overlap_right_10_11: w_var_11 - x_grid_var_10 + x_grid_var_11
   + 228 p_right_10_11 <= 228
 non_overlap_right_rev_10_11: - w_var_11 + x_grid_var_10 - x_grid_var_11
   - 228 p_right_10_11 <= 0
 non_overlap_down_10_11: h_var_10 + y_grid_var_10 - y_grid_var_11
   + 228 p_down_10_11 <= 228
 non_overlap_down_rev_10_11: - h_var_10 - y_grid_var_10 + y_grid_var_11
   - 228 p_down_10_11 <= 0
 non_overlap_up_10_11: h_var_11 - y_grid_var_10 + y_grid_var_11
   + 228 p_up_10_11 <= 228
 non_overlap_up_rev_10_11: - h_var_11 + y_grid_var_10 - y_grid_var_11
   - 228 p_up_10_11 <= 0
 non_overlap_any_10_12: p_left_10_12 + p_right_10_12 + p_down_10_12
   + p_up_10_12 >= 1
 non_overlap_left_10_12: w_var_10 + x_grid_var_10 - x_grid_var_12
   + 228 p_left_10_12 <= 228
 non_overlap_left_rev_10_12: - w_var_10 - x_grid_var_10 + x_grid_var_12
   - 228 p_left_10_12 <= 0
 non_overlap_right_10_12: w_var_12 - x_grid_var_10 + x_grid_var_12
   + 228 p_right_10_12 <= 228
 non_overlap_right_rev_10_12: - w_var_12 + x_grid_var_10 - x_grid_var_12
   - 228 p_right_10_12 <= 0
 non_overlap_down_10_12: h_var_10 + y_grid_var_10 - y_grid_var_12
   + 228 p_down_10_12 <= 228
 non_overlap_down_rev_10_12: - h_var_10 - y_grid_var_10 + y_grid_var_12
   - 228 p_down_10_12 <= 0
 non_overlap_up_10_12: h_var_12 - y_grid_var_10 + y_grid_var_12
   + 228 p_up_10_12 <= 228
 non_overlap_up_rev_10_12: - h_var_12 + y_grid_var_10 - y_grid_var_12
   - 228 p_up_10_12 <= 0
 non_overlap_any_10_13: p_left_10_13 + p_right_10_13 + p_down_10_13
   + p_up_10_13 >= 1
 non_overlap_left_10_13: w_var_10 + x_grid_var_10 - x_grid_var_13
   + 228 p_left_10_13 <= 228
 non_overlap_left_rev_10_13: - w_var_10 - x_grid_var_10 + x_grid_var_13
   - 228 p_left_10_13 <= 0
 non_overlap_right_10_13: w_var_13 - x_grid_var_10 + x_grid_var_13
   + 228 p_right_10_13 <= 228
 non_overlap_right_rev_10_13: - w_var_13 + x_grid_var_10 - x_grid_var_13
   - 228 p_right_10_13 <= 0
 non_overlap_down_10_13: h_var_10 + y_grid_var_10 - y_grid_var_13
   + 228 p_down_10_13 <= 228
 non_overlap_down_rev_10_13: - h_var_10 - y_grid_var_10 + y_grid_var_13
   - 228 p_down_10_13 <= 0
 non_overlap_up_10_13: h_var_13 - y_grid_var_10 + y_grid_var_13
   + 228 p_up_10_13 <= 228
 non_overlap_up_rev_10_13: - h_var_13 + y_grid_var_10 - y_grid_var_13
   - 228 p_up_10_13 <= 0
 non_overlap_any_10_14: p_left_10_14 + p_right_10_14 + p_down_10_14
   + p_up_10_14 >= 1
 non_overlap_left_10_14: w_var_10 + x_grid_var_10 - x_grid_var_14
   + 228 p_left_10_14 <= 228
 non_overlap_left_rev_10_14: - w_var_10 - x_grid_var_10 + x_grid_var_14
   - 228 p_left_10_14 <= 0
 non_overlap_right_10_14: w_var_14 - x_grid_var_10 + x_grid_var_14
   + 228 p_right_10_14 <= 228
 non_overlap_right_rev_10_14: - w_var_14 + x_grid_var_10 - x_grid_var_14
   - 228 p_right_10_14 <= 0
 non_overlap_down_10_14: h_var_10 + y_grid_var_10 - y_grid_var_14
   + 228 p_down_10_14 <= 228
 non_overlap_down_rev_10_14: - h_var_10 - y_grid_var_10 + y_grid_var_14
   - 228 p_down_10_14 <= 0
 non_overlap_up_10_14: h_var_14 - y_grid_var_10 + y_grid_var_14
   + 228 p_up_10_14 <= 228
 non_overlap_up_rev_10_14: - h_var_14 + y_grid_var_10 - y_grid_var_14
   - 228 p_up_10_14 <= 0
 non_overlap_any_11_12: p_left_11_12 + p_right_11_12 + p_down_11_12
   + p_up_11_12 >= 1
 non_overlap_left_11_12: w_var_11 + x_grid_var_11 - x_grid_var_12
   + 228 p_left_11_12 <= 228
 non_overlap_left_rev_11_12: - w_var_11 - x_grid_var_11 + x_grid_var_12
   - 228 p_left_11_12 <= 0
 non_overlap_right_11_12: w_var_12 - x_grid_var_11 + x_grid_var_12
   + 228 p_right_11_12 <= 228
 non_overlap_right_rev_11_12: - w_var_12 + x_grid_var_11 - x_grid_var_12
   - 228 p_right_11_12 <= 0
 non_overlap_down_11_12: h_var_11 + y_grid_var_11 - y_grid_var_12
   + 228 p_down_11_12 <= 228
 non_overlap_down_rev_11_12: - h_var_11 - y_grid_var_11 + y_grid_var_12
   - 228 p_down_11_12 <= 0
 non_overlap_up_11_12: h_var_12 - y_grid_var_11 + y_grid_var_12
   + 228 p_up_11_12 <= 228
 non_overlap_up_rev_11_12: - h_var_12 + y_grid_var_11 - y_grid_var_12
   - 228 p_up_11_12 <= 0
 non_overlap_any_11_13: p_left_11_13 + p_right_11_13 + p_down_11_13
   + p_up_11_13 >= 1
 non_overlap_left_11_13: w_var_11 + x_grid_var_11 - x_grid_var_13
   + 228 p_left_11_13 <= 228
 non_overlap_left_rev_11_13: - w_var_11 - x_grid_var_11 + x_grid_var_13
   - 228 p_left_11_13 <= 0
 non_overlap_right_11_13: w_var_13 - x_grid_var_11 + x_grid_var_13
   + 228 p_right_11_13 <= 228
 non_overlap_right_rev_11_13: - w_var_13 + x_grid_var_11 - x_grid_var_13
   - 228 p_right_11_13 <= 0
 non_overlap_down_11_13: h_var_11 + y_grid_var_11 - y_grid_var_13
   + 228 p_down_11_13 <= 228
 non_overlap_down_rev_11_13: - h_var_11 - y_grid_var_11 + y_grid_var_13
   - 228 p_down_11_13 <= 0
 non_overlap_up_11_13: h_var_13 - y_grid_var_11 + y_grid_var_13
   + 228 p_up_11_13 <= 228
 non_overlap_up_rev_11_13: - h_var_13 + y_grid_var_11 - y_grid_var_13
   - 228 p_up_11_13 <= 0
 non_overlap_any_11_14: p_left_11_14 + p_right_11_14 + p_down_11_14
   + p_up_11_14 >= 1
 non_overlap_left_11_14: w_var_11 + x_grid_var_11 - x_grid_var_14
   + 228 p_left_11_14 <= 228
 non_overlap_left_rev_11_14: - w_var_11 - x_grid_var_11 + x_grid_var_14
   - 228 p_left_11_14 <= 0
 non_overlap_right_11_14: w_var_14 - x_grid_var_11 + x_grid_var_14
   + 228 p_right_11_14 <= 228
 non_overlap_right_rev_11_14: - w_var_14 + x_grid_var_11 - x_grid_var_14
   - 228 p_right_11_14 <= 0
 non_overlap_down_11_14: h_var_11 + y_grid_var_11 - y_grid_var_14
   + 228 p_down_11_14 <= 228
 non_overlap_down_rev_11_14: - h_var_11 - y_grid_var_11 + y_grid_var_14
   - 228 p_down_11_14 <= 0
 non_overlap_up_11_14: h_var_14 - y_grid_var_11 + y_grid_var_14
   + 228 p_up_11_14 <= 228
 non_overlap_up_rev_11_14: - h_var_14 + y_grid_var_11 - y_grid_var_14
   - 228 p_up_11_14 <= 0
 non_overlap_any_12_13: p_left_12_13 + p_right_12_13 + p_down_12_13
   + p_up_12_13 >= 1
 non_overlap_left_12_13: w_var_12 + x_grid_var_12 - x_grid_var_13
   + 228 p_left_12_13 <= 228
 non_overlap_left_rev_12_13: - w_var_12 - x_grid_var_12 + x_grid_var_13
   - 228 p_left_12_13 <= 0
 non_overlap_right_12_13: w_var_13 - x_grid_var_12 + x_grid_var_13
   + 228 p_right_12_13 <= 228
 non_overlap_right_rev_12_13: - w_var_13 + x_grid_var_12 - x_grid_var_13
   - 228 p_right_12_13 <= 0
 non_overlap_down_12_13: h_var_12 + y_grid_var_12 - y_grid_var_13
   + 228 p_down_12_13 <= 228
 non_overlap_down_rev_12_13: - h_var_12 - y_grid_var_12 + y_grid_var_13
   - 228 p_down_12_13 <= 0
 non_overlap_up_12_13: h_var_13 - y_grid_var_12 + y_grid_var_13
   + 228 p_up_12_13 <= 228
 non_overlap_up_rev_12_13: - h_var_13 + y_grid_var_12 - y_grid_var_13
   - 228 p_up_12_13 <= 0
 non_overlap_any_12_14: p_left_12_14 + p_right_12_14 + p_down_12_14
   + p_up_12_14 >= 1
 non_overlap_left_12_14: w_var_12 + x_grid_var_12 - x_grid_var_14
   + 228 p_left_12_14 <= 228
 non_overlap_left_rev_12_14: - w_var_12 - x_grid_var_12 + x_grid_var_14
   - 228 p_left_12_14 <= 0
 non_overlap_right_12_14: w_var_14 - x_grid_var_12 + x_grid_var_14
   + 228 p_right_12_14 <= 228
 non_overlap_right_rev_12_14: - w_var_14 + x_grid_var_12 - x_grid_var_14
   - 228 p_right_12_14 <= 0
 non_overlap_down_12_14: h_var_12 + y_grid_var_12 - y_grid_var_14
   + 228 p_down_12_14 <= 228
 non_overlap_down_rev_12_14: - h_var_12 - y_grid_var_12 + y_grid_var_14
   - 228 p_down_12_14 <= 0
 non_overlap_up_12_14: h_var_14 - y_grid_var_12 + y_grid_var_14
   + 228 p_up_12_14 <= 228
 non_overlap_up_rev_12_14: - h_var_14 + y_grid_var_12 - y_grid_var_14
   - 228 p_up_12_14 <= 0
 non_overlap_any_13_14: p_left_13_14 + p_right_13_14 + p_down_13_14
   + p_up_13_14 >= 1
 non_overlap_left_13_14: w_var_13 + x_grid_var_13 - x_grid_var_14
   + 228 p_left_13_14 <= 228
 non_overlap_left_rev_13_14: - w_var_13 - x_grid_var_13 + x_grid_var_14
   - 228 p_left_13_14 <= 0
 non_overlap_right_13_14: w_var_14 - x_grid_var_13 + x_grid_var_14
   + 228 p_right_13_14 <= 228
 non_overlap_right_rev_13_14: - w_var_14 + x_grid_var_13 - x_grid_var_14
   - 228 p_right_13_14 <= 0
 non_overlap_down_13_14: h_var_13 + y_grid_var_13 - y_grid_var_14
   + 228 p_down_13_14 <= 228
 non_overlap_down_rev_13_14: - h_var_13 - y_grid_var_13 + y_grid_var_14
   - 228 p_down_13_14 <= 0
 non_overlap_up_13_14: h_var_14 - y_grid_var_13 + y_grid_var_14
   + 228 p_up_13_14 <= 228
 non_overlap_up_rev_13_14: - h_var_14 + y_grid_var_13 - y_grid_var_14
   - 228 p_up_13_14 <= 0
 EMIB_non_overlap_any_0_7_0_9: p_EMIB_left_0_7_0_9 + p_EMIB_right_0_7_0_9
   + p_EMIB_down_0_7_0_9 + p_EMIB_up_0_7_0_9 >= 1
 EMIB_non_overlap_left_0_7_0_9: EMIB_w_var_0_7 + EMIB_x_grid_var_0_7
   - EMIB_x_grid_var_0_9 + 228 p_EMIB_left_0_7_0_9 <= 228
 EMIB_non_overlap_left_rev_0_7_0_9: - EMIB_w_var_0_7 - EMIB_x_grid_var_0_7
   + EMIB_x_grid_var_0_9 - 228 p_EMIB_left_0_7_0_9 <= 0
 EMIB_non_overlap_right_0_7_0_9: EMIB_w_var_0_9 - EMIB_x_grid_var_0_7
   + EMIB_x_grid_var_0_9 + 228 p_EMIB_right_0_7_0_9 <= 228
 EMIB_non_overlap_right_rev_0_7_0_9: - EMIB_w_var_0_9 + EMIB_x_grid_var_0_7
   - EMIB_x_grid_var_0_9 - 228 p_EMIB_right_0_7_0_9 <= 0
 EMIB_non_overlap_down_0_7_0_9: EMIB_h_var_0_7 + EMIB_y_grid_var_0_7
   - EMIB_y_grid_var_0_9 + 228 p_EMIB_down_0_7_0_9 <= 228
 EMIB_non_overlap_down_rev_0_7_0_9: - EMIB_h_var_0_7 - EMIB_y_grid_var_0_7
   + EMIB_y_grid_var_0_9 - 228 p_EMIB_down_0_7_0_9 <= 0
 EMIB_non_overlap_up_0_7_0_9: EMIB_h_var_0_9 - EMIB_y_grid_var_0_7
   + EMIB_y_grid_var_0_9 + 228 p_EMIB_up_0_7_0_9 <= 228
 EMIB_non_overlap_up_rev_0_7_0_9: - EMIB_h_var_0_9 + EMIB_y_grid_var_0_7
   - EMIB_y_grid_var_0_9 - 228 p_EMIB_up_0_7_0_9 <= 0
 EMIB_non_overlap_any_0_7_5_7: p_EMIB_left_0_7_5_7 + p_EMIB_right_0_7_5_7
   + p_EMIB_down_0_7_5_7 + p_EMIB_up_0_7_5_7 >= 1
 EMIB_non_overlap_left_0_7_5_7: EMIB_w_var_0_7 + EMIB_x_grid_var_0_7
   - EMIB_x_grid_var_5_7 + 228 p_EMIB_left_0_7_5_7 <= 228
 EMIB_non_overlap_left_rev_0_7_5_7: - EMIB_w_var_0_7 - EMIB_x_grid_var_0_7
   + EMIB_x_grid_var_5_7 - 228 p_EMIB_left_0_7_5_7 <= 0
 EMIB_non_overlap_right_0_7_5_7: EMIB_w_var_5_7 - EMIB_x_grid_var_0_7
   + EMIB_x_grid_var_5_7 + 228 p_EMIB_right_0_7_5_7 <= 228
 EMIB_non_overlap_right_rev_0_7_5_7: - EMIB_w_var_5_7 + EMIB_x_grid_var_0_7
   - EMIB_x_grid_var_5_7 - 228 p_EMIB_right_0_7_5_7 <= 0
 EMIB_non_overlap_down_0_7_5_7: EMIB_h_var_0_7 + EMIB_y_grid_var_0_7
   - EMIB_y_grid_var_5_7 + 228 p_EMIB_down_0_7_5_7 <= 228
 EMIB_non_overlap_down_rev_0_7_5_7: - EMIB_h_var_0_7 - EMIB_y_grid_var_0_7
   + EMIB_y_grid_var_5_7 - 228 p_EMIB_down_0_7_5_7 <= 0
 EMIB_non_overlap_up_0_7_5_7: EMIB_h_var_5_7 - EMIB_y_grid_var_0_7
   + EMIB_y_grid_var_5_7 + 228 p_EMIB_up_0_7_5_7 <= 228
 EMIB_non_overlap_up_rev_0_7_5_7: - EMIB_h_var_5_7 + EMIB_y_grid_var_0_7
   - EMIB_y_grid_var_5_7 - 228 p_EMIB_up_0_7_5_7 <= 0
 EMIB_non_overlap_any_0_7_7_13: p_EMIB_left_0_7_7_13
   + p_EMIB_right_0_7_7_13 + p_EMIB_down_0_7_7_13 + p_EMIB_up_0_7_7_13
   >= 1
 EMIB_non_overlap_left_0_7_7_13: EMIB_w_var_0_7 + EMIB_x_grid_var_0_7
   - EMIB_x_grid_var_7_13 + 228 p_EMIB_left_0_7_7_13 <= 228
 EMIB_non_overlap_left_rev_0_7_7_13: - EMIB_w_var_0_7 - EMIB_x_grid_var_0_7
   + EMIB_x_grid_var_7_13 - 228 p_EMIB_left_0_7_7_13 <= 0
 EMIB_non_overlap_right_0_7_7_13: EMIB_w_var_7_13 - EMIB_x_grid_var_0_7
   + EMIB_x_grid_var_7_13 + 228 p_EMIB_right_0_7_7_13 <= 228
 EMIB_non_overlap_right_rev_0_7_7_13: - EMIB_w_var_7_13
   + EMIB_x_grid_var_0_7 - EMIB_x_grid_var_7_13 - 228 p_EMIB_right_0_7_7_13
   <= 0
 EMIB_non_overlap_down_0_7_7_13: EMIB_h_var_0_7 + EMIB_y_grid_var_0_7
   - EMIB_y_grid_var_7_13 + 228 p_EMIB_down_0_7_7_13 <= 228
 EMIB_non_overlap_down_rev_0_7_7_13: - EMIB_h_var_0_7 - EMIB_y_grid_var_0_7
   + EMIB_y_grid_var_7_13 - 228 p_EMIB_down_0_7_7_13 <= 0
 EMIB_non_overlap_up_0_7_7_13: EMIB_h_var_7_13 - EMIB_y_grid_var_0_7
   + EMIB_y_grid_var_7_13 + 228 p_EMIB_up_0_7_7_13 <= 228
 EMIB_non_overlap_up_rev_0_7_7_13: - EMIB_h_var_7_13 + EMIB_y_grid_var_0_7
   - EMIB_y_grid_var_7_13 - 228 p_EMIB_up_0_7_7_13 <= 0
 EMIB_non_overlap_any_0_7_7_14: p_EMIB_left_0_7_7_14
   + p_EMIB_right_0_7_7_14 + p_EMIB_down_0_7_7_14 + p_EMIB_up_0_7_7_14
   >= 1
 EMIB_non_overlap_left_0_7_7_14: EMIB_w_var_0_7 + EMIB_x_grid_var_0_7
   - EMIB_x_grid_var_7_14 + 228 p_EMIB_left_0_7_7_14 <= 228
 EMIB_non_overlap_left_rev_0_7_7_14: - EMIB_w_var_0_7 - EMIB_x_grid_var_0_7
   + EMIB_x_grid_var_7_14 - 228 p_EMIB_left_0_7_7_14 <= 0
 EMIB_non_overlap_right_0_7_7_14: EMIB_w_var_7_14 - EMIB_x_grid_var_0_7
   + EMIB_x_grid_var_7_14 + 228 p_EMIB_right_0_7_7_14 <= 228
 EMIB_non_overlap_right_rev_0_7_7_14: - EMIB_w_var_7_14
   + EMIB_x_grid_var_0_7 - EMIB_x_grid_var_7_14 - 228 p_EMIB_right_0_7_7_14
   <= 0
 EMIB_non_overlap_down_0_7_7_14: EMIB_h_var_0_7 + EMIB_y_grid_var_0_7
   - EMIB_y_grid_var_7_14 + 228 p_EMIB_down_0_7_7_14 <= 228
 EMIB_non_overlap_down_rev_0_7_7_14: - EMIB_h_var_0_7 - EMIB_y_grid_var_0_7
   + EMIB_y_grid_var_7_14 - 228 p_EMIB_down_0_7_7_14 <= 0
 EMIB_non_overlap_up_0_7_7_14: EMIB_h_var_7_14 - EMIB_y_grid_var_0_7
   + EMIB_y_grid_var_7_14 + 228 p_EMIB_up_0_7_7_14 <= 228
 EMIB_non_overlap_up_rev_0_7_7_14: - EMIB_h_var_7_14 + EMIB_y_grid_var_0_7
   - EMIB_y_grid_var_7_14 - 228 p_EMIB_up_0_7_7_14 <= 0
 EMIB_non_overlap_any_0_9_5_9: p_EMIB_left_0_9_5_9 + p_EMIB_right_0_9_5_9
   + p_EMIB_down_0_9_5_9 + p_EMIB_up_0_9_5_9 >= 1
 EMIB_non_overlap_left_0_9_5_9: EMIB_w_var_0_9 + EMIB_x_grid_var_0_9
   - EMIB_x_grid_var_5_9 + 228 p_EMIB_left_0_9_5_9 <= 228
 EMIB_non_overlap_left_rev_0_9_5_9: - EMIB_w_var_0_9 - EMIB_x_grid_var_0_9
   + EMIB_x_grid_var_5_9 - 228 p_EMIB_left_0_9_5_9 <= 0
 EMIB_non_overlap_right_0_9_5_9: EMIB_w_var_5_9 - EMIB_x_grid_var_0_9
   + EMIB_x_grid_var_5_9 + 228 p_EMIB_right_0_9_5_9 <= 228
 EMIB_non_overlap_right_rev_0_9_5_9: - EMIB_w_var_5_9 + EMIB_x_grid_var_0_9
   - EMIB_x_grid_var_5_9 - 228 p_EMIB_right_0_9_5_9 <= 0
 EMIB_non_overlap_down_0_9_5_9: EMIB_h_var_0_9 + EMIB_y_grid_var_0_9
   - EMIB_y_grid_var_5_9 + 228 p_EMIB_down_0_9_5_9 <= 228
 EMIB_non_overlap_down_rev_0_9_5_9: - EMIB_h_var_0_9 - EMIB_y_grid_var_0_9
   + EMIB_y_grid_var_5_9 - 228 p_EMIB_down_0_9_5_9 <= 0
 EMIB_non_overlap_up_0_9_5_9: EMIB_h_var_5_9 - EMIB_y_grid_var_0_9
   + EMIB_y_grid_var_5_9 + 228 p_EMIB_up_0_9_5_9 <= 228
 EMIB_non_overlap_up_rev_0_9_5_9: - EMIB_h_var_5_9 + EMIB_y_grid_var_0_9
   - EMIB_y_grid_var_5_9 - 228 p_EMIB_up_0_9_5_9 <= 0
 EMIB_non_overlap_any_0_9_9_14: p_EMIB_left_0_9_9_14
   + p_EMIB_right_0_9_9_14 + p_EMIB_down_0_9_9_14 + p_EMIB_up_0_9_9_14
   >= 1
 EMIB_non_overlap_left_0_9_9_14: EMIB_w_var_0_9 + EMIB_x_grid_var_0_9
   - EMIB_x_grid_var_9_14 + 228 p_EMIB_left_0_9_9_14 <= 228
 EMIB_non_overlap_left_rev_0_9_9_14: - EMIB_w_var_0_9 - EMIB_x_grid_var_0_9
   + EMIB_x_grid_var_9_14 - 228 p_EMIB_left_0_9_9_14 <= 0
 EMIB_non_overlap_right_0_9_9_14: EMIB_w_var_9_14 - EMIB_x_grid_var_0_9
   + EMIB_x_grid_var_9_14 + 228 p_EMIB_right_0_9_9_14 <= 228
 EMIB_non_overlap_right_rev_0_9_9_14: - EMIB_w_var_9_14
   + EMIB_x_grid_var_0_9 - EMIB_x_grid_var_9_14 - 228 p_EMIB_right_0_9_9_14
   <= 0
 EMIB_non_overlap_down_0_9_9_14: EMIB_h_var_0_9 + EMIB_y_grid_var_0_9
   - EMIB_y_grid_var_9_14 + 228 p_EMIB_down_0_9_9_14 <= 228
 EMIB_non_overlap_down_rev_0_9_9_14: - EMIB_h_var_0_9 - EMIB_y_grid_var_0_9
   + EMIB_y_grid_var_9_14 - 228 p_EMIB_down_0_9_9_14 <= 0
 EMIB_non_overlap_up_0_9_9_14: EMIB_h_var_9_14 - EMIB_y_grid_var_0_9
   + EMIB_y_grid_var_9_14 + 228 p_EMIB_up_0_9_9_14 <= 228
 EMIB_non_overlap_up_rev_0_9_9_14: - EMIB_h_var_9_14 + EMIB_y_grid_var_0_9
   - EMIB_y_grid_var_9_14 - 228 p_EMIB_up_0_9_9_14 <= 0
 EMIB_non_overlap_any_1_4_1_8: p_EMIB_left_1_4_1_8 + p_EMIB_right_1_4_1_8
   + p_EMIB_down_1_4_1_8 + p_EMIB_up_1_4_1_8 >= 1
 EMIB_non_overlap_left_1_4_1_8: EMIB_w_var_1_4 + EMIB_x_grid_var_1_4
   - EMIB_x_grid_var_1_8 + 228 p_EMIB_left_1_4_1_8 <= 228
 EMIB_non_overlap_left_rev_1_4_1_8: - EMIB_w_var_1_4 - EMIB_x_grid_var_1_4
   + EMIB_x_grid_var_1_8 - 228 p_EMIB_left_1_4_1_8 <= 0
 EMIB_non_overlap_right_1_4_1_8: EMIB_w_var_1_8 - EMIB_x_grid_var_1_4
   + EMIB_x_grid_var_1_8 + 228 p_EMIB_right_1_4_1_8 <= 228
 EMIB_non_overlap_right_rev_1_4_1_8: - EMIB_w_var_1_8 + EMIB_x_grid_var_1_4
   - EMIB_x_grid_var_1_8 - 228 p_EMIB_right_1_4_1_8 <= 0
 EMIB_non_overlap_down_1_4_1_8: EMIB_h_var_1_4 + EMIB_y_grid_var_1_4
   - EMIB_y_grid_var_1_8 + 228 p_EMIB_down_1_4_1_8 <= 228
 EMIB_non_overlap_down_rev_1_4_1_8: - EMIB_h_var_1_4 - EMIB_y_grid_var_1_4
   + EMIB_y_grid_var_1_8 - 228 p_EMIB_down_1_4_1_8 <= 0
 EMIB_non_overlap_up_1_4_1_8: EMIB_h_var_1_8 - EMIB_y_grid_var_1_4
   + EMIB_y_grid_var_1_8 + 228 p_EMIB_up_1_4_1_8 <= 228
 EMIB_non_overlap_up_rev_1_4_1_8: - EMIB_h_var_1_8 + EMIB_y_grid_var_1_4
   - EMIB_y_grid_var_1_8 - 228 p_EMIB_up_1_4_1_8 <= 0
 EMIB_non_overlap_any_1_4_1_11: p_EMIB_left_1_4_1_11
   + p_EMIB_right_1_4_1_11 + p_EMIB_down_1_4_1_11 + p_EMIB_up_1_4_1_11
   >= 1
 EMIB_non_overlap_left_1_4_1_11: EMIB_w_var_1_4 + EMIB_x_grid_var_1_4
   - EMIB_x_grid_var_1_11 + 228 p_EMIB_left_1_4_1_11 <= 228
 EMIB_non_overlap_left_rev_1_4_1_11: - EMIB_w_var_1_4 - EMIB_x_grid_var_1_4
   + EMIB_x_grid_var_1_11 - 228 p_EMIB_left_1_4_1_11 <= 0
 EMIB_non_overlap_right_1_4_1_11: EMIB_w_var_1_11 - EMIB_x_grid_var_1_4
   + EMIB_x_grid_var_1_11 + 228 p_EMIB_right_1_4_1_11 <= 228
 EMIB_non_overlap_right_rev_1_4_1_11: - EMIB_w_var_1_11
   + EMIB_x_grid_var_1_4 - EMIB_x_grid_var_1_11 - 228 p_EMIB_right_1_4_1_11
   <= 0
 EMIB_non_overlap_down_1_4_1_11: EMIB_h_var_1_4 + EMIB_y_grid_var_1_4
   - EMIB_y_grid_var_1_11 + 228 p_EMIB_down_1_4_1_11 <= 228
 EMIB_non_overlap_down_rev_1_4_1_11: - EMIB_h_var_1_4 - EMIB_y_grid_var_1_4
   + EMIB_y_grid_var_1_11 - 228 p_EMIB_down_1_4_1_11 <= 0
 EMIB_non_overlap_up_1_4_1_11: EMIB_h_var_1_11 - EMIB_y_grid_var_1_4
   + EMIB_y_grid_var_1_11 + 228 p_EMIB_up_1_4_1_11 <= 228
 EMIB_non_overlap_up_rev_1_4_1_11: - EMIB_h_var_1_11 + EMIB_y_grid_var_1_4
   - EMIB_y_grid_var_1_11 - 228 p_EMIB_up_1_4_1_11 <= 0
 EMIB_non_overlap_any_1_4_1_13: p_EMIB_left_1_4_1_13
   + p_EMIB_right_1_4_1_13 + p_EMIB_down_1_4_1_13 + p_EMIB_up_1_4_1_13
   >= 1
 EMIB_non_overlap_left_1_4_1_13: EMIB_w_var_1_4 + EMIB_x_grid_var_1_4
   - EMIB_x_grid_var_1_13 + 228 p_EMIB_left_1_4_1_13 <= 228
 EMIB_non_overlap_left_rev_1_4_1_13: - EMIB_w_var_1_4 - EMIB_x_grid_var_1_4
   + EMIB_x_grid_var_1_13 - 228 p_EMIB_left_1_4_1_13 <= 0
 EMIB_non_overlap_right_1_4_1_13: EMIB_w_var_1_13 - EMIB_x_grid_var_1_4
   + EMIB_x_grid_var_1_13 + 228 p_EMIB_right_1_4_1_13 <= 228
 EMIB_non_overlap_right_rev_1_4_1_13: - EMIB_w_var_1_13
   + EMIB_x_grid_var_1_4 - EMIB_x_grid_var_1_13 - 228 p_EMIB_right_1_4_1_13
   <= 0
 EMIB_non_overlap_down_1_4_1_13: EMIB_h_var_1_4 + EMIB_y_grid_var_1_4
   - EMIB_y_grid_var_1_13 + 228 p_EMIB_down_1_4_1_13 <= 228
 EMIB_non_overlap_down_rev_1_4_1_13: - EMIB_h_var_1_4 - EMIB_y_grid_var_1_4
   + EMIB_y_grid_var_1_13 - 228 p_EMIB_down_1_4_1_13 <= 0
 EMIB_non_overlap_up_1_4_1_13: EMIB_h_var_1_13 - EMIB_y_grid_var_1_4
   + EMIB_y_grid_var_1_13 + 228 p_EMIB_up_1_4_1_13 <= 228
 EMIB_non_overlap_up_rev_1_4_1_13: - EMIB_h_var_1_13 + EMIB_y_grid_var_1_4
   - EMIB_y_grid_var_1_13 - 228 p_EMIB_up_1_4_1_13 <= 0
 EMIB_non_overlap_any_1_8_1_11: p_EMIB_left_1_8_1_11
   + p_EMIB_right_1_8_1_11 + p_EMIB_down_1_8_1_11 + p_EMIB_up_1_8_1_11
   >= 1
 EMIB_non_overlap_left_1_8_1_11: EMIB_w_var_1_8 + EMIB_x_grid_var_1_8
   - EMIB_x_grid_var_1_11 + 228 p_EMIB_left_1_8_1_11 <= 228
 EMIB_non_overlap_left_rev_1_8_1_11: - EMIB_w_var_1_8 - EMIB_x_grid_var_1_8
   + EMIB_x_grid_var_1_11 - 228 p_EMIB_left_1_8_1_11 <= 0
 EMIB_non_overlap_right_1_8_1_11: EMIB_w_var_1_11 - EMIB_x_grid_var_1_8
   + EMIB_x_grid_var_1_11 + 228 p_EMIB_right_1_8_1_11 <= 228
 EMIB_non_overlap_right_rev_1_8_1_11: - EMIB_w_var_1_11
   + EMIB_x_grid_var_1_8 - EMIB_x_grid_var_1_11 - 228 p_EMIB_right_1_8_1_11
   <= 0
 EMIB_non_overlap_down_1_8_1_11: EMIB_h_var_1_8 + EMIB_y_grid_var_1_8
   - EMIB_y_grid_var_1_11 + 228 p_EMIB_down_1_8_1_11 <= 228
 EMIB_non_overlap_down_rev_1_8_1_11: - EMIB_h_var_1_8 - EMIB_y_grid_var_1_8
   + EMIB_y_grid_var_1_11 - 228 p_EMIB_down_1_8_1_11 <= 0
 EMIB_non_overlap_up_1_8_1_11: EMIB_h_var_1_11 - EMIB_y_grid_var_1_8
   + EMIB_y_grid_var_1_11 + 228 p_EMIB_up_1_8_1_11 <= 228
 EMIB_non_overlap_up_rev_1_8_1_11: - EMIB_h_var_1_11 + EMIB_y_grid_var_1_8
   - EMIB_y_grid_var_1_11 - 228 p_EMIB_up_1_8_1_11 <= 0
 EMIB_non_overlap_any_1_8_1_13: p_EMIB_left_1_8_1_13
   + p_EMIB_right_1_8_1_13 + p_EMIB_down_1_8_1_13 + p_EMIB_up_1_8_1_13
   >= 1
 EMIB_non_overlap_left_1_8_1_13: EMIB_w_var_1_8 + EMIB_x_grid_var_1_8
   - EMIB_x_grid_var_1_13 + 228 p_EMIB_left_1_8_1_13 <= 228
 EMIB_non_overlap_left_rev_1_8_1_13: - EMIB_w_var_1_8 - EMIB_x_grid_var_1_8
   + EMIB_x_grid_var_1_13 - 228 p_EMIB_left_1_8_1_13 <= 0
 EMIB_non_overlap_right_1_8_1_13: EMIB_w_var_1_13 - EMIB_x_grid_var_1_8
   + EMIB_x_grid_var_1_13 + 228 p_EMIB_right_1_8_1_13 <= 228
 EMIB_non_overlap_right_rev_1_8_1_13: - EMIB_w_var_1_13
   + EMIB_x_grid_var_1_8 - EMIB_x_grid_var_1_13 - 228 p_EMIB_right_1_8_1_13
   <= 0
 EMIB_non_overlap_down_1_8_1_13: EMIB_h_var_1_8 + EMIB_y_grid_var_1_8
   - EMIB_y_grid_var_1_13 + 228 p_EMIB_down_1_8_1_13 <= 228
 EMIB_non_overlap_down_rev_1_8_1_13: - EMIB_h_var_1_8 - EMIB_y_grid_var_1_8
   + EMIB_y_grid_var_1_13 - 228 p_EMIB_down_1_8_1_13 <= 0
 EMIB_non_overlap_up_1_8_1_13: EMIB_h_var_1_13 - EMIB_y_grid_var_1_8
   + EMIB_y_grid_var_1_13 + 228 p_EMIB_up_1_8_1_13 <= 228
 EMIB_non_overlap_up_rev_1_8_1_13: - EMIB_h_var_1_13 + EMIB_y_grid_var_1_8
   - EMIB_y_grid_var_1_13 - 228 p_EMIB_up_1_8_1_13 <= 0
 EMIB_non_overlap_any_1_11_1_13: p_EMIB_left_1_11_1_13
   + p_EMIB_right_1_11_1_13 + p_EMIB_down_1_11_1_13 + p_EMIB_up_1_11_1_13
   >= 1
 EMIB_non_overlap_left_1_11_1_13: EMIB_w_var_1_11 + EMIB_x_grid_var_1_11
   - EMIB_x_grid_var_1_13 + 228 p_EMIB_left_1_11_1_13 <= 228
 EMIB_non_overlap_left_rev_1_11_1_13: - EMIB_w_var_1_11
   - EMIB_x_grid_var_1_11 + EMIB_x_grid_var_1_13
   - 228 p_EMIB_left_1_11_1_13 <= 0
 EMIB_non_overlap_right_1_11_1_13: EMIB_w_var_1_13 - EMIB_x_grid_var_1_11
   + EMIB_x_grid_var_1_13 + 228 p_EMIB_right_1_11_1_13 <= 228
 EMIB_non_overlap_right_rev_1_11_1_13: - EMIB_w_var_1_13
   + EMIB_x_grid_var_1_11 - EMIB_x_grid_var_1_13
   - 228 p_EMIB_right_1_11_1_13 <= 0
 EMIB_non_overlap_down_1_11_1_13: EMIB_h_var_1_11 + EMIB_y_grid_var_1_11
   - EMIB_y_grid_var_1_13 + 228 p_EMIB_down_1_11_1_13 <= 228
 EMIB_non_overlap_down_rev_1_11_1_13: - EMIB_h_var_1_11
   - EMIB_y_grid_var_1_11 + EMIB_y_grid_var_1_13
   - 228 p_EMIB_down_1_11_1_13 <= 0
 EMIB_non_overlap_up_1_11_1_13: EMIB_h_var_1_13 - EMIB_y_grid_var_1_11
   + EMIB_y_grid_var_1_13 + 228 p_EMIB_up_1_11_1_13 <= 228
 EMIB_non_overlap_up_rev_1_11_1_13: - EMIB_h_var_1_13
   + EMIB_y_grid_var_1_11 - EMIB_y_grid_var_1_13 - 228 p_EMIB_up_1_11_1_13
   <= 0
 EMIB_non_overlap_any_1_11_3_11: p_EMIB_left_1_11_3_11
   + p_EMIB_right_1_11_3_11 + p_EMIB_down_1_11_3_11 + p_EMIB_up_1_11_3_11
   >= 1
 EMIB_non_overlap_left_1_11_3_11: EMIB_w_var_1_11 + EMIB_x_grid_var_1_11
   - EMIB_x_grid_var_3_11 + 228 p_EMIB_left_1_11_3_11 <= 228
 EMIB_non_overlap_left_rev_1_11_3_11: - EMIB_w_var_1_11
   - EMIB_x_grid_var_1_11 + EMIB_x_grid_var_3_11
   - 228 p_EMIB_left_1_11_3_11 <= 0
 EMIB_non_overlap_right_1_11_3_11: EMIB_w_var_3_11 - EMIB_x_grid_var_1_11
   + EMIB_x_grid_var_3_11 + 228 p_EMIB_right_1_11_3_11 <= 228
 EMIB_non_overlap_right_rev_1_11_3_11: - EMIB_w_var_3_11
   + EMIB_x_grid_var_1_11 - EMIB_x_grid_var_3_11
   - 228 p_EMIB_right_1_11_3_11 <= 0
 EMIB_non_overlap_down_1_11_3_11: EMIB_h_var_1_11 + EMIB_y_grid_var_1_11
   - EMIB_y_grid_var_3_11 + 228 p_EMIB_down_1_11_3_11 <= 228
 EMIB_non_overlap_down_rev_1_11_3_11: - EMIB_h_var_1_11
   - EMIB_y_grid_var_1_11 + EMIB_y_grid_var_3_11
   - 228 p_EMIB_down_1_11_3_11 <= 0
 EMIB_non_overlap_up_1_11_3_11: EMIB_h_var_3_11 - EMIB_y_grid_var_1_11
   + EMIB_y_grid_var_3_11 + 228 p_EMIB_up_1_11_3_11 <= 228
 EMIB_non_overlap_up_rev_1_11_3_11: - EMIB_h_var_3_11
   + EMIB_y_grid_var_1_11 - EMIB_y_grid_var_3_11 - 228 p_EMIB_up_1_11_3_11
   <= 0
 EMIB_non_overlap_any_1_11_5_11: p_EMIB_left_1_11_5_11
   + p_EMIB_right_1_11_5_11 + p_EMIB_down_1_11_5_11 + p_EMIB_up_1_11_5_11
   >= 1
 EMIB_non_overlap_left_1_11_5_11: EMIB_w_var_1_11 + EMIB_x_grid_var_1_11
   - EMIB_x_grid_var_5_11 + 228 p_EMIB_left_1_11_5_11 <= 228
 EMIB_non_overlap_left_rev_1_11_5_11: - EMIB_w_var_1_11
   - EMIB_x_grid_var_1_11 + EMIB_x_grid_var_5_11
   - 228 p_EMIB_left_1_11_5_11 <= 0
 EMIB_non_overlap_right_1_11_5_11: EMIB_w_var_5_11 - EMIB_x_grid_var_1_11
   + EMIB_x_grid_var_5_11 + 228 p_EMIB_right_1_11_5_11 <= 228
 EMIB_non_overlap_right_rev_1_11_5_11: - EMIB_w_var_5_11
   + EMIB_x_grid_var_1_11 - EMIB_x_grid_var_5_11
   - 228 p_EMIB_right_1_11_5_11 <= 0
 EMIB_non_overlap_down_1_11_5_11: EMIB_h_var_1_11 + EMIB_y_grid_var_1_11
   - EMIB_y_grid_var_5_11 + 228 p_EMIB_down_1_11_5_11 <= 228
 EMIB_non_overlap_down_rev_1_11_5_11: - EMIB_h_var_1_11
   - EMIB_y_grid_var_1_11 + EMIB_y_grid_var_5_11
   - 228 p_EMIB_down_1_11_5_11 <= 0
 EMIB_non_overlap_up_1_11_5_11: EMIB_h_var_5_11 - EMIB_y_grid_var_1_11
   + EMIB_y_grid_var_5_11 + 228 p_EMIB_up_1_11_5_11 <= 228
 EMIB_non_overlap_up_rev_1_11_5_11: - EMIB_h_var_5_11
   + EMIB_y_grid_var_1_11 - EMIB_y_grid_var_5_11 - 228 p_EMIB_up_1_11_5_11
   <= 0
 EMIB_non_overlap_any_1_11_11_12: p_EMIB_left_1_11_11_12
   + p_EMIB_right_1_11_11_12 + p_EMIB_down_1_11_11_12
   + p_EMIB_up_1_11_11_12 >= 1
 EMIB_non_overlap_left_1_11_11_12: EMIB_w_var_1_11 + EMIB_x_grid_var_1_11
   - EMIB_x_grid_var_11_12 + 228 p_EMIB_left_1_11_11_12 <= 228
 EMIB_non_overlap_left_rev_1_11_11_12: - EMIB_w_var_1_11
   - EMIB_x_grid_var_1_11 + EMIB_x_grid_var_11_12
   - 228 p_EMIB_left_1_11_11_12 <= 0
 EMIB_non_overlap_right_1_11_11_12: EMIB_w_var_11_12 - EMIB_x_grid_var_1_11
   + EMIB_x_grid_var_11_12 + 228 p_EMIB_right_1_11_11_12 <= 228
 EMIB_non_overlap_right_rev_1_11_11_12: - EMIB_w_var_11_12
   + EMIB_x_grid_var_1_11 - EMIB_x_grid_var_11_12
   - 228 p_EMIB_right_1_11_11_12 <= 0
 EMIB_non_overlap_down_1_11_11_12: EMIB_h_var_1_11 + EMIB_y_grid_var_1_11
   - EMIB_y_grid_var_11_12 + 228 p_EMIB_down_1_11_11_12 <= 228
 EMIB_non_overlap_down_rev_1_11_11_12: - EMIB_h_var_1_11
   - EMIB_y_grid_var_1_11 + EMIB_y_grid_var_11_12
   - 228 p_EMIB_down_1_11_11_12 <= 0
 EMIB_non_overlap_up_1_11_11_12: EMIB_h_var_11_12 - EMIB_y_grid_var_1_11
   + EMIB_y_grid_var_11_12 + 228 p_EMIB_up_1_11_11_12 <= 228
 EMIB_non_overlap_up_rev_1_11_11_12: - EMIB_h_var_11_12
   + EMIB_y_grid_var_1_11 - EMIB_y_grid_var_11_12
   - 228 p_EMIB_up_1_11_11_12 <= 0
 EMIB_non_overlap_any_1_13_7_13: p_EMIB_left_1_13_7_13
   + p_EMIB_right_1_13_7_13 + p_EMIB_down_1_13_7_13 + p_EMIB_up_1_13_7_13
   >= 1
 EMIB_non_overlap_left_1_13_7_13: EMIB_w_var_1_13 + EMIB_x_grid_var_1_13
   - EMIB_x_grid_var_7_13 + 228 p_EMIB_left_1_13_7_13 <= 228
 EMIB_non_overlap_left_rev_1_13_7_13: - EMIB_w_var_1_13
   - EMIB_x_grid_var_1_13 + EMIB_x_grid_var_7_13
   - 228 p_EMIB_left_1_13_7_13 <= 0
 EMIB_non_overlap_right_1_13_7_13: EMIB_w_var_7_13 - EMIB_x_grid_var_1_13
   + EMIB_x_grid_var_7_13 + 228 p_EMIB_right_1_13_7_13 <= 228
 EMIB_non_overlap_right_rev_1_13_7_13: - EMIB_w_var_7_13
   + EMIB_x_grid_var_1_13 - EMIB_x_grid_var_7_13
   - 228 p_EMIB_right_1_13_7_13 <= 0
 EMIB_non_overlap_down_1_13_7_13: EMIB_h_var_1_13 + EMIB_y_grid_var_1_13
   - EMIB_y_grid_var_7_13 + 228 p_EMIB_down_1_13_7_13 <= 228
 EMIB_non_overlap_down_rev_1_13_7_13: - EMIB_h_var_1_13
   - EMIB_y_grid_var_1_13 + EMIB_y_grid_var_7_13
   - 228 p_EMIB_down_1_13_7_13 <= 0
 EMIB_non_overlap_up_1_13_7_13: EMIB_h_var_7_13 - EMIB_y_grid_var_1_13
   + EMIB_y_grid_var_7_13 + 228 p_EMIB_up_1_13_7_13 <= 228
 EMIB_non_overlap_up_rev_1_13_7_13: - EMIB_h_var_7_13
   + EMIB_y_grid_var_1_13 - EMIB_y_grid_var_7_13 - 228 p_EMIB_up_1_13_7_13
   <= 0
 EMIB_non_overlap_any_1_13_12_13: p_EMIB_left_1_13_12_13
   + p_EMIB_right_1_13_12_13 + p_EMIB_down_1_13_12_13
   + p_EMIB_up_1_13_12_13 >= 1
 EMIB_non_overlap_left_1_13_12_13: EMIB_w_var_1_13 + EMIB_x_grid_var_1_13
   - EMIB_x_grid_var_12_13 + 228 p_EMIB_left_1_13_12_13 <= 228
 EMIB_non_overlap_left_rev_1_13_12_13: - EMIB_w_var_1_13
   - EMIB_x_grid_var_1_13 + EMIB_x_grid_var_12_13
   - 228 p_EMIB_left_1_13_12_13 <= 0
 EMIB_non_overlap_right_1_13_12_13: EMIB_w_var_12_13 - EMIB_x_grid_var_1_13
   + EMIB_x_grid_var_12_13 + 228 p_EMIB_right_1_13_12_13 <= 228
 EMIB_non_overlap_right_rev_1_13_12_13: - EMIB_w_var_12_13
   + EMIB_x_grid_var_1_13 - EMIB_x_grid_var_12_13
   - 228 p_EMIB_right_1_13_12_13 <= 0
 EMIB_non_overlap_down_1_13_12_13: EMIB_h_var_1_13 + EMIB_y_grid_var_1_13
   - EMIB_y_grid_var_12_13 + 228 p_EMIB_down_1_13_12_13 <= 228
 EMIB_non_overlap_down_rev_1_13_12_13: - EMIB_h_var_1_13
   - EMIB_y_grid_var_1_13 + EMIB_y_grid_var_12_13
   - 228 p_EMIB_down_1_13_12_13 <= 0
 EMIB_non_overlap_up_1_13_12_13: EMIB_h_var_12_13 - EMIB_y_grid_var_1_13
   + EMIB_y_grid_var_12_13 + 228 p_EMIB_up_1_13_12_13 <= 228
 EMIB_non_overlap_up_rev_1_13_12_13: - EMIB_h_var_12_13
   + EMIB_y_grid_var_1_13 - EMIB_y_grid_var_12_13
   - 228 p_EMIB_up_1_13_12_13 <= 0
 EMIB_non_overlap_any_1_13_13_14: p_EMIB_left_1_13_13_14
   + p_EMIB_right_1_13_13_14 + p_EMIB_down_1_13_13_14
   + p_EMIB_up_1_13_13_14 >= 1
 EMIB_non_overlap_left_1_13_13_14: EMIB_w_var_1_13 + EMIB_x_grid_var_1_13
   - EMIB_x_grid_var_13_14 + 228 p_EMIB_left_1_13_13_14 <= 228
 EMIB_non_overlap_left_rev_1_13_13_14: - EMIB_w_var_1_13
   - EMIB_x_grid_var_1_13 + EMIB_x_grid_var_13_14
   - 228 p_EMIB_left_1_13_13_14 <= 0
 EMIB_non_overlap_right_1_13_13_14: EMIB_w_var_13_14 - EMIB_x_grid_var_1_13
   + EMIB_x_grid_var_13_14 + 228 p_EMIB_right_1_13_13_14 <= 228
 EMIB_non_overlap_right_rev_1_13_13_14: - EMIB_w_var_13_14
   + EMIB_x_grid_var_1_13 - EMIB_x_grid_var_13_14
   - 228 p_EMIB_right_1_13_13_14 <= 0
 EMIB_non_overlap_down_1_13_13_14: EMIB_h_var_1_13 + EMIB_y_grid_var_1_13
   - EMIB_y_grid_var_13_14 + 228 p_EMIB_down_1_13_13_14 <= 228
 EMIB_non_overlap_down_rev_1_13_13_14: - EMIB_h_var_1_13
   - EMIB_y_grid_var_1_13 + EMIB_y_grid_var_13_14
   - 228 p_EMIB_down_1_13_13_14 <= 0
 EMIB_non_overlap_up_1_13_13_14: EMIB_h_var_13_14 - EMIB_y_grid_var_1_13
   + EMIB_y_grid_var_13_14 + 228 p_EMIB_up_1_13_13_14 <= 228
 EMIB_non_overlap_up_rev_1_13_13_14: - EMIB_h_var_13_14
   + EMIB_y_grid_var_1_13 - EMIB_y_grid_var_13_14
   - 228 p_EMIB_up_1_13_13_14 <= 0
 EMIB_non_overlap_any_2_3_2_5: p_EMIB_left_2_3_2_5 + p_EMIB_right_2_3_2_5
   + p_EMIB_down_2_3_2_5 + p_EMIB_up_2_3_2_5 >= 1
 EMIB_non_overlap_left_2_3_2_5: EMIB_w_var_2_3 + EMIB_x_grid_var_2_3
   - EMIB_x_grid_var_2_5 + 228 p_EMIB_left_2_3_2_5 <= 228
 EMIB_non_overlap_left_rev_2_3_2_5: - EMIB_w_var_2_3 - EMIB_x_grid_var_2_3
   + EMIB_x_grid_var_2_5 - 228 p_EMIB_left_2_3_2_5 <= 0
 EMIB_non_overlap_right_2_3_2_5: EMIB_w_var_2_5 - EMIB_x_grid_var_2_3
   + EMIB_x_grid_var_2_5 + 228 p_EMIB_right_2_3_2_5 <= 228
 EMIB_non_overlap_right_rev_2_3_2_5: - EMIB_w_var_2_5 + EMIB_x_grid_var_2_3
   - EMIB_x_grid_var_2_5 - 228 p_EMIB_right_2_3_2_5 <= 0
 EMIB_non_overlap_down_2_3_2_5: EMIB_h_var_2_3 + EMIB_y_grid_var_2_3
   - EMIB_y_grid_var_2_5 + 228 p_EMIB_down_2_3_2_5 <= 228
 EMIB_non_overlap_down_rev_2_3_2_5: - EMIB_h_var_2_3 - EMIB_y_grid_var_2_3
   + EMIB_y_grid_var_2_5 - 228 p_EMIB_down_2_3_2_5 <= 0
 EMIB_non_overlap_up_2_3_2_5: EMIB_h_var_2_5 - EMIB_y_grid_var_2_3
   + EMIB_y_grid_var_2_5 + 228 p_EMIB_up_2_3_2_5 <= 228
 EMIB_non_overlap_up_rev_2_3_2_5: - EMIB_h_var_2_5 + EMIB_y_grid_var_2_3
   - EMIB_y_grid_var_2_5 - 228 p_EMIB_up_2_3_2_5 <= 0
 EMIB_non_overlap_any_2_3_2_14: p_EMIB_left_2_3_2_14
   + p_EMIB_right_2_3_2_14 + p_EMIB_down_2_3_2_14 + p_EMIB_up_2_3_2_14
   >= 1
 EMIB_non_overlap_left_2_3_2_14: EMIB_w_var_2_3 + EMIB_x_grid_var_2_3
   - EMIB_x_grid_var_2_14 + 228 p_EMIB_left_2_3_2_14 <= 228
 EMIB_non_overlap_left_rev_2_3_2_14: - EMIB_w_var_2_3 - EMIB_x_grid_var_2_3
   + EMIB_x_grid_var_2_14 - 228 p_EMIB_left_2_3_2_14 <= 0
 EMIB_non_overlap_right_2_3_2_14: EMIB_w_var_2_14 - EMIB_x_grid_var_2_3
   + EMIB_x_grid_var_2_14 + 228 p_EMIB_right_2_3_2_14 <= 228
 EMIB_non_overlap_right_rev_2_3_2_14: - EMIB_w_var_2_14
   + EMIB_x_grid_var_2_3 - EMIB_x_grid_var_2_14 - 228 p_EMIB_right_2_3_2_14
   <= 0
 EMIB_non_overlap_down_2_3_2_14: EMIB_h_var_2_3 + EMIB_y_grid_var_2_3
   - EMIB_y_grid_var_2_14 + 228 p_EMIB_down_2_3_2_14 <= 228
 EMIB_non_overlap_down_rev_2_3_2_14: - EMIB_h_var_2_3 - EMIB_y_grid_var_2_3
   + EMIB_y_grid_var_2_14 - 228 p_EMIB_down_2_3_2_14 <= 0
 EMIB_non_overlap_up_2_3_2_14: EMIB_h_var_2_14 - EMIB_y_grid_var_2_3
   + EMIB_y_grid_var_2_14 + 228 p_EMIB_up_2_3_2_14 <= 228
 EMIB_non_overlap_up_rev_2_3_2_14: - EMIB_h_var_2_14 + EMIB_y_grid_var_2_3
   - EMIB_y_grid_var_2_14 - 228 p_EMIB_up_2_3_2_14 <= 0
 EMIB_non_overlap_any_2_3_3_11: p_EMIB_left_2_3_3_11
   + p_EMIB_right_2_3_3_11 + p_EMIB_down_2_3_3_11 + p_EMIB_up_2_3_3_11
   >= 1
 EMIB_non_overlap_left_2_3_3_11: EMIB_w_var_2_3 + EMIB_x_grid_var_2_3
   - EMIB_x_grid_var_3_11 + 228 p_EMIB_left_2_3_3_11 <= 228
 EMIB_non_overlap_left_rev_2_3_3_11: - EMIB_w_var_2_3 - EMIB_x_grid_var_2_3
   + EMIB_x_grid_var_3_11 - 228 p_EMIB_left_2_3_3_11 <= 0
 EMIB_non_overlap_right_2_3_3_11: EMIB_w_var_3_11 - EMIB_x_grid_var_2_3
   + EMIB_x_grid_var_3_11 + 228 p_EMIB_right_2_3_3_11 <= 228
 EMIB_non_overlap_right_rev_2_3_3_11: - EMIB_w_var_3_11
   + EMIB_x_grid_var_2_3 - EMIB_x_grid_var_3_11 - 228 p_EMIB_right_2_3_3_11
   <= 0
 EMIB_non_overlap_down_2_3_3_11: EMIB_h_var_2_3 + EMIB_y_grid_var_2_3
   - EMIB_y_grid_var_3_11 + 228 p_EMIB_down_2_3_3_11 <= 228
 EMIB_non_overlap_down_rev_2_3_3_11: - EMIB_h_var_2_3 - EMIB_y_grid_var_2_3
   + EMIB_y_grid_var_3_11 - 228 p_EMIB_down_2_3_3_11 <= 0
 EMIB_non_overlap_up_2_3_3_11: EMIB_h_var_3_11 - EMIB_y_grid_var_2_3
   + EMIB_y_grid_var_3_11 + 228 p_EMIB_up_2_3_3_11 <= 228
 EMIB_non_overlap_up_rev_2_3_3_11: - EMIB_h_var_3_11 + EMIB_y_grid_var_2_3
   - EMIB_y_grid_var_3_11 - 228 p_EMIB_up_2_3_3_11 <= 0
 EMIB_non_overlap_any_2_5_2_14: p_EMIB_left_2_5_2_14
   + p_EMIB_right_2_5_2_14 + p_EMIB_down_2_5_2_14 + p_EMIB_up_2_5_2_14
   >= 1
 EMIB_non_overlap_left_2_5_2_14: EMIB_w_var_2_5 + EMIB_x_grid_var_2_5
   - EMIB_x_grid_var_2_14 + 228 p_EMIB_left_2_5_2_14 <= 228
 EMIB_non_overlap_left_rev_2_5_2_14: - EMIB_w_var_2_5 - EMIB_x_grid_var_2_5
   + EMIB_x_grid_var_2_14 - 228 p_EMIB_left_2_5_2_14 <= 0
 EMIB_non_overlap_right_2_5_2_14: EMIB_w_var_2_14 - EMIB_x_grid_var_2_5
   + EMIB_x_grid_var_2_14 + 228 p_EMIB_right_2_5_2_14 <= 228
 EMIB_non_overlap_right_rev_2_5_2_14: - EMIB_w_var_2_14
   + EMIB_x_grid_var_2_5 - EMIB_x_grid_var_2_14 - 228 p_EMIB_right_2_5_2_14
   <= 0
 EMIB_non_overlap_down_2_5_2_14: EMIB_h_var_2_5 + EMIB_y_grid_var_2_5
   - EMIB_y_grid_var_2_14 + 228 p_EMIB_down_2_5_2_14 <= 228
 EMIB_non_overlap_down_rev_2_5_2_14: - EMIB_h_var_2_5 - EMIB_y_grid_var_2_5
   + EMIB_y_grid_var_2_14 - 228 p_EMIB_down_2_5_2_14 <= 0
 EMIB_non_overlap_up_2_5_2_14: EMIB_h_var_2_14 - EMIB_y_grid_var_2_5
   + EMIB_y_grid_var_2_14 + 228 p_EMIB_up_2_5_2_14 <= 228
 EMIB_non_overlap_up_rev_2_5_2_14: - EMIB_h_var_2_14 + EMIB_y_grid_var_2_5
   - EMIB_y_grid_var_2_14 - 228 p_EMIB_up_2_5_2_14 <= 0
 EMIB_non_overlap_any_2_5_5_7: p_EMIB_left_2_5_5_7 + p_EMIB_right_2_5_5_7
   + p_EMIB_down_2_5_5_7 + p_EMIB_up_2_5_5_7 >= 1
 EMIB_non_overlap_left_2_5_5_7: EMIB_w_var_2_5 + EMIB_x_grid_var_2_5
   - EMIB_x_grid_var_5_7 + 228 p_EMIB_left_2_5_5_7 <= 228
 EMIB_non_overlap_left_rev_2_5_5_7: - EMIB_w_var_2_5 - EMIB_x_grid_var_2_5
   + EMIB_x_grid_var_5_7 - 228 p_EMIB_left_2_5_5_7 <= 0
 EMIB_non_overlap_right_2_5_5_7: EMIB_w_var_5_7 - EMIB_x_grid_var_2_5
   + EMIB_x_grid_var_5_7 + 228 p_EMIB_right_2_5_5_7 <= 228
 EMIB_non_overlap_right_rev_2_5_5_7: - EMIB_w_var_5_7 + EMIB_x_grid_var_2_5
   - EMIB_x_grid_var_5_7 - 228 p_EMIB_right_2_5_5_7 <= 0
 EMIB_non_overlap_down_2_5_5_7: EMIB_h_var_2_5 + EMIB_y_grid_var_2_5
   - EMIB_y_grid_var_5_7 + 228 p_EMIB_down_2_5_5_7 <= 228
 EMIB_non_overlap_down_rev_2_5_5_7: - EMIB_h_var_2_5 - EMIB_y_grid_var_2_5
   + EMIB_y_grid_var_5_7 - 228 p_EMIB_down_2_5_5_7 <= 0
 EMIB_non_overlap_up_2_5_5_7: EMIB_h_var_5_7 - EMIB_y_grid_var_2_5
   + EMIB_y_grid_var_5_7 + 228 p_EMIB_up_2_5_5_7 <= 228
 EMIB_non_overlap_up_rev_2_5_5_7: - EMIB_h_var_5_7 + EMIB_y_grid_var_2_5
   - EMIB_y_grid_var_5_7 - 228 p_EMIB_up_2_5_5_7 <= 0
 EMIB_non_overlap_any_2_5_5_9: p_EMIB_left_2_5_5_9 + p_EMIB_right_2_5_5_9
   + p_EMIB_down_2_5_5_9 + p_EMIB_up_2_5_5_9 >= 1
 EMIB_non_overlap_left_2_5_5_9: EMIB_w_var_2_5 + EMIB_x_grid_var_2_5
   - EMIB_x_grid_var_5_9 + 228 p_EMIB_left_2_5_5_9 <= 228
 EMIB_non_overlap_left_rev_2_5_5_9: - EMIB_w_var_2_5 - EMIB_x_grid_var_2_5
   + EMIB_x_grid_var_5_9 - 228 p_EMIB_left_2_5_5_9 <= 0
 EMIB_non_overlap_right_2_5_5_9: EMIB_w_var_5_9 - EMIB_x_grid_var_2_5
   + EMIB_x_grid_var_5_9 + 228 p_EMIB_right_2_5_5_9 <= 228
 EMIB_non_overlap_right_rev_2_5_5_9: - EMIB_w_var_5_9 + EMIB_x_grid_var_2_5
   - EMIB_x_grid_var_5_9 - 228 p_EMIB_right_2_5_5_9 <= 0
 EMIB_non_overlap_down_2_5_5_9: EMIB_h_var_2_5 + EMIB_y_grid_var_2_5
   - EMIB_y_grid_var_5_9 + 228 p_EMIB_down_2_5_5_9 <= 228
 EMIB_non_overlap_down_rev_2_5_5_9: - EMIB_h_var_2_5 - EMIB_y_grid_var_2_5
   + EMIB_y_grid_var_5_9 - 228 p_EMIB_down_2_5_5_9 <= 0
 EMIB_non_overlap_up_2_5_5_9: EMIB_h_var_5_9 - EMIB_y_grid_var_2_5
   + EMIB_y_grid_var_5_9 + 228 p_EMIB_up_2_5_5_9 <= 228
 EMIB_non_overlap_up_rev_2_5_5_9: - EMIB_h_var_5_9 + EMIB_y_grid_var_2_5
   - EMIB_y_grid_var_5_9 - 228 p_EMIB_up_2_5_5_9 <= 0
 EMIB_non_overlap_any_2_5_5_11: p_EMIB_left_2_5_5_11
   + p_EMIB_right_2_5_5_11 + p_EMIB_down_2_5_5_11 + p_EMIB_up_2_5_5_11
   >= 1
 EMIB_non_overlap_left_2_5_5_11: EMIB_w_var_2_5 + EMIB_x_grid_var_2_5
   - EMIB_x_grid_var_5_11 + 228 p_EMIB_left_2_5_5_11 <= 228
 EMIB_non_overlap_left_rev_2_5_5_11: - EMIB_w_var_2_5 - EMIB_x_grid_var_2_5
   + EMIB_x_grid_var_5_11 - 228 p_EMIB_left_2_5_5_11 <= 0
 EMIB_non_overlap_right_2_5_5_11: EMIB_w_var_5_11 - EMIB_x_grid_var_2_5
   + EMIB_x_grid_var_5_11 + 228 p_EMIB_right_2_5_5_11 <= 228
 EMIB_non_overlap_right_rev_2_5_5_11: - EMIB_w_var_5_11
   + EMIB_x_grid_var_2_5 - EMIB_x_grid_var_5_11 - 228 p_EMIB_right_2_5_5_11
   <= 0
 EMIB_non_overlap_down_2_5_5_11: EMIB_h_var_2_5 + EMIB_y_grid_var_2_5
   - EMIB_y_grid_var_5_11 + 228 p_EMIB_down_2_5_5_11 <= 228
 EMIB_non_overlap_down_rev_2_5_5_11: - EMIB_h_var_2_5 - EMIB_y_grid_var_2_5
   + EMIB_y_grid_var_5_11 - 228 p_EMIB_down_2_5_5_11 <= 0
 EMIB_non_overlap_up_2_5_5_11: EMIB_h_var_5_11 - EMIB_y_grid_var_2_5
   + EMIB_y_grid_var_5_11 + 228 p_EMIB_up_2_5_5_11 <= 228
 EMIB_non_overlap_up_rev_2_5_5_11: - EMIB_h_var_5_11 + EMIB_y_grid_var_2_5
   - EMIB_y_grid_var_5_11 - 228 p_EMIB_up_2_5_5_11 <= 0
 EMIB_non_overlap_any_2_5_5_12: p_EMIB_left_2_5_5_12
   + p_EMIB_right_2_5_5_12 + p_EMIB_down_2_5_5_12 + p_EMIB_up_2_5_5_12
   >= 1
 EMIB_non_overlap_left_2_5_5_12: EMIB_w_var_2_5 + EMIB_x_grid_var_2_5
   - EMIB_x_grid_var_5_12 + 228 p_EMIB_left_2_5_5_12 <= 228
 EMIB_non_overlap_left_rev_2_5_5_12: - EMIB_w_var_2_5 - EMIB_x_grid_var_2_5
   + EMIB_x_grid_var_5_12 - 228 p_EMIB_left_2_5_5_12 <= 0
 EMIB_non_overlap_right_2_5_5_12: EMIB_w_var_5_12 - EMIB_x_grid_var_2_5
   + EMIB_x_grid_var_5_12 + 228 p_EMIB_right_2_5_5_12 <= 228
 EMIB_non_overlap_right_rev_2_5_5_12: - EMIB_w_var_5_12
   + EMIB_x_grid_var_2_5 - EMIB_x_grid_var_5_12 - 228 p_EMIB_right_2_5_5_12
   <= 0
 EMIB_non_overlap_down_2_5_5_12: EMIB_h_var_2_5 + EMIB_y_grid_var_2_5
   - EMIB_y_grid_var_5_12 + 228 p_EMIB_down_2_5_5_12 <= 228
 EMIB_non_overlap_down_rev_2_5_5_12: - EMIB_h_var_2_5 - EMIB_y_grid_var_2_5
   + EMIB_y_grid_var_5_12 - 228 p_EMIB_down_2_5_5_12 <= 0
 EMIB_non_overlap_up_2_5_5_12: EMIB_h_var_5_12 - EMIB_y_grid_var_2_5
   + EMIB_y_grid_var_5_12 + 228 p_EMIB_up_2_5_5_12 <= 228
 EMIB_non_overlap_up_rev_2_5_5_12: - EMIB_h_var_5_12 + EMIB_y_grid_var_2_5
   - EMIB_y_grid_var_5_12 - 228 p_EMIB_up_2_5_5_12 <= 0
 EMIB_non_overlap_any_2_5_5_14: p_EMIB_left_2_5_5_14
   + p_EMIB_right_2_5_5_14 + p_EMIB_down_2_5_5_14 + p_EMIB_up_2_5_5_14
   >= 1
 EMIB_non_overlap_left_2_5_5_14: EMIB_w_var_2_5 + EMIB_x_grid_var_2_5
   - EMIB_x_grid_var_5_14 + 228 p_EMIB_left_2_5_5_14 <= 228
 EMIB_non_overlap_left_rev_2_5_5_14: - EMIB_w_var_2_5 - EMIB_x_grid_var_2_5
   + EMIB_x_grid_var_5_14 - 228 p_EMIB_left_2_5_5_14 <= 0
 EMIB_non_overlap_right_2_5_5_14: EMIB_w_var_5_14 - EMIB_x_grid_var_2_5
   + EMIB_x_grid_var_5_14 + 228 p_EMIB_right_2_5_5_14 <= 228
 EMIB_non_overlap_right_rev_2_5_5_14: - EMIB_w_var_5_14
   + EMIB_x_grid_var_2_5 - EMIB_x_grid_var_5_14 - 228 p_EMIB_right_2_5_5_14
   <= 0
 EMIB_non_overlap_down_2_5_5_14: EMIB_h_var_2_5 + EMIB_y_grid_var_2_5
   - EMIB_y_grid_var_5_14 + 228 p_EMIB_down_2_5_5_14 <= 228
 EMIB_non_overlap_down_rev_2_5_5_14: - EMIB_h_var_2_5 - EMIB_y_grid_var_2_5
   + EMIB_y_grid_var_5_14 - 228 p_EMIB_down_2_5_5_14 <= 0
 EMIB_non_overlap_up_2_5_5_14: EMIB_h_var_5_14 - EMIB_y_grid_var_2_5
   + EMIB_y_grid_var_5_14 + 228 p_EMIB_up_2_5_5_14 <= 228
 EMIB_non_overlap_up_rev_2_5_5_14: - EMIB_h_var_5_14 + EMIB_y_grid_var_2_5
   - EMIB_y_grid_var_5_14 - 228 p_EMIB_up_2_5_5_14 <= 0
 EMIB_non_overlap_any_2_14_5_14: p_EMIB_left_2_14_5_14
   + p_EMIB_right_2_14_5_14 + p_EMIB_down_2_14_5_14 + p_EMIB_up_2_14_5_14
   >= 1
 EMIB_non_overlap_left_2_14_5_14: EMIB_w_var_2_14 + EMIB_x_grid_var_2_14
   - EMIB_x_grid_var_5_14 + 228 p_EMIB_left_2_14_5_14 <= 228
 EMIB_non_overlap_left_rev_2_14_5_14: - EMIB_w_var_2_14
   - EMIB_x_grid_var_2_14 + EMIB_x_grid_var_5_14
   - 228 p_EMIB_left_2_14_5_14 <= 0
 EMIB_non_overlap_right_2_14_5_14: EMIB_w_var_5_14 - EMIB_x_grid_var_2_14
   + EMIB_x_grid_var_5_14 + 228 p_EMIB_right_2_14_5_14 <= 228
 EMIB_non_overlap_right_rev_2_14_5_14: - EMIB_w_var_5_14
   + EMIB_x_grid_var_2_14 - EMIB_x_grid_var_5_14
   - 228 p_EMIB_right_2_14_5_14 <= 0
 EMIB_non_overlap_down_2_14_5_14: EMIB_h_var_2_14 + EMIB_y_grid_var_2_14
   - EMIB_y_grid_var_5_14 + 228 p_EMIB_down_2_14_5_14 <= 228
 EMIB_non_overlap_down_rev_2_14_5_14: - EMIB_h_var_2_14
   - EMIB_y_grid_var_2_14 + EMIB_y_grid_var_5_14
   - 228 p_EMIB_down_2_14_5_14 <= 0
 EMIB_non_overlap_up_2_14_5_14: EMIB_h_var_5_14 - EMIB_y_grid_var_2_14
   + EMIB_y_grid_var_5_14 + 228 p_EMIB_up_2_14_5_14 <= 228
 EMIB_non_overlap_up_rev_2_14_5_14: - EMIB_h_var_5_14
   + EMIB_y_grid_var_2_14 - EMIB_y_grid_var_5_14 - 228 p_EMIB_up_2_14_5_14
   <= 0
 EMIB_non_overlap_any_2_14_7_14: p_EMIB_left_2_14_7_14
   + p_EMIB_right_2_14_7_14 + p_EMIB_down_2_14_7_14 + p_EMIB_up_2_14_7_14
   >= 1
 EMIB_non_overlap_left_2_14_7_14: EMIB_w_var_2_14 + EMIB_x_grid_var_2_14
   - EMIB_x_grid_var_7_14 + 228 p_EMIB_left_2_14_7_14 <= 228
 EMIB_non_overlap_left_rev_2_14_7_14: - EMIB_w_var_2_14
   - EMIB_x_grid_var_2_14 + EMIB_x_grid_var_7_14
   - 228 p_EMIB_left_2_14_7_14 <= 0
 EMIB_non_overlap_right_2_14_7_14: EMIB_w_var_7_14 - EMIB_x_grid_var_2_14
   + EMIB_x_grid_var_7_14 + 228 p_EMIB_right_2_14_7_14 <= 228
 EMIB_non_overlap_right_rev_2_14_7_14: - EMIB_w_var_7_14
   + EMIB_x_grid_var_2_14 - EMIB_x_grid_var_7_14
   - 228 p_EMIB_right_2_14_7_14 <= 0
 EMIB_non_overlap_down_2_14_7_14: EMIB_h_var_2_14 + EMIB_y_grid_var_2_14
   - EMIB_y_grid_var_7_14 + 228 p_EMIB_down_2_14_7_14 <= 228
 EMIB_non_overlap_down_rev_2_14_7_14: - EMIB_h_var_2_14
   - EMIB_y_grid_var_2_14 + EMIB_y_grid_var_7_14
   - 228 p_EMIB_down_2_14_7_14 <= 0
 EMIB_non_overlap_up_2_14_7_14: EMIB_h_var_7_14 - EMIB_y_grid_var_2_14
   + EMIB_y_grid_var_7_14 + 228 p_EMIB_up_2_14_7_14 <= 228
 EMIB_non_overlap_up_rev_2_14_7_14: - EMIB_h_var_7_14
   + EMIB_y_grid_var_2_14 - EMIB_y_grid_var_7_14 - 228 p_EMIB_up_2_14_7_14
   <= 0
 EMIB_non_overlap_any_2_14_9_14: p_EMIB_left_2_14_9_14
   + p_EMIB_right_2_14_9_14 + p_EMIB_down_2_14_9_14 + p_EMIB_up_2_14_9_14
   >= 1
 EMIB_non_overlap_left_2_14_9_14: EMIB_w_var_2_14 + EMIB_x_grid_var_2_14
   - EMIB_x_grid_var_9_14 + 228 p_EMIB_left_2_14_9_14 <= 228
 EMIB_non_overlap_left_rev_2_14_9_14: - EMIB_w_var_2_14
   - EMIB_x_grid_var_2_14 + EMIB_x_grid_var_9_14
   - 228 p_EMIB_left_2_14_9_14 <= 0
 EMIB_non_overlap_right_2_14_9_14: EMIB_w_var_9_14 - EMIB_x_grid_var_2_14
   + EMIB_x_grid_var_9_14 + 228 p_EMIB_right_2_14_9_14 <= 228
 EMIB_non_overlap_right_rev_2_14_9_14: - EMIB_w_var_9_14
   + EMIB_x_grid_var_2_14 - EMIB_x_grid_var_9_14
   - 228 p_EMIB_right_2_14_9_14 <= 0
 EMIB_non_overlap_down_2_14_9_14: EMIB_h_var_2_14 + EMIB_y_grid_var_2_14
   - EMIB_y_grid_var_9_14 + 228 p_EMIB_down_2_14_9_14 <= 228
 EMIB_non_overlap_down_rev_2_14_9_14: - EMIB_h_var_2_14
   - EMIB_y_grid_var_2_14 + EMIB_y_grid_var_9_14
   - 228 p_EMIB_down_2_14_9_14 <= 0
 EMIB_non_overlap_up_2_14_9_14: EMIB_h_var_9_14 - EMIB_y_grid_var_2_14
   + EMIB_y_grid_var_9_14 + 228 p_EMIB_up_2_14_9_14 <= 228
 EMIB_non_overlap_up_rev_2_14_9_14: - EMIB_h_var_9_14
   + EMIB_y_grid_var_2_14 - EMIB_y_grid_var_9_14 - 228 p_EMIB_up_2_14_9_14
   <= 0
 EMIB_non_overlap_any_2_14_13_14: p_EMIB_left_2_14_13_14
   + p_EMIB_right_2_14_13_14 + p_EMIB_down_2_14_13_14
   + p_EMIB_up_2_14_13_14 >= 1
 EMIB_non_overlap_left_2_14_13_14: EMIB_w_var_2_14 + EMIB_x_grid_var_2_14
   - EMIB_x_grid_var_13_14 + 228 p_EMIB_left_2_14_13_14 <= 228
 EMIB_non_overlap_left_rev_2_14_13_14: - EMIB_w_var_2_14
   - EMIB_x_grid_var_2_14 + EMIB_x_grid_var_13_14
   - 228 p_EMIB_left_2_14_13_14 <= 0
 EMIB_non_overlap_right_2_14_13_14: EMIB_w_var_13_14 - EMIB_x_grid_var_2_14
   + EMIB_x_grid_var_13_14 + 228 p_EMIB_right_2_14_13_14 <= 228
 EMIB_non_overlap_right_rev_2_14_13_14: - EMIB_w_var_13_14
   + EMIB_x_grid_var_2_14 - EMIB_x_grid_var_13_14
   - 228 p_EMIB_right_2_14_13_14 <= 0
 EMIB_non_overlap_down_2_14_13_14: EMIB_h_var_2_14 + EMIB_y_grid_var_2_14
   - EMIB_y_grid_var_13_14 + 228 p_EMIB_down_2_14_13_14 <= 228
 EMIB_non_overlap_down_rev_2_14_13_14: - EMIB_h_var_2_14
   - EMIB_y_grid_var_2_14 + EMIB_y_grid_var_13_14
   - 228 p_EMIB_down_2_14_13_14 <= 0
 EMIB_non_overlap_up_2_14_13_14: EMIB_h_var_13_14 - EMIB_y_grid_var_2_14
   + EMIB_y_grid_var_13_14 + 228 p_EMIB_up_2_14_13_14 <= 228
 EMIB_non_overlap_up_rev_2_14_13_14: - EMIB_h_var_13_14
   + EMIB_y_grid_var_2_14 - EMIB_y_grid_var_13_14
   - 228 p_EMIB_up_2_14_13_14 <= 0
 EMIB_non_overlap_any_3_11_5_11: p_EMIB_left_3_11_5_11
   + p_EMIB_right_3_11_5_11 + p_EMIB_down_3_11_5_11 + p_EMIB_up_3_11_5_11
   >= 1
 EMIB_non_overlap_left_3_11_5_11: EMIB_w_var_3_11 + EMIB_x_grid_var_3_11
   - EMIB_x_grid_var_5_11 + 228 p_EMIB_left_3_11_5_11 <= 228
 EMIB_non_overlap_left_rev_3_11_5_11: - EMIB_w_var_3_11
   - EMIB_x_grid_var_3_11 + EMIB_x_grid_var_5_11
   - 228 p_EMIB_left_3_11_5_11 <= 0
 EMIB_non_overlap_right_3_11_5_11: EMIB_w_var_5_11 - EMIB_x_grid_var_3_11
   + EMIB_x_grid_var_5_11 + 228 p_EMIB_right_3_11_5_11 <= 228
 EMIB_non_overlap_right_rev_3_11_5_11: - EMIB_w_var_5_11
   + EMIB_x_grid_var_3_11 - EMIB_x_grid_var_5_11
   - 228 p_EMIB_right_3_11_5_11 <= 0
 EMIB_non_overlap_down_3_11_5_11: EMIB_h_var_3_11 + EMIB_y_grid_var_3_11
   - EMIB_y_grid_var_5_11 + 228 p_EMIB_down_3_11_5_11 <= 228
 EMIB_non_overlap_down_rev_3_11_5_11: - EMIB_h_var_3_11
   - EMIB_y_grid_var_3_11 + EMIB_y_grid_var_5_11
   - 228 p_EMIB_down_3_11_5_11 <= 0
 EMIB_non_overlap_up_3_11_5_11: EMIB_h_var_5_11 - EMIB_y_grid_var_3_11
   + EMIB_y_grid_var_5_11 + 228 p_EMIB_up_3_11_5_11 <= 228
 EMIB_non_overlap_up_rev_3_11_5_11: - EMIB_h_var_5_11
   + EMIB_y_grid_var_3_11 - EMIB_y_grid_var_5_11 - 228 p_EMIB_up_3_11_5_11
   <= 0
 EMIB_non_overlap_any_3_11_11_12: p_EMIB_left_3_11_11_12
   + p_EMIB_right_3_11_11_12 + p_EMIB_down_3_11_11_12
   + p_EMIB_up_3_11_11_12 >= 1
 EMIB_non_overlap_left_3_11_11_12: EMIB_w_var_3_11 + EMIB_x_grid_var_3_11
   - EMIB_x_grid_var_11_12 + 228 p_EMIB_left_3_11_11_12 <= 228
 EMIB_non_overlap_left_rev_3_11_11_12: - EMIB_w_var_3_11
   - EMIB_x_grid_var_3_11 + EMIB_x_grid_var_11_12
   - 228 p_EMIB_left_3_11_11_12 <= 0
 EMIB_non_overlap_right_3_11_11_12: EMIB_w_var_11_12 - EMIB_x_grid_var_3_11
   + EMIB_x_grid_var_11_12 + 228 p_EMIB_right_3_11_11_12 <= 228
 EMIB_non_overlap_right_rev_3_11_11_12: - EMIB_w_var_11_12
   + EMIB_x_grid_var_3_11 - EMIB_x_grid_var_11_12
   - 228 p_EMIB_right_3_11_11_12 <= 0
 EMIB_non_overlap_down_3_11_11_12: EMIB_h_var_3_11 + EMIB_y_grid_var_3_11
   - EMIB_y_grid_var_11_12 + 228 p_EMIB_down_3_11_11_12 <= 228
 EMIB_non_overlap_down_rev_3_11_11_12: - EMIB_h_var_3_11
   - EMIB_y_grid_var_3_11 + EMIB_y_grid_var_11_12
   - 228 p_EMIB_down_3_11_11_12 <= 0
 EMIB_non_overlap_up_3_11_11_12: EMIB_h_var_11_12 - EMIB_y_grid_var_3_11
   + EMIB_y_grid_var_11_12 + 228 p_EMIB_up_3_11_11_12 <= 228
 EMIB_non_overlap_up_rev_3_11_11_12: - EMIB_h_var_11_12
   + EMIB_y_grid_var_3_11 - EMIB_y_grid_var_11_12
   - 228 p_EMIB_up_3_11_11_12 <= 0
 EMIB_non_overlap_any_5_7_5_9: p_EMIB_left_5_7_5_9 + p_EMIB_right_5_7_5_9
   + p_EMIB_down_5_7_5_9 + p_EMIB_up_5_7_5_9 >= 1
 EMIB_non_overlap_left_5_7_5_9: EMIB_w_var_5_7 + EMIB_x_grid_var_5_7
   - EMIB_x_grid_var_5_9 + 228 p_EMIB_left_5_7_5_9 <= 228
 EMIB_non_overlap_left_rev_5_7_5_9: - EMIB_w_var_5_7 - EMIB_x_grid_var_5_7
   + EMIB_x_grid_var_5_9 - 228 p_EMIB_left_5_7_5_9 <= 0
 EMIB_non_overlap_right_5_7_5_9: EMIB_w_var_5_9 - EMIB_x_grid_var_5_7
   + EMIB_x_grid_var_5_9 + 228 p_EMIB_right_5_7_5_9 <= 228
 EMIB_non_overlap_right_rev_5_7_5_9: - EMIB_w_var_5_9 + EMIB_x_grid_var_5_7
   - EMIB_x_grid_var_5_9 - 228 p_EMIB_right_5_7_5_9 <= 0
 EMIB_non_overlap_down_5_7_5_9: EMIB_h_var_5_7 + EMIB_y_grid_var_5_7
   - EMIB_y_grid_var_5_9 + 228 p_EMIB_down_5_7_5_9 <= 228
 EMIB_non_overlap_down_rev_5_7_5_9: - EMIB_h_var_5_7 - EMIB_y_grid_var_5_7
   + EMIB_y_grid_var_5_9 - 228 p_EMIB_down_5_7_5_9 <= 0
 EMIB_non_overlap_up_5_7_5_9: EMIB_h_var_5_9 - EMIB_y_grid_var_5_7
   + EMIB_y_grid_var_5_9 + 228 p_EMIB_up_5_7_5_9 <= 228
 EMIB_non_overlap_up_rev_5_7_5_9: - EMIB_h_var_5_9 + EMIB_y_grid_var_5_7
   - EMIB_y_grid_var_5_9 - 228 p_EMIB_up_5_7_5_9 <= 0
 EMIB_non_overlap_any_5_7_5_11: p_EMIB_left_5_7_5_11
   + p_EMIB_right_5_7_5_11 + p_EMIB_down_5_7_5_11 + p_EMIB_up_5_7_5_11
   >= 1
 EMIB_non_overlap_left_5_7_5_11: EMIB_w_var_5_7 + EMIB_x_grid_var_5_7
   - EMIB_x_grid_var_5_11 + 228 p_EMIB_left_5_7_5_11 <= 228
 EMIB_non_overlap_left_rev_5_7_5_11: - EMIB_w_var_5_7 - EMIB_x_grid_var_5_7
   + EMIB_x_grid_var_5_11 - 228 p_EMIB_left_5_7_5_11 <= 0
 EMIB_non_overlap_right_5_7_5_11: EMIB_w_var_5_11 - EMIB_x_grid_var_5_7
   + EMIB_x_grid_var_5_11 + 228 p_EMIB_right_5_7_5_11 <= 228
 EMIB_non_overlap_right_rev_5_7_5_11: - EMIB_w_var_5_11
   + EMIB_x_grid_var_5_7 - EMIB_x_grid_var_5_11 - 228 p_EMIB_right_5_7_5_11
   <= 0
 EMIB_non_overlap_down_5_7_5_11: EMIB_h_var_5_7 + EMIB_y_grid_var_5_7
   - EMIB_y_grid_var_5_11 + 228 p_EMIB_down_5_7_5_11 <= 228
 EMIB_non_overlap_down_rev_5_7_5_11: - EMIB_h_var_5_7 - EMIB_y_grid_var_5_7
   + EMIB_y_grid_var_5_11 - 228 p_EMIB_down_5_7_5_11 <= 0
 EMIB_non_overlap_up_5_7_5_11: EMIB_h_var_5_11 - EMIB_y_grid_var_5_7
   + EMIB_y_grid_var_5_11 + 228 p_EMIB_up_5_7_5_11 <= 228
 EMIB_non_overlap_up_rev_5_7_5_11: - EMIB_h_var_5_11 + EMIB_y_grid_var_5_7
   - EMIB_y_grid_var_5_11 - 228 p_EMIB_up_5_7_5_11 <= 0
 EMIB_non_overlap_any_5_7_5_12: p_EMIB_left_5_7_5_12
   + p_EMIB_right_5_7_5_12 + p_EMIB_down_5_7_5_12 + p_EMIB_up_5_7_5_12
   >= 1
 EMIB_non_overlap_left_5_7_5_12: EMIB_w_var_5_7 + EMIB_x_grid_var_5_7
   - EMIB_x_grid_var_5_12 + 228 p_EMIB_left_5_7_5_12 <= 228
 EMIB_non_overlap_left_rev_5_7_5_12: - EMIB_w_var_5_7 - EMIB_x_grid_var_5_7
   + EMIB_x_grid_var_5_12 - 228 p_EMIB_left_5_7_5_12 <= 0
 EMIB_non_overlap_right_5_7_5_12: EMIB_w_var_5_12 - EMIB_x_grid_var_5_7
   + EMIB_x_grid_var_5_12 + 228 p_EMIB_right_5_7_5_12 <= 228
 EMIB_non_overlap_right_rev_5_7_5_12: - EMIB_w_var_5_12
   + EMIB_x_grid_var_5_7 - EMIB_x_grid_var_5_12 - 228 p_EMIB_right_5_7_5_12
   <= 0
 EMIB_non_overlap_down_5_7_5_12: EMIB_h_var_5_7 + EMIB_y_grid_var_5_7
   - EMIB_y_grid_var_5_12 + 228 p_EMIB_down_5_7_5_12 <= 228
 EMIB_non_overlap_down_rev_5_7_5_12: - EMIB_h_var_5_7 - EMIB_y_grid_var_5_7
   + EMIB_y_grid_var_5_12 - 228 p_EMIB_down_5_7_5_12 <= 0
 EMIB_non_overlap_up_5_7_5_12: EMIB_h_var_5_12 - EMIB_y_grid_var_5_7
   + EMIB_y_grid_var_5_12 + 228 p_EMIB_up_5_7_5_12 <= 228
 EMIB_non_overlap_up_rev_5_7_5_12: - EMIB_h_var_5_12 + EMIB_y_grid_var_5_7
   - EMIB_y_grid_var_5_12 - 228 p_EMIB_up_5_7_5_12 <= 0
 EMIB_non_overlap_any_5_7_5_14: p_EMIB_left_5_7_5_14
   + p_EMIB_right_5_7_5_14 + p_EMIB_down_5_7_5_14 + p_EMIB_up_5_7_5_14
   >= 1
 EMIB_non_overlap_left_5_7_5_14: EMIB_w_var_5_7 + EMIB_x_grid_var_5_7
   - EMIB_x_grid_var_5_14 + 228 p_EMIB_left_5_7_5_14 <= 228
 EMIB_non_overlap_left_rev_5_7_5_14: - EMIB_w_var_5_7 - EMIB_x_grid_var_5_7
   + EMIB_x_grid_var_5_14 - 228 p_EMIB_left_5_7_5_14 <= 0
 EMIB_non_overlap_right_5_7_5_14: EMIB_w_var_5_14 - EMIB_x_grid_var_5_7
   + EMIB_x_grid_var_5_14 + 228 p_EMIB_right_5_7_5_14 <= 228
 EMIB_non_overlap_right_rev_5_7_5_14: - EMIB_w_var_5_14
   + EMIB_x_grid_var_5_7 - EMIB_x_grid_var_5_14 - 228 p_EMIB_right_5_7_5_14
   <= 0
 EMIB_non_overlap_down_5_7_5_14: EMIB_h_var_5_7 + EMIB_y_grid_var_5_7
   - EMIB_y_grid_var_5_14 + 228 p_EMIB_down_5_7_5_14 <= 228
 EMIB_non_overlap_down_rev_5_7_5_14: - EMIB_h_var_5_7 - EMIB_y_grid_var_5_7
   + EMIB_y_grid_var_5_14 - 228 p_EMIB_down_5_7_5_14 <= 0
 EMIB_non_overlap_up_5_7_5_14: EMIB_h_var_5_14 - EMIB_y_grid_var_5_7
   + EMIB_y_grid_var_5_14 + 228 p_EMIB_up_5_7_5_14 <= 228
 EMIB_non_overlap_up_rev_5_7_5_14: - EMIB_h_var_5_14 + EMIB_y_grid_var_5_7
   - EMIB_y_grid_var_5_14 - 228 p_EMIB_up_5_7_5_14 <= 0
 EMIB_non_overlap_any_5_7_7_13: p_EMIB_left_5_7_7_13
   + p_EMIB_right_5_7_7_13 + p_EMIB_down_5_7_7_13 + p_EMIB_up_5_7_7_13
   >= 1
 EMIB_non_overlap_left_5_7_7_13: EMIB_w_var_5_7 + EMIB_x_grid_var_5_7
   - EMIB_x_grid_var_7_13 + 228 p_EMIB_left_5_7_7_13 <= 228
 EMIB_non_overlap_left_rev_5_7_7_13: - EMIB_w_var_5_7 - EMIB_x_grid_var_5_7
   + EMIB_x_grid_var_7_13 - 228 p_EMIB_left_5_7_7_13 <= 0
 EMIB_non_overlap_right_5_7_7_13: EMIB_w_var_7_13 - EMIB_x_grid_var_5_7
   + EMIB_x_grid_var_7_13 + 228 p_EMIB_right_5_7_7_13 <= 228
 EMIB_non_overlap_right_rev_5_7_7_13: - EMIB_w_var_7_13
   + EMIB_x_grid_var_5_7 - EMIB_x_grid_var_7_13 - 228 p_EMIB_right_5_7_7_13
   <= 0
 EMIB_non_overlap_down_5_7_7_13: EMIB_h_var_5_7 + EMIB_y_grid_var_5_7
   - EMIB_y_grid_var_7_13 + 228 p_EMIB_down_5_7_7_13 <= 228
 EMIB_non_overlap_down_rev_5_7_7_13: - EMIB_h_var_5_7 - EMIB_y_grid_var_5_7
   + EMIB_y_grid_var_7_13 - 228 p_EMIB_down_5_7_7_13 <= 0
 EMIB_non_overlap_up_5_7_7_13: EMIB_h_var_7_13 - EMIB_y_grid_var_5_7
   + EMIB_y_grid_var_7_13 + 228 p_EMIB_up_5_7_7_13 <= 228
 EMIB_non_overlap_up_rev_5_7_7_13: - EMIB_h_var_7_13 + EMIB_y_grid_var_5_7
   - EMIB_y_grid_var_7_13 - 228 p_EMIB_up_5_7_7_13 <= 0
 EMIB_non_overlap_any_5_7_7_14: p_EMIB_left_5_7_7_14
   + p_EMIB_right_5_7_7_14 + p_EMIB_down_5_7_7_14 + p_EMIB_up_5_7_7_14
   >= 1
 EMIB_non_overlap_left_5_7_7_14: EMIB_w_var_5_7 + EMIB_x_grid_var_5_7
   - EMIB_x_grid_var_7_14 + 228 p_EMIB_left_5_7_7_14 <= 228
 EMIB_non_overlap_left_rev_5_7_7_14: - EMIB_w_var_5_7 - EMIB_x_grid_var_5_7
   + EMIB_x_grid_var_7_14 - 228 p_EMIB_left_5_7_7_14 <= 0
 EMIB_non_overlap_right_5_7_7_14: EMIB_w_var_7_14 - EMIB_x_grid_var_5_7
   + EMIB_x_grid_var_7_14 + 228 p_EMIB_right_5_7_7_14 <= 228
 EMIB_non_overlap_right_rev_5_7_7_14: - EMIB_w_var_7_14
   + EMIB_x_grid_var_5_7 - EMIB_x_grid_var_7_14 - 228 p_EMIB_right_5_7_7_14
   <= 0
 EMIB_non_overlap_down_5_7_7_14: EMIB_h_var_5_7 + EMIB_y_grid_var_5_7
   - EMIB_y_grid_var_7_14 + 228 p_EMIB_down_5_7_7_14 <= 228
 EMIB_non_overlap_down_rev_5_7_7_14: - EMIB_h_var_5_7 - EMIB_y_grid_var_5_7
   + EMIB_y_grid_var_7_14 - 228 p_EMIB_down_5_7_7_14 <= 0
 EMIB_non_overlap_up_5_7_7_14: EMIB_h_var_7_14 - EMIB_y_grid_var_5_7
   + EMIB_y_grid_var_7_14 + 228 p_EMIB_up_5_7_7_14 <= 228
 EMIB_non_overlap_up_rev_5_7_7_14: - EMIB_h_var_7_14 + EMIB_y_grid_var_5_7
   - EMIB_y_grid_var_7_14 - 228 p_EMIB_up_5_7_7_14 <= 0
 EMIB_non_overlap_any_5_9_5_11: p_EMIB_left_5_9_5_11
   + p_EMIB_right_5_9_5_11 + p_EMIB_down_5_9_5_11 + p_EMIB_up_5_9_5_11
   >= 1
 EMIB_non_overlap_left_5_9_5_11: EMIB_w_var_5_9 + EMIB_x_grid_var_5_9
   - EMIB_x_grid_var_5_11 + 228 p_EMIB_left_5_9_5_11 <= 228
 EMIB_non_overlap_left_rev_5_9_5_11: - EMIB_w_var_5_9 - EMIB_x_grid_var_5_9
   + EMIB_x_grid_var_5_11 - 228 p_EMIB_left_5_9_5_11 <= 0
 EMIB_non_overlap_right_5_9_5_11: EMIB_w_var_5_11 - EMIB_x_grid_var_5_9
   + EMIB_x_grid_var_5_11 + 228 p_EMIB_right_5_9_5_11 <= 228
 EMIB_non_overlap_right_rev_5_9_5_11: - EMIB_w_var_5_11
   + EMIB_x_grid_var_5_9 - EMIB_x_grid_var_5_11 - 228 p_EMIB_right_5_9_5_11
   <= 0
 EMIB_non_overlap_down_5_9_5_11: EMIB_h_var_5_9 + EMIB_y_grid_var_5_9
   - EMIB_y_grid_var_5_11 + 228 p_EMIB_down_5_9_5_11 <= 228
 EMIB_non_overlap_down_rev_5_9_5_11: - EMIB_h_var_5_9 - EMIB_y_grid_var_5_9
   + EMIB_y_grid_var_5_11 - 228 p_EMIB_down_5_9_5_11 <= 0
 EMIB_non_overlap_up_5_9_5_11: EMIB_h_var_5_11 - EMIB_y_grid_var_5_9
   + EMIB_y_grid_var_5_11 + 228 p_EMIB_up_5_9_5_11 <= 228
 EMIB_non_overlap_up_rev_5_9_5_11: - EMIB_h_var_5_11 + EMIB_y_grid_var_5_9
   - EMIB_y_grid_var_5_11 - 228 p_EMIB_up_5_9_5_11 <= 0
 EMIB_non_overlap_any_5_9_5_12: p_EMIB_left_5_9_5_12
   + p_EMIB_right_5_9_5_12 + p_EMIB_down_5_9_5_12 + p_EMIB_up_5_9_5_12
   >= 1
 EMIB_non_overlap_left_5_9_5_12: EMIB_w_var_5_9 + EMIB_x_grid_var_5_9
   - EMIB_x_grid_var_5_12 + 228 p_EMIB_left_5_9_5_12 <= 228
 EMIB_non_overlap_left_rev_5_9_5_12: - EMIB_w_var_5_9 - EMIB_x_grid_var_5_9
   + EMIB_x_grid_var_5_12 - 228 p_EMIB_left_5_9_5_12 <= 0
 EMIB_non_overlap_right_5_9_5_12: EMIB_w_var_5_12 - EMIB_x_grid_var_5_9
   + EMIB_x_grid_var_5_12 + 228 p_EMIB_right_5_9_5_12 <= 228
 EMIB_non_overlap_right_rev_5_9_5_12: - EMIB_w_var_5_12
   + EMIB_x_grid_var_5_9 - EMIB_x_grid_var_5_12 - 228 p_EMIB_right_5_9_5_12
   <= 0
 EMIB_non_overlap_down_5_9_5_12: EMIB_h_var_5_9 + EMIB_y_grid_var_5_9
   - EMIB_y_grid_var_5_12 + 228 p_EMIB_down_5_9_5_12 <= 228
 EMIB_non_overlap_down_rev_5_9_5_12: - EMIB_h_var_5_9 - EMIB_y_grid_var_5_9
   + EMIB_y_grid_var_5_12 - 228 p_EMIB_down_5_9_5_12 <= 0
 EMIB_non_overlap_up_5_9_5_12: EMIB_h_var_5_12 - EMIB_y_grid_var_5_9
   + EMIB_y_grid_var_5_12 + 228 p_EMIB_up_5_9_5_12 <= 228
 EMIB_non_overlap_up_rev_5_9_5_12: - EMIB_h_var_5_12 + EMIB_y_grid_var_5_9
   - EMIB_y_grid_var_5_12 - 228 p_EMIB_up_5_9_5_12 <= 0
 EMIB_non_overlap_any_5_9_5_14: p_EMIB_left_5_9_5_14
   + p_EMIB_right_5_9_5_14 + p_EMIB_down_5_9_5_14 + p_EMIB_up_5_9_5_14
   >= 1
 EMIB_non_overlap_left_5_9_5_14: EMIB_w_var_5_9 + EMIB_x_grid_var_5_9
   - EMIB_x_grid_var_5_14 + 228 p_EMIB_left_5_9_5_14 <= 228
 EMIB_non_overlap_left_rev_5_9_5_14: - EMIB_w_var_5_9 - EMIB_x_grid_var_5_9
   + EMIB_x_grid_var_5_14 - 228 p_EMIB_left_5_9_5_14 <= 0
 EMIB_non_overlap_right_5_9_5_14: EMIB_w_var_5_14 - EMIB_x_grid_var_5_9
   + EMIB_x_grid_var_5_14 + 228 p_EMIB_right_5_9_5_14 <= 228
 EMIB_non_overlap_right_rev_5_9_5_14: - EMIB_w_var_5_14
   + EMIB_x_grid_var_5_9 - EMIB_x_grid_var_5_14 - 228 p_EMIB_right_5_9_5_14
   <= 0
 EMIB_non_overlap_down_5_9_5_14: EMIB_h_var_5_9 + EMIB_y_grid_var_5_9
   - EMIB_y_grid_var_5_14 + 228 p_EMIB_down_5_9_5_14 <= 228
 EMIB_non_overlap_down_rev_5_9_5_14: - EMIB_h_var_5_9 - EMIB_y_grid_var_5_9
   + EMIB_y_grid_var_5_14 - 228 p_EMIB_down_5_9_5_14 <= 0
 EMIB_non_overlap_up_5_9_5_14: EMIB_h_var_5_14 - EMIB_y_grid_var_5_9
   + EMIB_y_grid_var_5_14 + 228 p_EMIB_up_5_9_5_14 <= 228
 EMIB_non_overlap_up_rev_5_9_5_14: - EMIB_h_var_5_14 + EMIB_y_grid_var_5_9
   - EMIB_y_grid_var_5_14 - 228 p_EMIB_up_5_9_5_14 <= 0
 EMIB_non_overlap_any_5_9_9_14: p_EMIB_left_5_9_9_14
   + p_EMIB_right_5_9_9_14 + p_EMIB_down_5_9_9_14 + p_EMIB_up_5_9_9_14
   >= 1
 EMIB_non_overlap_left_5_9_9_14: EMIB_w_var_5_9 + EMIB_x_grid_var_5_9
   - EMIB_x_grid_var_9_14 + 228 p_EMIB_left_5_9_9_14 <= 228
 EMIB_non_overlap_left_rev_5_9_9_14: - EMIB_w_var_5_9 - EMIB_x_grid_var_5_9
   + EMIB_x_grid_var_9_14 - 228 p_EMIB_left_5_9_9_14 <= 0
 EMIB_non_overlap_right_5_9_9_14: EMIB_w_var_9_14 - EMIB_x_grid_var_5_9
   + EMIB_x_grid_var_9_14 + 228 p_EMIB_right_5_9_9_14 <= 228
 EMIB_non_overlap_right_rev_5_9_9_14: - EMIB_w_var_9_14
   + EMIB_x_grid_var_5_9 - EMIB_x_grid_var_9_14 - 228 p_EMIB_right_5_9_9_14
   <= 0
 EMIB_non_overlap_down_5_9_9_14: EMIB_h_var_5_9 + EMIB_y_grid_var_5_9
   - EMIB_y_grid_var_9_14 + 228 p_EMIB_down_5_9_9_14 <= 228
 EMIB_non_overlap_down_rev_5_9_9_14: - EMIB_h_var_5_9 - EMIB_y_grid_var_5_9
   + EMIB_y_grid_var_9_14 - 228 p_EMIB_down_5_9_9_14 <= 0
 EMIB_non_overlap_up_5_9_9_14: EMIB_h_var_9_14 - EMIB_y_grid_var_5_9
   + EMIB_y_grid_var_9_14 + 228 p_EMIB_up_5_9_9_14 <= 228
 EMIB_non_overlap_up_rev_5_9_9_14: - EMIB_h_var_9_14 + EMIB_y_grid_var_5_9
   - EMIB_y_grid_var_9_14 - 228 p_EMIB_up_5_9_9_14 <= 0
 EMIB_non_overlap_any_5_11_5_12: p_EMIB_left_5_11_5_12
   + p_EMIB_right_5_11_5_12 + p_EMIB_down_5_11_5_12 + p_EMIB_up_5_11_5_12
   >= 1
 EMIB_non_overlap_left_5_11_5_12: EMIB_w_var_5_11 + EMIB_x_grid_var_5_11
   - EMIB_x_grid_var_5_12 + 228 p_EMIB_left_5_11_5_12 <= 228
 EMIB_non_overlap_left_rev_5_11_5_12: - EMIB_w_var_5_11
   - EMIB_x_grid_var_5_11 + EMIB_x_grid_var_5_12
   - 228 p_EMIB_left_5_11_5_12 <= 0
 EMIB_non_overlap_right_5_11_5_12: EMIB_w_var_5_12 - EMIB_x_grid_var_5_11
   + EMIB_x_grid_var_5_12 + 228 p_EMIB_right_5_11_5_12 <= 228
 EMIB_non_overlap_right_rev_5_11_5_12: - EMIB_w_var_5_12
   + EMIB_x_grid_var_5_11 - EMIB_x_grid_var_5_12
   - 228 p_EMIB_right_5_11_5_12 <= 0
 EMIB_non_overlap_down_5_11_5_12: EMIB_h_var_5_11 + EMIB_y_grid_var_5_11
   - EMIB_y_grid_var_5_12 + 228 p_EMIB_down_5_11_5_12 <= 228
 EMIB_non_overlap_down_rev_5_11_5_12: - EMIB_h_var_5_11
   - EMIB_y_grid_var_5_11 + EMIB_y_grid_var_5_12
   - 228 p_EMIB_down_5_11_5_12 <= 0
 EMIB_non_overlap_up_5_11_5_12: EMIB_h_var_5_12 - EMIB_y_grid_var_5_11
   + EMIB_y_grid_var_5_12 + 228 p_EMIB_up_5_11_5_12 <= 228
 EMIB_non_overlap_up_rev_5_11_5_12: - EMIB_h_var_5_12
   + EMIB_y_grid_var_5_11 - EMIB_y_grid_var_5_12 - 228 p_EMIB_up_5_11_5_12
   <= 0
 EMIB_non_overlap_any_5_11_5_14: p_EMIB_left_5_11_5_14
   + p_EMIB_right_5_11_5_14 + p_EMIB_down_5_11_5_14 + p_EMIB_up_5_11_5_14
   >= 1
 EMIB_non_overlap_left_5_11_5_14: EMIB_w_var_5_11 + EMIB_x_grid_var_5_11
   - EMIB_x_grid_var_5_14 + 228 p_EMIB_left_5_11_5_14 <= 228
 EMIB_non_overlap_left_rev_5_11_5_14: - EMIB_w_var_5_11
   - EMIB_x_grid_var_5_11 + EMIB_x_grid_var_5_14
   - 228 p_EMIB_left_5_11_5_14 <= 0
 EMIB_non_overlap_right_5_11_5_14: EMIB_w_var_5_14 - EMIB_x_grid_var_5_11
   + EMIB_x_grid_var_5_14 + 228 p_EMIB_right_5_11_5_14 <= 228
 EMIB_non_overlap_right_rev_5_11_5_14: - EMIB_w_var_5_14
   + EMIB_x_grid_var_5_11 - EMIB_x_grid_var_5_14
   - 228 p_EMIB_right_5_11_5_14 <= 0
 EMIB_non_overlap_down_5_11_5_14: EMIB_h_var_5_11 + EMIB_y_grid_var_5_11
   - EMIB_y_grid_var_5_14 + 228 p_EMIB_down_5_11_5_14 <= 228
 EMIB_non_overlap_down_rev_5_11_5_14: - EMIB_h_var_5_11
   - EMIB_y_grid_var_5_11 + EMIB_y_grid_var_5_14
   - 228 p_EMIB_down_5_11_5_14 <= 0
 EMIB_non_overlap_up_5_11_5_14: EMIB_h_var_5_14 - EMIB_y_grid_var_5_11
   + EMIB_y_grid_var_5_14 + 228 p_EMIB_up_5_11_5_14 <= 228
 EMIB_non_overlap_up_rev_5_11_5_14: - EMIB_h_var_5_14
   + EMIB_y_grid_var_5_11 - EMIB_y_grid_var_5_14 - 228 p_EMIB_up_5_11_5_14
   <= 0
 EMIB_non_overlap_any_5_11_11_12: p_EMIB_left_5_11_11_12
   + p_EMIB_right_5_11_11_12 + p_EMIB_down_5_11_11_12
   + p_EMIB_up_5_11_11_12 >= 1
 EMIB_non_overlap_left_5_11_11_12: EMIB_w_var_5_11 + EMIB_x_grid_var_5_11
   - EMIB_x_grid_var_11_12 + 228 p_EMIB_left_5_11_11_12 <= 228
 EMIB_non_overlap_left_rev_5_11_11_12: - EMIB_w_var_5_11
   - EMIB_x_grid_var_5_11 + EMIB_x_grid_var_11_12
   - 228 p_EMIB_left_5_11_11_12 <= 0
 EMIB_non_overlap_right_5_11_11_12: EMIB_w_var_11_12 - EMIB_x_grid_var_5_11
   + EMIB_x_grid_var_11_12 + 228 p_EMIB_right_5_11_11_12 <= 228
 EMIB_non_overlap_right_rev_5_11_11_12: - EMIB_w_var_11_12
   + EMIB_x_grid_var_5_11 - EMIB_x_grid_var_11_12
   - 228 p_EMIB_right_5_11_11_12 <= 0
 EMIB_non_overlap_down_5_11_11_12: EMIB_h_var_5_11 + EMIB_y_grid_var_5_11
   - EMIB_y_grid_var_11_12 + 228 p_EMIB_down_5_11_11_12 <= 228
 EMIB_non_overlap_down_rev_5_11_11_12: - EMIB_h_var_5_11
   - EMIB_y_grid_var_5_11 + EMIB_y_grid_var_11_12
   - 228 p_EMIB_down_5_11_11_12 <= 0
 EMIB_non_overlap_up_5_11_11_12: EMIB_h_var_11_12 - EMIB_y_grid_var_5_11
   + EMIB_y_grid_var_11_12 + 228 p_EMIB_up_5_11_11_12 <= 228
 EMIB_non_overlap_up_rev_5_11_11_12: - EMIB_h_var_11_12
   + EMIB_y_grid_var_5_11 - EMIB_y_grid_var_11_12
   - 228 p_EMIB_up_5_11_11_12 <= 0
 EMIB_non_overlap_any_5_12_5_14: p_EMIB_left_5_12_5_14
   + p_EMIB_right_5_12_5_14 + p_EMIB_down_5_12_5_14 + p_EMIB_up_5_12_5_14
   >= 1
 EMIB_non_overlap_left_5_12_5_14: EMIB_w_var_5_12 + EMIB_x_grid_var_5_12
   - EMIB_x_grid_var_5_14 + 228 p_EMIB_left_5_12_5_14 <= 228
 EMIB_non_overlap_left_rev_5_12_5_14: - EMIB_w_var_5_12
   - EMIB_x_grid_var_5_12 + EMIB_x_grid_var_5_14
   - 228 p_EMIB_left_5_12_5_14 <= 0
 EMIB_non_overlap_right_5_12_5_14: EMIB_w_var_5_14 - EMIB_x_grid_var_5_12
   + EMIB_x_grid_var_5_14 + 228 p_EMIB_right_5_12_5_14 <= 228
 EMIB_non_overlap_right_rev_5_12_5_14: - EMIB_w_var_5_14
   + EMIB_x_grid_var_5_12 - EMIB_x_grid_var_5_14
   - 228 p_EMIB_right_5_12_5_14 <= 0
 EMIB_non_overlap_down_5_12_5_14: EMIB_h_var_5_12 + EMIB_y_grid_var_5_12
   - EMIB_y_grid_var_5_14 + 228 p_EMIB_down_5_12_5_14 <= 228
 EMIB_non_overlap_down_rev_5_12_5_14: - EMIB_h_var_5_12
   - EMIB_y_grid_var_5_12 + EMIB_y_grid_var_5_14
   - 228 p_EMIB_down_5_12_5_14 <= 0
 EMIB_non_overlap_up_5_12_5_14: EMIB_h_var_5_14 - EMIB_y_grid_var_5_12
   + EMIB_y_grid_var_5_14 + 228 p_EMIB_up_5_12_5_14 <= 228
 EMIB_non_overlap_up_rev_5_12_5_14: - EMIB_h_var_5_14
   + EMIB_y_grid_var_5_12 - EMIB_y_grid_var_5_14 - 228 p_EMIB_up_5_12_5_14
   <= 0
 EMIB_non_overlap_any_5_12_6_12: p_EMIB_left_5_12_6_12
   + p_EMIB_right_5_12_6_12 + p_EMIB_down_5_12_6_12 + p_EMIB_up_5_12_6_12
   >= 1
 EMIB_non_overlap_left_5_12_6_12: EMIB_w_var_5_12 + EMIB_x_grid_var_5_12
   - EMIB_x_grid_var_6_12 + 228 p_EMIB_left_5_12_6_12 <= 228
 EMIB_non_overlap_left_rev_5_12_6_12: - EMIB_w_var_5_12
   - EMIB_x_grid_var_5_12 + EMIB_x_grid_var_6_12
   - 228 p_EMIB_left_5_12_6_12 <= 0
 EMIB_non_overlap_right_5_12_6_12: EMIB_w_var_6_12 - EMIB_x_grid_var_5_12
   + EMIB_x_grid_var_6_12 + 228 p_EMIB_right_5_12_6_12 <= 228
 EMIB_non_overlap_right_rev_5_12_6_12: - EMIB_w_var_6_12
   + EMIB_x_grid_var_5_12 - EMIB_x_grid_var_6_12
   - 228 p_EMIB_right_5_12_6_12 <= 0
 EMIB_non_overlap_down_5_12_6_12: EMIB_h_var_5_12 + EMIB_y_grid_var_5_12
   - EMIB_y_grid_var_6_12 + 228 p_EMIB_down_5_12_6_12 <= 228
 EMIB_non_overlap_down_rev_5_12_6_12: - EMIB_h_var_5_12
   - EMIB_y_grid_var_5_12 + EMIB_y_grid_var_6_12
   - 228 p_EMIB_down_5_12_6_12 <= 0
 EMIB_non_overlap_up_5_12_6_12: EMIB_h_var_6_12 - EMIB_y_grid_var_5_12
   + EMIB_y_grid_var_6_12 + 228 p_EMIB_up_5_12_6_12 <= 228
 EMIB_non_overlap_up_rev_5_12_6_12: - EMIB_h_var_6_12
   + EMIB_y_grid_var_5_12 - EMIB_y_grid_var_6_12 - 228 p_EMIB_up_5_12_6_12
   <= 0
 EMIB_non_overlap_any_5_12_10_12: p_EMIB_left_5_12_10_12
   + p_EMIB_right_5_12_10_12 + p_EMIB_down_5_12_10_12
   + p_EMIB_up_5_12_10_12 >= 1
 EMIB_non_overlap_left_5_12_10_12: EMIB_w_var_5_12 + EMIB_x_grid_var_5_12
   - EMIB_x_grid_var_10_12 + 228 p_EMIB_left_5_12_10_12 <= 228
 EMIB_non_overlap_left_rev_5_12_10_12: - EMIB_w_var_5_12
   - EMIB_x_grid_var_5_12 + EMIB_x_grid_var_10_12
   - 228 p_EMIB_left_5_12_10_12 <= 0
 EMIB_non_overlap_right_5_12_10_12: EMIB_w_var_10_12 - EMIB_x_grid_var_5_12
   + EMIB_x_grid_var_10_12 + 228 p_EMIB_right_5_12_10_12 <= 228
 EMIB_non_overlap_right_rev_5_12_10_12: - EMIB_w_var_10_12
   + EMIB_x_grid_var_5_12 - EMIB_x_grid_var_10_12
   - 228 p_EMIB_right_5_12_10_12 <= 0
 EMIB_non_overlap_down_5_12_10_12: EMIB_h_var_5_12 + EMIB_y_grid_var_5_12
   - EMIB_y_grid_var_10_12 + 228 p_EMIB_down_5_12_10_12 <= 228
 EMIB_non_overlap_down_rev_5_12_10_12: - EMIB_h_var_5_12
   - EMIB_y_grid_var_5_12 + EMIB_y_grid_var_10_12
   - 228 p_EMIB_down_5_12_10_12 <= 0
 EMIB_non_overlap_up_5_12_10_12: EMIB_h_var_10_12 - EMIB_y_grid_var_5_12
   + EMIB_y_grid_var_10_12 + 228 p_EMIB_up_5_12_10_12 <= 228
 EMIB_non_overlap_up_rev_5_12_10_12: - EMIB_h_var_10_12
   + EMIB_y_grid_var_5_12 - EMIB_y_grid_var_10_12
   - 228 p_EMIB_up_5_12_10_12 <= 0
 EMIB_non_overlap_any_5_12_11_12: p_EMIB_left_5_12_11_12
   + p_EMIB_right_5_12_11_12 + p_EMIB_down_5_12_11_12
   + p_EMIB_up_5_12_11_12 >= 1
 EMIB_non_overlap_left_5_12_11_12: EMIB_w_var_5_12 + EMIB_x_grid_var_5_12
   - EMIB_x_grid_var_11_12 + 228 p_EMIB_left_5_12_11_12 <= 228
 EMIB_non_overlap_left_rev_5_12_11_12: - EMIB_w_var_5_12
   - EMIB_x_grid_var_5_12 + EMIB_x_grid_var_11_12
   - 228 p_EMIB_left_5_12_11_12 <= 0
 EMIB_non_overlap_right_5_12_11_12: EMIB_w_var_11_12 - EMIB_x_grid_var_5_12
   + EMIB_x_grid_var_11_12 + 228 p_EMIB_right_5_12_11_12 <= 228
 EMIB_non_overlap_right_rev_5_12_11_12: - EMIB_w_var_11_12
   + EMIB_x_grid_var_5_12 - EMIB_x_grid_var_11_12
   - 228 p_EMIB_right_5_12_11_12 <= 0
 EMIB_non_overlap_down_5_12_11_12: EMIB_h_var_5_12 + EMIB_y_grid_var_5_12
   - EMIB_y_grid_var_11_12 + 228 p_EMIB_down_5_12_11_12 <= 228
 EMIB_non_overlap_down_rev_5_12_11_12: - EMIB_h_var_5_12
   - EMIB_y_grid_var_5_12 + EMIB_y_grid_var_11_12
   - 228 p_EMIB_down_5_12_11_12 <= 0
 EMIB_non_overlap_up_5_12_11_12: EMIB_h_var_11_12 - EMIB_y_grid_var_5_12
   + EMIB_y_grid_var_11_12 + 228 p_EMIB_up_5_12_11_12 <= 228
 EMIB_non_overlap_up_rev_5_12_11_12: - EMIB_h_var_11_12
   + EMIB_y_grid_var_5_12 - EMIB_y_grid_var_11_12
   - 228 p_EMIB_up_5_12_11_12 <= 0
 EMIB_non_overlap_any_5_12_12_13: p_EMIB_left_5_12_12_13
   + p_EMIB_right_5_12_12_13 + p_EMIB_down_5_12_12_13
   + p_EMIB_up_5_12_12_13 >= 1
 EMIB_non_overlap_left_5_12_12_13: EMIB_w_var_5_12 + EMIB_x_grid_var_5_12
   - EMIB_x_grid_var_12_13 + 228 p_EMIB_left_5_12_12_13 <= 228
 EMIB_non_overlap_left_rev_5_12_12_13: - EMIB_w_var_5_12
   - EMIB_x_grid_var_5_12 + EMIB_x_grid_var_12_13
   - 228 p_EMIB_left_5_12_12_13 <= 0
 EMIB_non_overlap_right_5_12_12_13: EMIB_w_var_12_13 - EMIB_x_grid_var_5_12
   + EMIB_x_grid_var_12_13 + 228 p_EMIB_right_5_12_12_13 <= 228
 EMIB_non_overlap_right_rev_5_12_12_13: - EMIB_w_var_12_13
   + EMIB_x_grid_var_5_12 - EMIB_x_grid_var_12_13
   - 228 p_EMIB_right_5_12_12_13 <= 0
 EMIB_non_overlap_down_5_12_12_13: EMIB_h_var_5_12 + EMIB_y_grid_var_5_12
   - EMIB_y_grid_var_12_13 + 228 p_EMIB_down_5_12_12_13 <= 228
 EMIB_non_overlap_down_rev_5_12_12_13: - EMIB_h_var_5_12
   - EMIB_y_grid_var_5_12 + EMIB_y_grid_var_12_13
   - 228 p_EMIB_down_5_12_12_13 <= 0
 EMIB_non_overlap_up_5_12_12_13: EMIB_h_var_12_13 - EMIB_y_grid_var_5_12
   + EMIB_y_grid_var_12_13 + 228 p_EMIB_up_5_12_12_13 <= 228
 EMIB_non_overlap_up_rev_5_12_12_13: - EMIB_h_var_12_13
   + EMIB_y_grid_var_5_12 - EMIB_y_grid_var_12_13
   - 228 p_EMIB_up_5_12_12_13 <= 0
 EMIB_non_overlap_any_5_14_7_14: p_EMIB_left_5_14_7_14
   + p_EMIB_right_5_14_7_14 + p_EMIB_down_5_14_7_14 + p_EMIB_up_5_14_7_14
   >= 1
 EMIB_non_overlap_left_5_14_7_14: EMIB_w_var_5_14 + EMIB_x_grid_var_5_14
   - EMIB_x_grid_var_7_14 + 228 p_EMIB_left_5_14_7_14 <= 228
 EMIB_non_overlap_left_rev_5_14_7_14: - EMIB_w_var_5_14
   - EMIB_x_grid_var_5_14 + EMIB_x_grid_var_7_14
   - 228 p_EMIB_left_5_14_7_14 <= 0
 EMIB_non_overlap_right_5_14_7_14: EMIB_w_var_7_14 - EMIB_x_grid_var_5_14
   + EMIB_x_grid_var_7_14 + 228 p_EMIB_right_5_14_7_14 <= 228
 EMIB_non_overlap_right_rev_5_14_7_14: - EMIB_w_var_7_14
   + EMIB_x_grid_var_5_14 - EMIB_x_grid_var_7_14
   - 228 p_EMIB_right_5_14_7_14 <= 0
 EMIB_non_overlap_down_5_14_7_14: EMIB_h_var_5_14 + EMIB_y_grid_var_5_14
   - EMIB_y_grid_var_7_14 + 228 p_EMIB_down_5_14_7_14 <= 228
 EMIB_non_overlap_down_rev_5_14_7_14: - EMIB_h_var_5_14
   - EMIB_y_grid_var_5_14 + EMIB_y_grid_var_7_14
   - 228 p_EMIB_down_5_14_7_14 <= 0
 EMIB_non_overlap_up_5_14_7_14: EMIB_h_var_7_14 - EMIB_y_grid_var_5_14
   + EMIB_y_grid_var_7_14 + 228 p_EMIB_up_5_14_7_14 <= 228
 EMIB_non_overlap_up_rev_5_14_7_14: - EMIB_h_var_7_14
   + EMIB_y_grid_var_5_14 - EMIB_y_grid_var_7_14 - 228 p_EMIB_up_5_14_7_14
   <= 0
 EMIB_non_overlap_any_5_14_9_14: p_EMIB_left_5_14_9_14
   + p_EMIB_right_5_14_9_14 + p_EMIB_down_5_14_9_14 + p_EMIB_up_5_14_9_14
   >= 1
 EMIB_non_overlap_left_5_14_9_14: EMIB_w_var_5_14 + EMIB_x_grid_var_5_14
   - EMIB_x_grid_var_9_14 + 228 p_EMIB_left_5_14_9_14 <= 228
 EMIB_non_overlap_left_rev_5_14_9_14: - EMIB_w_var_5_14
   - EMIB_x_grid_var_5_14 + EMIB_x_grid_var_9_14
   - 228 p_EMIB_left_5_14_9_14 <= 0
 EMIB_non_overlap_right_5_14_9_14: EMIB_w_var_9_14 - EMIB_x_grid_var_5_14
   + EMIB_x_grid_var_9_14 + 228 p_EMIB_right_5_14_9_14 <= 228
 EMIB_non_overlap_right_rev_5_14_9_14: - EMIB_w_var_9_14
   + EMIB_x_grid_var_5_14 - EMIB_x_grid_var_9_14
   - 228 p_EMIB_right_5_14_9_14 <= 0
 EMIB_non_overlap_down_5_14_9_14: EMIB_h_var_5_14 + EMIB_y_grid_var_5_14
   - EMIB_y_grid_var_9_14 + 228 p_EMIB_down_5_14_9_14 <= 228
 EMIB_non_overlap_down_rev_5_14_9_14: - EMIB_h_var_5_14
   - EMIB_y_grid_var_5_14 + EMIB_y_grid_var_9_14
   - 228 p_EMIB_down_5_14_9_14 <= 0
 EMIB_non_overlap_up_5_14_9_14: EMIB_h_var_9_14 - EMIB_y_grid_var_5_14
   + EMIB_y_grid_var_9_14 + 228 p_EMIB_up_5_14_9_14 <= 228
 EMIB_non_overlap_up_rev_5_14_9_14: - EMIB_h_var_9_14
   + EMIB_y_grid_var_5_14 - EMIB_y_grid_var_9_14 - 228 p_EMIB_up_5_14_9_14
   <= 0
 EMIB_non_overlap_any_5_14_13_14: p_EMIB_left_5_14_13_14
   + p_EMIB_right_5_14_13_14 + p_EMIB_down_5_14_13_14
   + p_EMIB_up_5_14_13_14 >= 1
 EMIB_non_overlap_left_5_14_13_14: EMIB_w_var_5_14 + EMIB_x_grid_var_5_14
   - EMIB_x_grid_var_13_14 + 228 p_EMIB_left_5_14_13_14 <= 228
 EMIB_non_overlap_left_rev_5_14_13_14: - EMIB_w_var_5_14
   - EMIB_x_grid_var_5_14 + EMIB_x_grid_var_13_14
   - 228 p_EMIB_left_5_14_13_14 <= 0
 EMIB_non_overlap_right_5_14_13_14: EMIB_w_var_13_14 - EMIB_x_grid_var_5_14
   + EMIB_x_grid_var_13_14 + 228 p_EMIB_right_5_14_13_14 <= 228
 EMIB_non_overlap_right_rev_5_14_13_14: - EMIB_w_var_13_14
   + EMIB_x_grid_var_5_14 - EMIB_x_grid_var_13_14
   - 228 p_EMIB_right_5_14_13_14 <= 0
 EMIB_non_overlap_down_5_14_13_14: EMIB_h_var_5_14 + EMIB_y_grid_var_5_14
   - EMIB_y_grid_var_13_14 + 228 p_EMIB_down_5_14_13_14 <= 228
 EMIB_non_overlap_down_rev_5_14_13_14: - EMIB_h_var_5_14
   - EMIB_y_grid_var_5_14 + EMIB_y_grid_var_13_14
   - 228 p_EMIB_down_5_14_13_14 <= 0
 EMIB_non_overlap_up_5_14_13_14: EMIB_h_var_13_14 - EMIB_y_grid_var_5_14
   + EMIB_y_grid_var_13_14 + 228 p_EMIB_up_5_14_13_14 <= 228
 EMIB_non_overlap_up_rev_5_14_13_14: - EMIB_h_var_13_14
   + EMIB_y_grid_var_5_14 - EMIB_y_grid_var_13_14
   - 228 p_EMIB_up_5_14_13_14 <= 0
 EMIB_non_overlap_any_6_12_10_12: p_EMIB_left_6_12_10_12
   + p_EMIB_right_6_12_10_12 + p_EMIB_down_6_12_10_12
   + p_EMIB_up_6_12_10_12 >= 1
 EMIB_non_overlap_left_6_12_10_12: EMIB_w_var_6_12 + EMIB_x_grid_var_6_12
   - EMIB_x_grid_var_10_12 + 228 p_EMIB_left_6_12_10_12 <= 228
 EMIB_non_overlap_left_rev_6_12_10_12: - EMIB_w_var_6_12
   - EMIB_x_grid_var_6_12 + EMIB_x_grid_var_10_12
   - 228 p_EMIB_left_6_12_10_12 <= 0
 EMIB_non_overlap_right_6_12_10_12: EMIB_w_var_10_12 - EMIB_x_grid_var_6_12
   + EMIB_x_grid_var_10_12 + 228 p_EMIB_right_6_12_10_12 <= 228
 EMIB_non_overlap_right_rev_6_12_10_12: - EMIB_w_var_10_12
   + EMIB_x_grid_var_6_12 - EMIB_x_grid_var_10_12
   - 228 p_EMIB_right_6_12_10_12 <= 0
 EMIB_non_overlap_down_6_12_10_12: EMIB_h_var_6_12 + EMIB_y_grid_var_6_12
   - EMIB_y_grid_var_10_12 + 228 p_EMIB_down_6_12_10_12 <= 228
 EMIB_non_overlap_down_rev_6_12_10_12: - EMIB_h_var_6_12
   - EMIB_y_grid_var_6_12 + EMIB_y_grid_var_10_12
   - 228 p_EMIB_down_6_12_10_12 <= 0
 EMIB_non_overlap_up_6_12_10_12: EMIB_h_var_10_12 - EMIB_y_grid_var_6_12
   + EMIB_y_grid_var_10_12 + 228 p_EMIB_up_6_12_10_12 <= 228
 EMIB_non_overlap_up_rev_6_12_10_12: - EMIB_h_var_10_12
   + EMIB_y_grid_var_6_12 - EMIB_y_grid_var_10_12
   - 228 p_EMIB_up_6_12_10_12 <= 0
 EMIB_non_overlap_any_6_12_11_12: p_EMIB_left_6_12_11_12
   + p_EMIB_right_6_12_11_12 + p_EMIB_down_6_12_11_12
   + p_EMIB_up_6_12_11_12 >= 1
 EMIB_non_overlap_left_6_12_11_12: EMIB_w_var_6_12 + EMIB_x_grid_var_6_12
   - EMIB_x_grid_var_11_12 + 228 p_EMIB_left_6_12_11_12 <= 228
 EMIB_non_overlap_left_rev_6_12_11_12: - EMIB_w_var_6_12
   - EMIB_x_grid_var_6_12 + EMIB_x_grid_var_11_12
   - 228 p_EMIB_left_6_12_11_12 <= 0
 EMIB_non_overlap_right_6_12_11_12: EMIB_w_var_11_12 - EMIB_x_grid_var_6_12
   + EMIB_x_grid_var_11_12 + 228 p_EMIB_right_6_12_11_12 <= 228
 EMIB_non_overlap_right_rev_6_12_11_12: - EMIB_w_var_11_12
   + EMIB_x_grid_var_6_12 - EMIB_x_grid_var_11_12
   - 228 p_EMIB_right_6_12_11_12 <= 0
 EMIB_non_overlap_down_6_12_11_12: EMIB_h_var_6_12 + EMIB_y_grid_var_6_12
   - EMIB_y_grid_var_11_12 + 228 p_EMIB_down_6_12_11_12 <= 228
 EMIB_non_overlap_down_rev_6_12_11_12: - EMIB_h_var_6_12
   - EMIB_y_grid_var_6_12 + EMIB_y_grid_var_11_12
   - 228 p_EMIB_down_6_12_11_12 <= 0
 EMIB_non_overlap_up_6_12_11_12: EMIB_h_var_11_12 - EMIB_y_grid_var_6_12
   + EMIB_y_grid_var_11_12 + 228 p_EMIB_up_6_12_11_12 <= 228
 EMIB_non_overlap_up_rev_6_12_11_12: - EMIB_h_var_11_12
   + EMIB_y_grid_var_6_12 - EMIB_y_grid_var_11_12
   - 228 p_EMIB_up_6_12_11_12 <= 0
 EMIB_non_overlap_any_6_12_12_13: p_EMIB_left_6_12_12_13
   + p_EMIB_right_6_12_12_13 + p_EMIB_down_6_12_12_13
   + p_EMIB_up_6_12_12_13 >= 1
 EMIB_non_overlap_left_6_12_12_13: EMIB_w_var_6_12 + EMIB_x_grid_var_6_12
   - EMIB_x_grid_var_12_13 + 228 p_EMIB_left_6_12_12_13 <= 228
 EMIB_non_overlap_left_rev_6_12_12_13: - EMIB_w_var_6_12
   - EMIB_x_grid_var_6_12 + EMIB_x_grid_var_12_13
   - 228 p_EMIB_left_6_12_12_13 <= 0
 EMIB_non_overlap_right_6_12_12_13: EMIB_w_var_12_13 - EMIB_x_grid_var_6_12
   + EMIB_x_grid_var_12_13 + 228 p_EMIB_right_6_12_12_13 <= 228
 EMIB_non_overlap_right_rev_6_12_12_13: - EMIB_w_var_12_13
   + EMIB_x_grid_var_6_12 - EMIB_x_grid_var_12_13
   - 228 p_EMIB_right_6_12_12_13 <= 0
 EMIB_non_overlap_down_6_12_12_13: EMIB_h_var_6_12 + EMIB_y_grid_var_6_12
   - EMIB_y_grid_var_12_13 + 228 p_EMIB_down_6_12_12_13 <= 228
 EMIB_non_overlap_down_rev_6_12_12_13: - EMIB_h_var_6_12
   - EMIB_y_grid_var_6_12 + EMIB_y_grid_var_12_13
   - 228 p_EMIB_down_6_12_12_13 <= 0
 EMIB_non_overlap_up_6_12_12_13: EMIB_h_var_12_13 - EMIB_y_grid_var_6_12
   + EMIB_y_grid_var_12_13 + 228 p_EMIB_up_6_12_12_13 <= 228
 EMIB_non_overlap_up_rev_6_12_12_13: - EMIB_h_var_12_13
   + EMIB_y_grid_var_6_12 - EMIB_y_grid_var_12_13
   - 228 p_EMIB_up_6_12_12_13 <= 0
 EMIB_non_overlap_any_7_13_7_14: p_EMIB_left_7_13_7_14
   + p_EMIB_right_7_13_7_14 + p_EMIB_down_7_13_7_14 + p_EMIB_up_7_13_7_14
   >= 1
 EMIB_non_overlap_left_7_13_7_14: EMIB_w_var_7_13 + EMIB_x_grid_var_7_13
   - EMIB_x_grid_var_7_14 + 228 p_EMIB_left_7_13_7_14 <= 228
 EMIB_non_overlap_left_rev_7_13_7_14: - EMIB_w_var_7_13
   - EMIB_x_grid_var_7_13 + EMIB_x_grid_var_7_14
   - 228 p_EMIB_left_7_13_7_14 <= 0
 EMIB_non_overlap_right_7_13_7_14: EMIB_w_var_7_14 - EMIB_x_grid_var_7_13
   + EMIB_x_grid_var_7_14 + 228 p_EMIB_right_7_13_7_14 <= 228
 EMIB_non_overlap_right_rev_7_13_7_14: - EMIB_w_var_7_14
   + EMIB_x_grid_var_7_13 - EMIB_x_grid_var_7_14
   - 228 p_EMIB_right_7_13_7_14 <= 0
 EMIB_non_overlap_down_7_13_7_14: EMIB_h_var_7_13 + EMIB_y_grid_var_7_13
   - EMIB_y_grid_var_7_14 + 228 p_EMIB_down_7_13_7_14 <= 228
 EMIB_non_overlap_down_rev_7_13_7_14: - EMIB_h_var_7_13
   - EMIB_y_grid_var_7_13 + EMIB_y_grid_var_7_14
   - 228 p_EMIB_down_7_13_7_14 <= 0
 EMIB_non_overlap_up_7_13_7_14: EMIB_h_var_7_14 - EMIB_y_grid_var_7_13
   + EMIB_y_grid_var_7_14 + 228 p_EMIB_up_7_13_7_14 <= 228
 EMIB_non_overlap_up_rev_7_13_7_14: - EMIB_h_var_7_14
   + EMIB_y_grid_var_7_13 - EMIB_y_grid_var_7_14 - 228 p_EMIB_up_7_13_7_14
   <= 0
 EMIB_non_overlap_any_7_13_12_13: p_EMIB_left_7_13_12_13
   + p_EMIB_right_7_13_12_13 + p_EMIB_down_7_13_12_13
   + p_EMIB_up_7_13_12_13 >= 1
 EMIB_non_overlap_left_7_13_12_13: EMIB_w_var_7_13 + EMIB_x_grid_var_7_13
   - EMIB_x_grid_var_12_13 + 228 p_EMIB_left_7_13_12_13 <= 228
 EMIB_non_overlap_left_rev_7_13_12_13: - EMIB_w_var_7_13
   - EMIB_x_grid_var_7_13 + EMIB_x_grid_var_12_13
   - 228 p_EMIB_left_7_13_12_13 <= 0
 EMIB_non_overlap_right_7_13_12_13: EMIB_w_var_12_13 - EMIB_x_grid_var_7_13
   + EMIB_x_grid_var_12_13 + 228 p_EMIB_right_7_13_12_13 <= 228
 EMIB_non_overlap_right_rev_7_13_12_13: - EMIB_w_var_12_13
   + EMIB_x_grid_var_7_13 - EMIB_x_grid_var_12_13
   - 228 p_EMIB_right_7_13_12_13 <= 0
 EMIB_non_overlap_down_7_13_12_13: EMIB_h_var_7_13 + EMIB_y_grid_var_7_13
   - EMIB_y_grid_var_12_13 + 228 p_EMIB_down_7_13_12_13 <= 228
 EMIB_non_overlap_down_rev_7_13_12_13: - EMIB_h_var_7_13
   - EMIB_y_grid_var_7_13 + EMIB_y_grid_var_12_13
   - 228 p_EMIB_down_7_13_12_13 <= 0
 EMIB_non_overlap_up_7_13_12_13: EMIB_h_var_12_13 - EMIB_y_grid_var_7_13
   + EMIB_y_grid_var_12_13 + 228 p_EMIB_up_7_13_12_13 <= 228
 EMIB_non_overlap_up_rev_7_13_12_13: - EMIB_h_var_12_13
   + EMIB_y_grid_var_7_13 - EMIB_y_grid_var_12_13
   - 228 p_EMIB_up_7_13_12_13 <= 0
 EMIB_non_overlap_any_7_13_13_14: p_EMIB_left_7_13_13_14
   + p_EMIB_right_7_13_13_14 + p_EMIB_down_7_13_13_14
   + p_EMIB_up_7_13_13_14 >= 1
 EMIB_non_overlap_left_7_13_13_14: EMIB_w_var_7_13 + EMIB_x_grid_var_7_13
   - EMIB_x_grid_var_13_14 + 228 p_EMIB_left_7_13_13_14 <= 228
 EMIB_non_overlap_left_rev_7_13_13_14: - EMIB_w_var_7_13
   - EMIB_x_grid_var_7_13 + EMIB_x_grid_var_13_14
   - 228 p_EMIB_left_7_13_13_14 <= 0
 EMIB_non_overlap_right_7_13_13_14: EMIB_w_var_13_14 - EMIB_x_grid_var_7_13
   + EMIB_x_grid_var_13_14 + 228 p_EMIB_right_7_13_13_14 <= 228
 EMIB_non_overlap_right_rev_7_13_13_14: - EMIB_w_var_13_14
   + EMIB_x_grid_var_7_13 - EMIB_x_grid_var_13_14
   - 228 p_EMIB_right_7_13_13_14 <= 0
 EMIB_non_overlap_down_7_13_13_14: EMIB_h_var_7_13 + EMIB_y_grid_var_7_13
   - EMIB_y_grid_var_13_14 + 228 p_EMIB_down_7_13_13_14 <= 228
 EMIB_non_overlap_down_rev_7_13_13_14: - EMIB_h_var_7_13
   - EMIB_y_grid_var_7_13 + EMIB_y_grid_var_13_14
   - 228 p_EMIB_down_7_13_13_14 <= 0
 EMIB_non_overlap_up_7_13_13_14: EMIB_h_var_13_14 - EMIB_y_grid_var_7_13
   + EMIB_y_grid_var_13_14 + 228 p_EMIB_up_7_13_13_14 <= 228
 EMIB_non_overlap_up_rev_7_13_13_14: - EMIB_h_var_13_14
   + EMIB_y_grid_var_7_13 - EMIB_y_grid_var_13_14
   - 228 p_EMIB_up_7_13_13_14 <= 0
 EMIB_non_overlap_any_7_14_9_14: p_EMIB_left_7_14_9_14
   + p_EMIB_right_7_14_9_14 + p_EMIB_down_7_14_9_14 + p_EMIB_up_7_14_9_14
   >= 1
 EMIB_non_overlap_left_7_14_9_14: EMIB_w_var_7_14 + EMIB_x_grid_var_7_14
   - EMIB_x_grid_var_9_14 + 228 p_EMIB_left_7_14_9_14 <= 228
 EMIB_non_overlap_left_rev_7_14_9_14: - EMIB_w_var_7_14
   - EMIB_x_grid_var_7_14 + EMIB_x_grid_var_9_14
   - 228 p_EMIB_left_7_14_9_14 <= 0
 EMIB_non_overlap_right_7_14_9_14: EMIB_w_var_9_14 - EMIB_x_grid_var_7_14
   + EMIB_x_grid_var_9_14 + 228 p_EMIB_right_7_14_9_14 <= 228
 EMIB_non_overlap_right_rev_7_14_9_14: - EMIB_w_var_9_14
   + EMIB_x_grid_var_7_14 - EMIB_x_grid_var_9_14
   - 228 p_EMIB_right_7_14_9_14 <= 0
 EMIB_non_overlap_down_7_14_9_14: EMIB_h_var_7_14 + EMIB_y_grid_var_7_14
   - EMIB_y_grid_var_9_14 + 228 p_EMIB_down_7_14_9_14 <= 228
 EMIB_non_overlap_down_rev_7_14_9_14: - EMIB_h_var_7_14
   - EMIB_y_grid_var_7_14 + EMIB_y_grid_var_9_14
   - 228 p_EMIB_down_7_14_9_14 <= 0
 EMIB_non_overlap_up_7_14_9_14: EMIB_h_var_9_14 - EMIB_y_grid_var_7_14
   + EMIB_y_grid_var_9_14 + 228 p_EMIB_up_7_14_9_14 <= 228
 EMIB_non_overlap_up_rev_7_14_9_14: - EMIB_h_var_9_14
   + EMIB_y_grid_var_7_14 - EMIB_y_grid_var_9_14 - 228 p_EMIB_up_7_14_9_14
   <= 0
 EMIB_non_overlap_any_7_14_13_14: p_EMIB_left_7_14_13_14
   + p_EMIB_right_7_14_13_14 + p_EMIB_down_7_14_13_14
   + p_EMIB_up_7_14_13_14 >= 1
 EMIB_non_overlap_left_7_14_13_14: EMIB_w_var_7_14 + EMIB_x_grid_var_7_14
   - EMIB_x_grid_var_13_14 + 228 p_EMIB_left_7_14_13_14 <= 228
 EMIB_non_overlap_left_rev_7_14_13_14: - EMIB_w_var_7_14
   - EMIB_x_grid_var_7_14 + EMIB_x_grid_var_13_14
   - 228 p_EMIB_left_7_14_13_14 <= 0
 EMIB_non_overlap_right_7_14_13_14: EMIB_w_var_13_14 - EMIB_x_grid_var_7_14
   + EMIB_x_grid_var_13_14 + 228 p_EMIB_right_7_14_13_14 <= 228
 EMIB_non_overlap_right_rev_7_14_13_14: - EMIB_w_var_13_14
   + EMIB_x_grid_var_7_14 - EMIB_x_grid_var_13_14
   - 228 p_EMIB_right_7_14_13_14 <= 0
 EMIB_non_overlap_down_7_14_13_14: EMIB_h_var_7_14 + EMIB_y_grid_var_7_14
   - EMIB_y_grid_var_13_14 + 228 p_EMIB_down_7_14_13_14 <= 228
 EMIB_non_overlap_down_rev_7_14_13_14: - EMIB_h_var_7_14
   - EMIB_y_grid_var_7_14 + EMIB_y_grid_var_13_14
   - 228 p_EMIB_down_7_14_13_14 <= 0
 EMIB_non_overlap_up_7_14_13_14: EMIB_h_var_13_14 - EMIB_y_grid_var_7_14
   + EMIB_y_grid_var_13_14 + 228 p_EMIB_up_7_14_13_14 <= 228
 EMIB_non_overlap_up_rev_7_14_13_14: - EMIB_h_var_13_14
   + EMIB_y_grid_var_7_14 - EMIB_y_grid_var_13_14
   - 228 p_EMIB_up_7_14_13_14 <= 0
 EMIB_non_overlap_any_9_14_13_14: p_EMIB_left_9_14_13_14
   + p_EMIB_right_9_14_13_14 + p_EMIB_down_9_14_13_14
   + p_EMIB_up_9_14_13_14 >= 1
 EMIB_non_overlap_left_9_14_13_14: EMIB_w_var_9_14 + EMIB_x_grid_var_9_14
   - EMIB_x_grid_var_13_14 + 228 p_EMIB_left_9_14_13_14 <= 228
 EMIB_non_overlap_left_rev_9_14_13_14: - EMIB_w_var_9_14
   - EMIB_x_grid_var_9_14 + EMIB_x_grid_var_13_14
   - 228 p_EMIB_left_9_14_13_14 <= 0
 EMIB_non_overlap_right_9_14_13_14: EMIB_w_var_13_14 - EMIB_x_grid_var_9_14
   + EMIB_x_grid_var_13_14 + 228 p_EMIB_right_9_14_13_14 <= 228
 EMIB_non_overlap_right_rev_9_14_13_14: - EMIB_w_var_13_14
   + EMIB_x_grid_var_9_14 - EMIB_x_grid_var_13_14
   - 228 p_EMIB_right_9_14_13_14 <= 0
 EMIB_non_overlap_down_9_14_13_14: EMIB_h_var_9_14 + EMIB_y_grid_var_9_14
   - EMIB_y_grid_var_13_14 + 228 p_EMIB_down_9_14_13_14 <= 228
 EMIB_non_overlap_down_rev_9_14_13_14: - EMIB_h_var_9_14
   - EMIB_y_grid_var_9_14 + EMIB_y_grid_var_13_14
   - 228 p_EMIB_down_9_14_13_14 <= 0
 EMIB_non_overlap_up_9_14_13_14: EMIB_h_var_13_14 - EMIB_y_grid_var_9_14
   + EMIB_y_grid_var_13_14 + 228 p_EMIB_up_9_14_13_14 <= 228
 EMIB_non_overlap_up_rev_9_14_13_14: - EMIB_h_var_13_14
   + EMIB_y_grid_var_9_14 - EMIB_y_grid_var_13_14
   - 228 p_EMIB_up_9_14_13_14 <= 0
 EMIB_non_overlap_any_10_12_11_12: p_EMIB_left_10_12_11_12
   + p_EMIB_right_10_12_11_12 + p_EMIB_down_10_12_11_12
   + p_EMIB_up_10_12_11_12 >= 1
 EMIB_non_overlap_left_10_12_11_12: EMIB_w_var_10_12
   + EMIB_x_grid_var_10_12 - EMIB_x_grid_var_11_12
   + 228 p_EMIB_left_10_12_11_12 <= 228
 EMIB_non_overlap_left_rev_10_12_11_12: - EMIB_w_var_10_12
   - EMIB_x_grid_var_10_12 + EMIB_x_grid_var_11_12
   - 228 p_EMIB_left_10_12_11_12 <= 0
 EMIB_non_overlap_right_10_12_11_12: EMIB_w_var_11_12
   - EMIB_x_grid_var_10_12 + EMIB_x_grid_var_11_12
   + 228 p_EMIB_right_10_12_11_12 <= 228
 EMIB_non_overlap_right_rev_10_12_11_12: - EMIB_w_var_11_12
   + EMIB_x_grid_var_10_12 - EMIB_x_grid_var_11_12
   - 228 p_EMIB_right_10_12_11_12 <= 0
 EMIB_non_overlap_down_10_12_11_12: EMIB_h_var_10_12
   + EMIB_y_grid_var_10_12 - EMIB_y_grid_var_11_12
   + 228 p_EMIB_down_10_12_11_12 <= 228
 EMIB_non_overlap_down_rev_10_12_11_12: - EMIB_h_var_10_12
   - EMIB_y_grid_var_10_12 + EMIB_y_grid_var_11_12
   - 228 p_EMIB_down_10_12_11_12 <= 0
 EMIB_non_overlap_up_10_12_11_12: EMIB_h_var_11_12 - EMIB_y_grid_var_10_12
   + EMIB_y_grid_var_11_12 + 228 p_EMIB_up_10_12_11_12 <= 228
 EMIB_non_overlap_up_rev_10_12_11_12: - EMIB_h_var_11_12
   + EMIB_y_grid_var_10_12 - EMIB_y_grid_var_11_12
   - 228 p_EMIB_up_10_12_11_12 <= 0
 EMIB_non_overlap_any_10_12_12_13: p_EMIB_left_10_12_12_13
   + p_EMIB_right_10_12_12_13 + p_EMIB_down_10_12_12_13
   + p_EMIB_up_10_12_12_13 >= 1
 EMIB_non_overlap_left_10_12_12_13: EMIB_w_var_10_12
   + EMIB_x_grid_var_10_12 - EMIB_x_grid_var_12_13
   + 228 p_EMIB_left_10_12_12_13 <= 228
 EMIB_non_overlap_left_rev_10_12_12_13: - EMIB_w_var_10_12
   - EMIB_x_grid_var_10_12 + EMIB_x_grid_var_12_13
   - 228 p_EMIB_left_10_12_12_13 <= 0
 EMIB_non_overlap_right_10_12_12_13: EMIB_w_var_12_13
   - EMIB_x_grid_var_10_12 + EMIB_x_grid_var_12_13
   + 228 p_EMIB_right_10_12_12_13 <= 228
 EMIB_non_overlap_right_rev_10_12_12_13: - EMIB_w_var_12_13
   + EMIB_x_grid_var_10_12 - EMIB_x_grid_var_12_13
   - 228 p_EMIB_right_10_12_12_13 <= 0
 EMIB_non_overlap_down_10_12_12_13: EMIB_h_var_10_12
   + EMIB_y_grid_var_10_12 - EMIB_y_grid_var_12_13
   + 228 p_EMIB_down_10_12_12_13 <= 228
 EMIB_non_overlap_down_rev_10_12_12_13: - EMIB_h_var_10_12
   - EMIB_y_grid_var_10_12 + EMIB_y_grid_var_12_13
   - 228 p_EMIB_down_10_12_12_13 <= 0
 EMIB_non_overlap_up_10_12_12_13: EMIB_h_var_12_13 - EMIB_y_grid_var_10_12
   + EMIB_y_grid_var_12_13 + 228 p_EMIB_up_10_12_12_13 <= 228
 EMIB_non_overlap_up_rev_10_12_12_13: - EMIB_h_var_12_13
   + EMIB_y_grid_var_10_12 - EMIB_y_grid_var_12_13
   - 228 p_EMIB_up_10_12_12_13 <= 0
 EMIB_non_overlap_any_11_12_12_13: p_EMIB_left_11_12_12_13
   + p_EMIB_right_11_12_12_13 + p_EMIB_down_11_12_12_13
   + p_EMIB_up_11_12_12_13 >= 1
 EMIB_non_overlap_left_11_12_12_13: EMIB_w_var_11_12
   + EMIB_x_grid_var_11_12 - EMIB_x_grid_var_12_13
   + 228 p_EMIB_left_11_12_12_13 <= 228
 EMIB_non_overlap_left_rev_11_12_12_13: - EMIB_w_var_11_12
   - EMIB_x_grid_var_11_12 + EMIB_x_grid_var_12_13
   - 228 p_EMIB_left_11_12_12_13 <= 0
 EMIB_non_overlap_right_11_12_12_13: EMIB_w_var_12_13
   - EMIB_x_grid_var_11_12 + EMIB_x_grid_var_12_13
   + 228 p_EMIB_right_11_12_12_13 <= 228
 EMIB_non_overlap_right_rev_11_12_12_13: - EMIB_w_var_12_13
   + EMIB_x_grid_var_11_12 - EMIB_x_grid_var_12_13
   - 228 p_EMIB_right_11_12_12_13 <= 0
 EMIB_non_overlap_down_11_12_12_13: EMIB_h_var_11_12
   + EMIB_y_grid_var_11_12 - EMIB_y_grid_var_12_13
   + 228 p_EMIB_down_11_12_12_13 <= 228
 EMIB_non_overlap_down_rev_11_12_12_13: - EMIB_h_var_11_12
   - EMIB_y_grid_var_11_12 + EMIB_y_grid_var_12_13
   - 228 p_EMIB_down_11_12_12_13 <= 0
 EMIB_non_overlap_up_11_12_12_13: EMIB_h_var_12_13 - EMIB_y_grid_var_11_12
   + EMIB_y_grid_var_12_13 + 228 p_EMIB_up_11_12_12_13 <= 228
 EMIB_non_overlap_up_rev_11_12_12_13: - EMIB_h_var_12_13
   + EMIB_y_grid_var_11_12 - EMIB_y_grid_var_12_13
   - 228 p_EMIB_up_11_12_12_13 <= 0
 EMIB_non_overlap_any_12_13_13_14: p_EMIB_left_12_13_13_14
   + p_EMIB_right_12_13_13_14 + p_EMIB_down_12_13_13_14
   + p_EMIB_up_12_13_13_14 >= 1
 EMIB_non_overlap_left_12_13_13_14: EMIB_w_var_12_13
   + EMIB_x_grid_var_12_13 - EMIB_x_grid_var_13_14
   + 228 p_EMIB_left_12_13_13_14 <= 228
 EMIB_non_overlap_left_rev_12_13_13_14: - EMIB_w_var_12_13
   - EMIB_x_grid_var_12_13 + EMIB_x_grid_var_13_14
   - 228 p_EMIB_left_12_13_13_14 <= 0
 EMIB_non_overlap_right_12_13_13_14: EMIB_w_var_13_14
   - EMIB_x_grid_var_12_13 + EMIB_x_grid_var_13_14
   + 228 p_EMIB_right_12_13_13_14 <= 228
 EMIB_non_overlap_right_rev_12_13_13_14: - EMIB_w_var_13_14
   + EMIB_x_grid_var_12_13 - EMIB_x_grid_var_13_14
   - 228 p_EMIB_right_12_13_13_14 <= 0
 EMIB_non_overlap_down_12_13_13_14: EMIB_h_var_12_13
   + EMIB_y_grid_var_12_13 - EMIB_y_grid_var_13_14
   + 228 p_EMIB_down_12_13_13_14 <= 228
 EMIB_non_overlap_down_rev_12_13_13_14: - EMIB_h_var_12_13
   - EMIB_y_grid_var_12_13 + EMIB_y_grid_var_13_14
   - 228 p_EMIB_down_12_13_13_14 <= 0
 EMIB_non_overlap_up_12_13_13_14: EMIB_h_var_13_14 - EMIB_y_grid_var_12_13
   + EMIB_y_grid_var_13_14 + 228 p_EMIB_up_12_13_13_14 <= 228
 EMIB_non_overlap_up_rev_12_13_13_14: - EMIB_h_var_13_14
   + EMIB_y_grid_var_12_13 - EMIB_y_grid_var_13_14
   - 228 p_EMIB_up_12_13_13_14 <= 0
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
 bbox_min_x_10: - x_grid_var_10 + bbox_min_x <= 0
 bbox_max_x_10: - w_var_10 - x_grid_var_10 + bbox_max_x >= 0
 bbox_min_y_10: - y_grid_var_10 + bbox_min_y <= 0
 bbox_max_y_10: - h_var_10 - y_grid_var_10 + bbox_max_y >= 0
 bbox_min_x_11: - x_grid_var_11 + bbox_min_x <= 0
 bbox_max_x_11: - w_var_11 - x_grid_var_11 + bbox_max_x >= 0
 bbox_min_y_11: - y_grid_var_11 + bbox_min_y <= 0
 bbox_max_y_11: - h_var_11 - y_grid_var_11 + bbox_max_y >= 0
 bbox_min_x_12: - x_grid_var_12 + bbox_min_x <= 0
 bbox_max_x_12: - w_var_12 - x_grid_var_12 + bbox_max_x >= 0
 bbox_min_y_12: - y_grid_var_12 + bbox_min_y <= 0
 bbox_max_y_12: - h_var_12 - y_grid_var_12 + bbox_max_y >= 0
 bbox_min_x_13: - x_grid_var_13 + bbox_min_x <= 0
 bbox_max_x_13: - w_var_13 - x_grid_var_13 + bbox_max_x >= 0
 bbox_min_y_13: - y_grid_var_13 + bbox_min_y <= 0
 bbox_max_y_13: - h_var_13 - y_grid_var_13 + bbox_max_y >= 0
 bbox_min_x_14: - x_grid_var_14 + bbox_min_x <= 0
 bbox_max_x_14: - w_var_14 - x_grid_var_14 + bbox_max_x >= 0
 bbox_min_y_14: - y_grid_var_14 + bbox_min_y <= 0
 bbox_max_y_14: - h_var_14 - y_grid_var_14 + bbox_max_y >= 0
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
   - 228 dx_grid_abs_pair_0_1_is_positive >= -228
 dx_grid_abs_pair_0_1_abs_le_orig: dx_grid_abs_pair_0_1 - dx_grid_diff_0_1
   + 228 dx_grid_abs_pair_0_1_is_positive <= 228
 dx_grid_abs_pair_0_1_abs_ge_neg_orig: dx_grid_abs_pair_0_1
   + dx_grid_diff_0_1 + 228 dx_grid_abs_pair_0_1_is_positive >= 0
 dx_grid_abs_pair_0_1_abs_le_neg_orig: dx_grid_abs_pair_0_1
   + dx_grid_diff_0_1 - 228 dx_grid_abs_pair_0_1_is_positive <= 0
 dx_grid_abs_pair_0_1_force_positive: dx_grid_diff_0_1
   - 228 dx_grid_abs_pair_0_1_is_positive >= -228
 dx_grid_abs_pair_0_1_force_negative: dx_grid_diff_0_1
   - 228 dx_grid_abs_pair_0_1_is_positive <= 0
 dy_grid_diff_def_0_1: - cy_grid_var_0 + cy_grid_var_1 + dy_grid_diff_0_1
   = 0
 dy_grid_abs_pair_0_1_abs_ge_orig: dy_grid_abs_pair_0_1 - dy_grid_diff_0_1
   - 228 dy_grid_abs_pair_0_1_is_positive >= -228
 dy_grid_abs_pair_0_1_abs_le_orig: dy_grid_abs_pair_0_1 - dy_grid_diff_0_1
   + 228 dy_grid_abs_pair_0_1_is_positive <= 228
 dy_grid_abs_pair_0_1_abs_ge_neg_orig: dy_grid_abs_pair_0_1
   + dy_grid_diff_0_1 + 228 dy_grid_abs_pair_0_1_is_positive >= 0
 dy_grid_abs_pair_0_1_abs_le_neg_orig: dy_grid_abs_pair_0_1
   + dy_grid_diff_0_1 - 228 dy_grid_abs_pair_0_1_is_positive <= 0
 dy_grid_abs_pair_0_1_force_positive: dy_grid_diff_0_1
   - 228 dy_grid_abs_pair_0_1_is_positive >= -228
 dy_grid_abs_pair_0_1_force_negative: dy_grid_diff_0_1
   - 228 dy_grid_abs_pair_0_1_is_positive <= 0
 dist_curr_pair_def_0_1: - dx_grid_abs_pair_0_1 - dy_grid_abs_pair_0_1
   + dist_curr_pair_0_1 = 0
 dx_grid_diff_def_0_7: - cx_grid_var_0 + cx_grid_var_7 + dx_grid_diff_0_7
   = 0
 dx_grid_abs_pair_0_7_abs_ge_orig: dx_grid_abs_pair_0_7 - dx_grid_diff_0_7
   - 228 dx_grid_abs_pair_0_7_is_positive >= -228
 dx_grid_abs_pair_0_7_abs_le_orig: dx_grid_abs_pair_0_7 - dx_grid_diff_0_7
   + 228 dx_grid_abs_pair_0_7_is_positive <= 228
 dx_grid_abs_pair_0_7_abs_ge_neg_orig: dx_grid_abs_pair_0_7
   + dx_grid_diff_0_7 + 228 dx_grid_abs_pair_0_7_is_positive >= 0
 dx_grid_abs_pair_0_7_abs_le_neg_orig: dx_grid_abs_pair_0_7
   + dx_grid_diff_0_7 - 228 dx_grid_abs_pair_0_7_is_positive <= 0
 dx_grid_abs_pair_0_7_force_positive: dx_grid_diff_0_7
   - 228 dx_grid_abs_pair_0_7_is_positive >= -228
 dx_grid_abs_pair_0_7_force_negative: dx_grid_diff_0_7
   - 228 dx_grid_abs_pair_0_7_is_positive <= 0
 dy_grid_diff_def_0_7: - cy_grid_var_0 + cy_grid_var_7 + dy_grid_diff_0_7
   = 0
 dy_grid_abs_pair_0_7_abs_ge_orig: dy_grid_abs_pair_0_7 - dy_grid_diff_0_7
   - 228 dy_grid_abs_pair_0_7_is_positive >= -228
 dy_grid_abs_pair_0_7_abs_le_orig: dy_grid_abs_pair_0_7 - dy_grid_diff_0_7
   + 228 dy_grid_abs_pair_0_7_is_positive <= 228
 dy_grid_abs_pair_0_7_abs_ge_neg_orig: dy_grid_abs_pair_0_7
   + dy_grid_diff_0_7 + 228 dy_grid_abs_pair_0_7_is_positive >= 0
 dy_grid_abs_pair_0_7_abs_le_neg_orig: dy_grid_abs_pair_0_7
   + dy_grid_diff_0_7 - 228 dy_grid_abs_pair_0_7_is_positive <= 0
 dy_grid_abs_pair_0_7_force_positive: dy_grid_diff_0_7
   - 228 dy_grid_abs_pair_0_7_is_positive >= -228
 dy_grid_abs_pair_0_7_force_negative: dy_grid_diff_0_7
   - 228 dy_grid_abs_pair_0_7_is_positive <= 0
 dist_curr_pair_def_0_7: - dx_grid_abs_pair_0_7 - dy_grid_abs_pair_0_7
   + dist_curr_pair_0_7 = 0
 dx_grid_diff_def_0_9: - cx_grid_var_0 + cx_grid_var_9 + dx_grid_diff_0_9
   = 0
 dx_grid_abs_pair_0_9_abs_ge_orig: dx_grid_abs_pair_0_9 - dx_grid_diff_0_9
   - 228 dx_grid_abs_pair_0_9_is_positive >= -228
 dx_grid_abs_pair_0_9_abs_le_orig: dx_grid_abs_pair_0_9 - dx_grid_diff_0_9
   + 228 dx_grid_abs_pair_0_9_is_positive <= 228
 dx_grid_abs_pair_0_9_abs_ge_neg_orig: dx_grid_abs_pair_0_9
   + dx_grid_diff_0_9 + 228 dx_grid_abs_pair_0_9_is_positive >= 0
 dx_grid_abs_pair_0_9_abs_le_neg_orig: dx_grid_abs_pair_0_9
   + dx_grid_diff_0_9 - 228 dx_grid_abs_pair_0_9_is_positive <= 0
 dx_grid_abs_pair_0_9_force_positive: dx_grid_diff_0_9
   - 228 dx_grid_abs_pair_0_9_is_positive >= -228
 dx_grid_abs_pair_0_9_force_negative: dx_grid_diff_0_9
   - 228 dx_grid_abs_pair_0_9_is_positive <= 0
 dy_grid_diff_def_0_9: - cy_grid_var_0 + cy_grid_var_9 + dy_grid_diff_0_9
   = 0
 dy_grid_abs_pair_0_9_abs_ge_orig: dy_grid_abs_pair_0_9 - dy_grid_diff_0_9
   - 228 dy_grid_abs_pair_0_9_is_positive >= -228
 dy_grid_abs_pair_0_9_abs_le_orig: dy_grid_abs_pair_0_9 - dy_grid_diff_0_9
   + 228 dy_grid_abs_pair_0_9_is_positive <= 228
 dy_grid_abs_pair_0_9_abs_ge_neg_orig: dy_grid_abs_pair_0_9
   + dy_grid_diff_0_9 + 228 dy_grid_abs_pair_0_9_is_positive >= 0
 dy_grid_abs_pair_0_9_abs_le_neg_orig: dy_grid_abs_pair_0_9
   + dy_grid_diff_0_9 - 228 dy_grid_abs_pair_0_9_is_positive <= 0
 dy_grid_abs_pair_0_9_force_positive: dy_grid_diff_0_9
   - 228 dy_grid_abs_pair_0_9_is_positive >= -228
 dy_grid_abs_pair_0_9_force_negative: dy_grid_diff_0_9
   - 228 dy_grid_abs_pair_0_9_is_positive <= 0
 dist_curr_pair_def_0_9: - dx_grid_abs_pair_0_9 - dy_grid_abs_pair_0_9
   + dist_curr_pair_0_9 = 0
 dx_grid_diff_def_1_7: - cx_grid_var_1 + cx_grid_var_7 + dx_grid_diff_1_7
   = 0
 dx_grid_abs_pair_1_7_abs_ge_orig: dx_grid_abs_pair_1_7 - dx_grid_diff_1_7
   - 228 dx_grid_abs_pair_1_7_is_positive >= -228
 dx_grid_abs_pair_1_7_abs_le_orig: dx_grid_abs_pair_1_7 - dx_grid_diff_1_7
   + 228 dx_grid_abs_pair_1_7_is_positive <= 228
 dx_grid_abs_pair_1_7_abs_ge_neg_orig: dx_grid_abs_pair_1_7
   + dx_grid_diff_1_7 + 228 dx_grid_abs_pair_1_7_is_positive >= 0
 dx_grid_abs_pair_1_7_abs_le_neg_orig: dx_grid_abs_pair_1_7
   + dx_grid_diff_1_7 - 228 dx_grid_abs_pair_1_7_is_positive <= 0
 dx_grid_abs_pair_1_7_force_positive: dx_grid_diff_1_7
   - 228 dx_grid_abs_pair_1_7_is_positive >= -228
 dx_grid_abs_pair_1_7_force_negative: dx_grid_diff_1_7
   - 228 dx_grid_abs_pair_1_7_is_positive <= 0
 dy_grid_diff_def_1_7: - cy_grid_var_1 + cy_grid_var_7 + dy_grid_diff_1_7
   = 0
 dy_grid_abs_pair_1_7_abs_ge_orig: dy_grid_abs_pair_1_7 - dy_grid_diff_1_7
   - 228 dy_grid_abs_pair_1_7_is_positive >= -228
 dy_grid_abs_pair_1_7_abs_le_orig: dy_grid_abs_pair_1_7 - dy_grid_diff_1_7
   + 228 dy_grid_abs_pair_1_7_is_positive <= 228
 dy_grid_abs_pair_1_7_abs_ge_neg_orig: dy_grid_abs_pair_1_7
   + dy_grid_diff_1_7 + 228 dy_grid_abs_pair_1_7_is_positive >= 0
 dy_grid_abs_pair_1_7_abs_le_neg_orig: dy_grid_abs_pair_1_7
   + dy_grid_diff_1_7 - 228 dy_grid_abs_pair_1_7_is_positive <= 0
 dy_grid_abs_pair_1_7_force_positive: dy_grid_diff_1_7
   - 228 dy_grid_abs_pair_1_7_is_positive >= -228
 dy_grid_abs_pair_1_7_force_negative: dy_grid_diff_1_7
   - 228 dy_grid_abs_pair_1_7_is_positive <= 0
 dist_curr_pair_def_1_7: - dx_grid_abs_pair_1_7 - dy_grid_abs_pair_1_7
   + dist_curr_pair_1_7 = 0
 dx_grid_diff_def_1_9: - cx_grid_var_1 + cx_grid_var_9 + dx_grid_diff_1_9
   = 0
 dx_grid_abs_pair_1_9_abs_ge_orig: dx_grid_abs_pair_1_9 - dx_grid_diff_1_9
   - 228 dx_grid_abs_pair_1_9_is_positive >= -228
 dx_grid_abs_pair_1_9_abs_le_orig: dx_grid_abs_pair_1_9 - dx_grid_diff_1_9
   + 228 dx_grid_abs_pair_1_9_is_positive <= 228
 dx_grid_abs_pair_1_9_abs_ge_neg_orig: dx_grid_abs_pair_1_9
   + dx_grid_diff_1_9 + 228 dx_grid_abs_pair_1_9_is_positive >= 0
 dx_grid_abs_pair_1_9_abs_le_neg_orig: dx_grid_abs_pair_1_9
   + dx_grid_diff_1_9 - 228 dx_grid_abs_pair_1_9_is_positive <= 0
 dx_grid_abs_pair_1_9_force_positive: dx_grid_diff_1_9
   - 228 dx_grid_abs_pair_1_9_is_positive >= -228
 dx_grid_abs_pair_1_9_force_negative: dx_grid_diff_1_9
   - 228 dx_grid_abs_pair_1_9_is_positive <= 0
 dy_grid_diff_def_1_9: - cy_grid_var_1 + cy_grid_var_9 + dy_grid_diff_1_9
   = 0
 dy_grid_abs_pair_1_9_abs_ge_orig: dy_grid_abs_pair_1_9 - dy_grid_diff_1_9
   - 228 dy_grid_abs_pair_1_9_is_positive >= -228
 dy_grid_abs_pair_1_9_abs_le_orig: dy_grid_abs_pair_1_9 - dy_grid_diff_1_9
   + 228 dy_grid_abs_pair_1_9_is_positive <= 228
 dy_grid_abs_pair_1_9_abs_ge_neg_orig: dy_grid_abs_pair_1_9
   + dy_grid_diff_1_9 + 228 dy_grid_abs_pair_1_9_is_positive >= 0
 dy_grid_abs_pair_1_9_abs_le_neg_orig: dy_grid_abs_pair_1_9
   + dy_grid_diff_1_9 - 228 dy_grid_abs_pair_1_9_is_positive <= 0
 dy_grid_abs_pair_1_9_force_positive: dy_grid_diff_1_9
   - 228 dy_grid_abs_pair_1_9_is_positive >= -228
 dy_grid_abs_pair_1_9_force_negative: dy_grid_diff_1_9
   - 228 dy_grid_abs_pair_1_9_is_positive <= 0
 dist_curr_pair_def_1_9: - dx_grid_abs_pair_1_9 - dy_grid_abs_pair_1_9
   + dist_curr_pair_1_9 = 0
 dx_grid_diff_def_7_9: - cx_grid_var_7 + cx_grid_var_9 + dx_grid_diff_7_9
   = 0
 dx_grid_abs_pair_7_9_abs_ge_orig: dx_grid_abs_pair_7_9 - dx_grid_diff_7_9
   - 228 dx_grid_abs_pair_7_9_is_positive >= -228
 dx_grid_abs_pair_7_9_abs_le_orig: dx_grid_abs_pair_7_9 - dx_grid_diff_7_9
   + 228 dx_grid_abs_pair_7_9_is_positive <= 228
 dx_grid_abs_pair_7_9_abs_ge_neg_orig: dx_grid_abs_pair_7_9
   + dx_grid_diff_7_9 + 228 dx_grid_abs_pair_7_9_is_positive >= 0
 dx_grid_abs_pair_7_9_abs_le_neg_orig: dx_grid_abs_pair_7_9
   + dx_grid_diff_7_9 - 228 dx_grid_abs_pair_7_9_is_positive <= 0
 dx_grid_abs_pair_7_9_force_positive: dx_grid_diff_7_9
   - 228 dx_grid_abs_pair_7_9_is_positive >= -228
 dx_grid_abs_pair_7_9_force_negative: dx_grid_diff_7_9
   - 228 dx_grid_abs_pair_7_9_is_positive <= 0
 dy_grid_diff_def_7_9: - cy_grid_var_7 + cy_grid_var_9 + dy_grid_diff_7_9
   = 0
 dy_grid_abs_pair_7_9_abs_ge_orig: dy_grid_abs_pair_7_9 - dy_grid_diff_7_9
   - 228 dy_grid_abs_pair_7_9_is_positive >= -228
 dy_grid_abs_pair_7_9_abs_le_orig: dy_grid_abs_pair_7_9 - dy_grid_diff_7_9
   + 228 dy_grid_abs_pair_7_9_is_positive <= 228
 dy_grid_abs_pair_7_9_abs_ge_neg_orig: dy_grid_abs_pair_7_9
   + dy_grid_diff_7_9 + 228 dy_grid_abs_pair_7_9_is_positive >= 0
 dy_grid_abs_pair_7_9_abs_le_neg_orig: dy_grid_abs_pair_7_9
   + dy_grid_diff_7_9 - 228 dy_grid_abs_pair_7_9_is_positive <= 0
 dy_grid_abs_pair_7_9_force_positive: dy_grid_diff_7_9
   - 228 dy_grid_abs_pair_7_9_is_positive >= -228
 dy_grid_abs_pair_7_9_force_negative: dy_grid_diff_7_9
   - 228 dy_grid_abs_pair_7_9_is_positive <= 0
 dist_curr_pair_def_7_9: - dx_grid_abs_pair_7_9 - dy_grid_abs_pair_7_9
   + dist_curr_pair_7_9 = 0
 dx_center_diff_def_0: - cx_grid_var_0 + cx_center + dx_center_diff_0 = 0
 dx_center_abs_0_abs_ge_orig: - dx_center_diff_0 + dx_center_abs_0
   - 228 dx_center_abs_0_is_positive >= -228
 dx_center_abs_0_abs_le_orig: - dx_center_diff_0 + dx_center_abs_0
   + 228 dx_center_abs_0_is_positive <= 228
 dx_center_abs_0_abs_ge_neg_orig: dx_center_diff_0 + dx_center_abs_0
   + 228 dx_center_abs_0_is_positive >= 0
 dx_center_abs_0_abs_le_neg_orig: dx_center_diff_0 + dx_center_abs_0
   - 228 dx_center_abs_0_is_positive <= 0
 dx_center_abs_0_force_positive: dx_center_diff_0
   - 228 dx_center_abs_0_is_positive >= -228
 dx_center_abs_0_force_negative: dx_center_diff_0
   - 228 dx_center_abs_0_is_positive <= 0
 dy_center_diff_def_0: - cy_grid_var_0 + cy_center + dy_center_diff_0 = 0
 dy_center_abs_0_abs_ge_orig: - dy_center_diff_0 + dy_center_abs_0
   - 228 dy_center_abs_0_is_positive >= -228
 dy_center_abs_0_abs_le_orig: - dy_center_diff_0 + dy_center_abs_0
   + 228 dy_center_abs_0_is_positive <= 228
 dy_center_abs_0_abs_ge_neg_orig: dy_center_diff_0 + dy_center_abs_0
   + 228 dy_center_abs_0_is_positive >= 0
 dy_center_abs_0_abs_le_neg_orig: dy_center_diff_0 + dy_center_abs_0
   - 228 dy_center_abs_0_is_positive <= 0
 dy_center_abs_0_force_positive: dy_center_diff_0
   - 228 dy_center_abs_0_is_positive >= -228
 dy_center_abs_0_force_negative: dy_center_diff_0
   - 228 dy_center_abs_0_is_positive <= 0
 dist_center_def_0: - dx_center_abs_0 - dy_center_abs_0 + dist_center_0
   = 0
 dx_center_diff_def_1: - cx_grid_var_1 + cx_center + dx_center_diff_1 = 0
 dx_center_abs_1_abs_ge_orig: - dx_center_diff_1 + dx_center_abs_1
   - 228 dx_center_abs_1_is_positive >= -228
 dx_center_abs_1_abs_le_orig: - dx_center_diff_1 + dx_center_abs_1
   + 228 dx_center_abs_1_is_positive <= 228
 dx_center_abs_1_abs_ge_neg_orig: dx_center_diff_1 + dx_center_abs_1
   + 228 dx_center_abs_1_is_positive >= 0
 dx_center_abs_1_abs_le_neg_orig: dx_center_diff_1 + dx_center_abs_1
   - 228 dx_center_abs_1_is_positive <= 0
 dx_center_abs_1_force_positive: dx_center_diff_1
   - 228 dx_center_abs_1_is_positive >= -228
 dx_center_abs_1_force_negative: dx_center_diff_1
   - 228 dx_center_abs_1_is_positive <= 0
 dy_center_diff_def_1: - cy_grid_var_1 + cy_center + dy_center_diff_1 = 0
 dy_center_abs_1_abs_ge_orig: - dy_center_diff_1 + dy_center_abs_1
   - 228 dy_center_abs_1_is_positive >= -228
 dy_center_abs_1_abs_le_orig: - dy_center_diff_1 + dy_center_abs_1
   + 228 dy_center_abs_1_is_positive <= 228
 dy_center_abs_1_abs_ge_neg_orig: dy_center_diff_1 + dy_center_abs_1
   + 228 dy_center_abs_1_is_positive >= 0
 dy_center_abs_1_abs_le_neg_orig: dy_center_diff_1 + dy_center_abs_1
   - 228 dy_center_abs_1_is_positive <= 0
 dy_center_abs_1_force_positive: dy_center_diff_1
   - 228 dy_center_abs_1_is_positive >= -228
 dy_center_abs_1_force_negative: dy_center_diff_1
   - 228 dy_center_abs_1_is_positive <= 0
 dist_center_def_1: - dx_center_abs_1 - dy_center_abs_1 + dist_center_1
   = 0
 dx_center_diff_def_7: - cx_grid_var_7 + cx_center + dx_center_diff_7 = 0
 dx_center_abs_7_abs_ge_orig: - dx_center_diff_7 + dx_center_abs_7
   - 228 dx_center_abs_7_is_positive >= -228
 dx_center_abs_7_abs_le_orig: - dx_center_diff_7 + dx_center_abs_7
   + 228 dx_center_abs_7_is_positive <= 228
 dx_center_abs_7_abs_ge_neg_orig: dx_center_diff_7 + dx_center_abs_7
   + 228 dx_center_abs_7_is_positive >= 0
 dx_center_abs_7_abs_le_neg_orig: dx_center_diff_7 + dx_center_abs_7
   - 228 dx_center_abs_7_is_positive <= 0
 dx_center_abs_7_force_positive: dx_center_diff_7
   - 228 dx_center_abs_7_is_positive >= -228
 dx_center_abs_7_force_negative: dx_center_diff_7
   - 228 dx_center_abs_7_is_positive <= 0
 dy_center_diff_def_7: - cy_grid_var_7 + cy_center + dy_center_diff_7 = 0
 dy_center_abs_7_abs_ge_orig: - dy_center_diff_7 + dy_center_abs_7
   - 228 dy_center_abs_7_is_positive >= -228
 dy_center_abs_7_abs_le_orig: - dy_center_diff_7 + dy_center_abs_7
   + 228 dy_center_abs_7_is_positive <= 228
 dy_center_abs_7_abs_ge_neg_orig: dy_center_diff_7 + dy_center_abs_7
   + 228 dy_center_abs_7_is_positive >= 0
 dy_center_abs_7_abs_le_neg_orig: dy_center_diff_7 + dy_center_abs_7
   - 228 dy_center_abs_7_is_positive <= 0
 dy_center_abs_7_force_positive: dy_center_diff_7
   - 228 dy_center_abs_7_is_positive >= -228
 dy_center_abs_7_force_negative: dy_center_diff_7
   - 228 dy_center_abs_7_is_positive <= 0
 dist_center_def_7: - dx_center_abs_7 - dy_center_abs_7 + dist_center_7
   = 0
 dx_center_diff_def_9: - cx_grid_var_9 + cx_center + dx_center_diff_9 = 0
 dx_center_abs_9_abs_ge_orig: - dx_center_diff_9 + dx_center_abs_9
   - 228 dx_center_abs_9_is_positive >= -228
 dx_center_abs_9_abs_le_orig: - dx_center_diff_9 + dx_center_abs_9
   + 228 dx_center_abs_9_is_positive <= 228
 dx_center_abs_9_abs_ge_neg_orig: dx_center_diff_9 + dx_center_abs_9
   + 228 dx_center_abs_9_is_positive >= 0
 dx_center_abs_9_abs_le_neg_orig: dx_center_diff_9 + dx_center_abs_9
   - 228 dx_center_abs_9_is_positive <= 0
 dx_center_abs_9_force_positive: dx_center_diff_9
   - 228 dx_center_abs_9_is_positive >= -228
 dx_center_abs_9_force_negative: dx_center_diff_9
   - 228 dx_center_abs_9_is_positive <= 0
 dy_center_diff_def_9: - cy_grid_var_9 + cy_center + dy_center_diff_9 = 0
 dy_center_abs_9_abs_ge_orig: - dy_center_diff_9 + dy_center_abs_9
   - 228 dy_center_abs_9_is_positive >= -228
 dy_center_abs_9_abs_le_orig: - dy_center_diff_9 + dy_center_abs_9
   + 228 dy_center_abs_9_is_positive <= 228
 dy_center_abs_9_abs_ge_neg_orig: dy_center_diff_9 + dy_center_abs_9
   + 228 dy_center_abs_9_is_positive >= 0
 dy_center_abs_9_abs_le_neg_orig: dy_center_diff_9 + dy_center_abs_9
   - 228 dy_center_abs_9_is_positive <= 0
 dy_center_abs_9_force_positive: dy_center_diff_9
   - 228 dy_center_abs_9_is_positive >= -228
 dy_center_abs_9_force_negative: dy_center_diff_9
   - 228 dy_center_abs_9_is_positive <= 0
 dist_center_def_9: - dx_center_abs_9 - dy_center_abs_9 + dist_center_9
   = 0
 power_aware_penalty_def: power_aware_penalty - 1920 dist_curr_pair_0_1
   - 3000 dist_curr_pair_0_7 - 2700 dist_curr_pair_0_9
   - 1600 dist_curr_pair_1_7 - 1440 dist_curr_pair_1_9
   - 2250 dist_curr_pair_7_9 - 3600 dist_center_0 - 1024 dist_center_1
   - 2500 dist_center_7 - 2025 dist_center_9 = 0
 dx_diff_def_0_1: - cx_grid_var_0 + cx_grid_var_1 + dx_diff_0_1 = 0
 dy_diff_def_0_1: - cy_grid_var_0 + cy_grid_var_1 + dy_diff_0_1 = 0
 dx_abs_0_1_abs_ge_orig: dx_abs_0_1 - dx_diff_0_1
   - 228 dx_abs_0_1_is_positive >= -228
 dx_abs_0_1_abs_le_orig: dx_abs_0_1 - dx_diff_0_1
   + 228 dx_abs_0_1_is_positive <= 228
 dx_abs_0_1_abs_ge_neg_orig: dx_abs_0_1 + dx_diff_0_1
   + 228 dx_abs_0_1_is_positive >= 0
 dx_abs_0_1_abs_le_neg_orig: dx_abs_0_1 + dx_diff_0_1
   - 228 dx_abs_0_1_is_positive <= 0
 dx_abs_0_1_force_positive: dx_diff_0_1 - 228 dx_abs_0_1_is_positive
   >= -228
 dx_abs_0_1_force_negative: dx_diff_0_1 - 228 dx_abs_0_1_is_positive <= 0
 dy_abs_0_1_abs_ge_orig: dy_abs_0_1 - dy_diff_0_1
   - 228 dy_abs_0_1_is_positive >= -228
 dy_abs_0_1_abs_le_orig: dy_abs_0_1 - dy_diff_0_1
   + 228 dy_abs_0_1_is_positive <= 228
 dy_abs_0_1_abs_ge_neg_orig: dy_abs_0_1 + dy_diff_0_1
   + 228 dy_abs_0_1_is_positive >= 0
 dy_abs_0_1_abs_le_neg_orig: dy_abs_0_1 + dy_diff_0_1
   - 228 dy_abs_0_1_is_positive <= 0
 dy_abs_0_1_force_positive: dy_diff_0_1 - 228 dy_abs_0_1_is_positive
   >= -228
 dy_abs_0_1_force_negative: dy_diff_0_1 - 228 dy_abs_0_1_is_positive <= 0
 dx_diff_def_0_2: - cx_grid_var_0 + cx_grid_var_2 + dx_diff_0_2 = 0
 dy_diff_def_0_2: - cy_grid_var_0 + cy_grid_var_2 + dy_diff_0_2 = 0
 dx_abs_0_2_abs_ge_orig: dx_abs_0_2 - dx_diff_0_2
   - 228 dx_abs_0_2_is_positive >= -228
 dx_abs_0_2_abs_le_orig: dx_abs_0_2 - dx_diff_0_2
   + 228 dx_abs_0_2_is_positive <= 228
 dx_abs_0_2_abs_ge_neg_orig: dx_abs_0_2 + dx_diff_0_2
   + 228 dx_abs_0_2_is_positive >= 0
 dx_abs_0_2_abs_le_neg_orig: dx_abs_0_2 + dx_diff_0_2
   - 228 dx_abs_0_2_is_positive <= 0
 dx_abs_0_2_force_positive: dx_diff_0_2 - 228 dx_abs_0_2_is_positive
   >= -228
 dx_abs_0_2_force_negative: dx_diff_0_2 - 228 dx_abs_0_2_is_positive <= 0
 dy_abs_0_2_abs_ge_orig: dy_abs_0_2 - dy_diff_0_2
   - 228 dy_abs_0_2_is_positive >= -228
 dy_abs_0_2_abs_le_orig: dy_abs_0_2 - dy_diff_0_2
   + 228 dy_abs_0_2_is_positive <= 228
 dy_abs_0_2_abs_ge_neg_orig: dy_abs_0_2 + dy_diff_0_2
   + 228 dy_abs_0_2_is_positive >= 0
 dy_abs_0_2_abs_le_neg_orig: dy_abs_0_2 + dy_diff_0_2
   - 228 dy_abs_0_2_is_positive <= 0
 dy_abs_0_2_force_positive: dy_diff_0_2 - 228 dy_abs_0_2_is_positive
   >= -228
 dy_abs_0_2_force_negative: dy_diff_0_2 - 228 dy_abs_0_2_is_positive <= 0
 dx_diff_def_0_3: - cx_grid_var_0 + cx_grid_var_3 + dx_diff_0_3 = 0
 dy_diff_def_0_3: - cy_grid_var_0 + cy_grid_var_3 + dy_diff_0_3 = 0
 dx_abs_0_3_abs_ge_orig: dx_abs_0_3 - dx_diff_0_3
   - 228 dx_abs_0_3_is_positive >= -228
 dx_abs_0_3_abs_le_orig: dx_abs_0_3 - dx_diff_0_3
   + 228 dx_abs_0_3_is_positive <= 228
 dx_abs_0_3_abs_ge_neg_orig: dx_abs_0_3 + dx_diff_0_3
   + 228 dx_abs_0_3_is_positive >= 0
 dx_abs_0_3_abs_le_neg_orig: dx_abs_0_3 + dx_diff_0_3
   - 228 dx_abs_0_3_is_positive <= 0
 dx_abs_0_3_force_positive: dx_diff_0_3 - 228 dx_abs_0_3_is_positive
   >= -228
 dx_abs_0_3_force_negative: dx_diff_0_3 - 228 dx_abs_0_3_is_positive <= 0
 dy_abs_0_3_abs_ge_orig: dy_abs_0_3 - dy_diff_0_3
   - 228 dy_abs_0_3_is_positive >= -228
 dy_abs_0_3_abs_le_orig: dy_abs_0_3 - dy_diff_0_3
   + 228 dy_abs_0_3_is_positive <= 228
 dy_abs_0_3_abs_ge_neg_orig: dy_abs_0_3 + dy_diff_0_3
   + 228 dy_abs_0_3_is_positive >= 0
 dy_abs_0_3_abs_le_neg_orig: dy_abs_0_3 + dy_diff_0_3
   - 228 dy_abs_0_3_is_positive <= 0
 dy_abs_0_3_force_positive: dy_diff_0_3 - 228 dy_abs_0_3_is_positive
   >= -228
 dy_abs_0_3_force_negative: dy_diff_0_3 - 228 dy_abs_0_3_is_positive <= 0
 dx_diff_def_0_8: - cx_grid_var_0 + cx_grid_var_8 + dx_diff_0_8 = 0
 dy_diff_def_0_8: - cy_grid_var_0 + cy_grid_var_8 + dy_diff_0_8 = 0
 dx_abs_0_8_abs_ge_orig: dx_abs_0_8 - dx_diff_0_8
   - 228 dx_abs_0_8_is_positive >= -228
 dx_abs_0_8_abs_le_orig: dx_abs_0_8 - dx_diff_0_8
   + 228 dx_abs_0_8_is_positive <= 228
 dx_abs_0_8_abs_ge_neg_orig: dx_abs_0_8 + dx_diff_0_8
   + 228 dx_abs_0_8_is_positive >= 0
 dx_abs_0_8_abs_le_neg_orig: dx_abs_0_8 + dx_diff_0_8
   - 228 dx_abs_0_8_is_positive <= 0
 dx_abs_0_8_force_positive: dx_diff_0_8 - 228 dx_abs_0_8_is_positive
   >= -228
 dx_abs_0_8_force_negative: dx_diff_0_8 - 228 dx_abs_0_8_is_positive <= 0
 dy_abs_0_8_abs_ge_orig: dy_abs_0_8 - dy_diff_0_8
   - 228 dy_abs_0_8_is_positive >= -228
 dy_abs_0_8_abs_le_orig: dy_abs_0_8 - dy_diff_0_8
   + 228 dy_abs_0_8_is_positive <= 228
 dy_abs_0_8_abs_ge_neg_orig: dy_abs_0_8 + dy_diff_0_8
   + 228 dy_abs_0_8_is_positive >= 0
 dy_abs_0_8_abs_le_neg_orig: dy_abs_0_8 + dy_diff_0_8
   - 228 dy_abs_0_8_is_positive <= 0
 dy_abs_0_8_force_positive: dy_diff_0_8 - 228 dy_abs_0_8_is_positive
   >= -228
 dy_abs_0_8_force_negative: dy_diff_0_8 - 228 dy_abs_0_8_is_positive <= 0
 dx_diff_def_1_7: - cx_grid_var_1 + cx_grid_var_7 + dx_diff_1_7 = 0
 dy_diff_def_1_7: - cy_grid_var_1 + cy_grid_var_7 + dy_diff_1_7 = 0
 dx_abs_1_7_abs_ge_orig: dx_abs_1_7 - dx_diff_1_7
   - 228 dx_abs_1_7_is_positive >= -228
 dx_abs_1_7_abs_le_orig: dx_abs_1_7 - dx_diff_1_7
   + 228 dx_abs_1_7_is_positive <= 228
 dx_abs_1_7_abs_ge_neg_orig: dx_abs_1_7 + dx_diff_1_7
   + 228 dx_abs_1_7_is_positive >= 0
 dx_abs_1_7_abs_le_neg_orig: dx_abs_1_7 + dx_diff_1_7
   - 228 dx_abs_1_7_is_positive <= 0
 dx_abs_1_7_force_positive: dx_diff_1_7 - 228 dx_abs_1_7_is_positive
   >= -228
 dx_abs_1_7_force_negative: dx_diff_1_7 - 228 dx_abs_1_7_is_positive <= 0
 dy_abs_1_7_abs_ge_orig: dy_abs_1_7 - dy_diff_1_7
   - 228 dy_abs_1_7_is_positive >= -228
 dy_abs_1_7_abs_le_orig: dy_abs_1_7 - dy_diff_1_7
   + 228 dy_abs_1_7_is_positive <= 228
 dy_abs_1_7_abs_ge_neg_orig: dy_abs_1_7 + dy_diff_1_7
   + 228 dy_abs_1_7_is_positive >= 0
 dy_abs_1_7_abs_le_neg_orig: dy_abs_1_7 + dy_diff_1_7
   - 228 dy_abs_1_7_is_positive <= 0
 dy_abs_1_7_force_positive: dy_diff_1_7 - 228 dy_abs_1_7_is_positive
   >= -228
 dy_abs_1_7_force_negative: dy_diff_1_7 - 228 dy_abs_1_7_is_positive <= 0
 dx_diff_def_2_9: - cx_grid_var_2 + cx_grid_var_9 + dx_diff_2_9 = 0
 dy_diff_def_2_9: - cy_grid_var_2 + cy_grid_var_9 + dy_diff_2_9 = 0
 dx_abs_2_9_abs_ge_orig: dx_abs_2_9 - dx_diff_2_9
   - 228 dx_abs_2_9_is_positive >= -228
 dx_abs_2_9_abs_le_orig: dx_abs_2_9 - dx_diff_2_9
   + 228 dx_abs_2_9_is_positive <= 228
 dx_abs_2_9_abs_ge_neg_orig: dx_abs_2_9 + dx_diff_2_9
   + 228 dx_abs_2_9_is_positive >= 0
 dx_abs_2_9_abs_le_neg_orig: dx_abs_2_9 + dx_diff_2_9
   - 228 dx_abs_2_9_is_positive <= 0
 dx_abs_2_9_force_positive: dx_diff_2_9 - 228 dx_abs_2_9_is_positive
   >= -228
 dx_abs_2_9_force_negative: dx_diff_2_9 - 228 dx_abs_2_9_is_positive <= 0
 dy_abs_2_9_abs_ge_orig: dy_abs_2_9 - dy_diff_2_9
   - 228 dy_abs_2_9_is_positive >= -228
 dy_abs_2_9_abs_le_orig: dy_abs_2_9 - dy_diff_2_9
   + 228 dy_abs_2_9_is_positive <= 228
 dy_abs_2_9_abs_ge_neg_orig: dy_abs_2_9 + dy_diff_2_9
   + 228 dy_abs_2_9_is_positive >= 0
 dy_abs_2_9_abs_le_neg_orig: dy_abs_2_9 + dy_diff_2_9
   - 228 dy_abs_2_9_is_positive <= 0
 dy_abs_2_9_force_positive: dy_diff_2_9 - 228 dy_abs_2_9_is_positive
   >= -228
 dy_abs_2_9_force_negative: dy_diff_2_9 - 228 dy_abs_2_9_is_positive <= 0
 dx_diff_def_2_12: - cx_grid_var_2 + cx_grid_var_12 + dx_diff_2_12 = 0
 dy_diff_def_2_12: - cy_grid_var_2 + cy_grid_var_12 + dy_diff_2_12 = 0
 dx_abs_2_12_abs_ge_orig: dx_abs_2_12 - dx_diff_2_12
   - 228 dx_abs_2_12_is_positive >= -228
 dx_abs_2_12_abs_le_orig: dx_abs_2_12 - dx_diff_2_12
   + 228 dx_abs_2_12_is_positive <= 228
 dx_abs_2_12_abs_ge_neg_orig: dx_abs_2_12 + dx_diff_2_12
   + 228 dx_abs_2_12_is_positive >= 0
 dx_abs_2_12_abs_le_neg_orig: dx_abs_2_12 + dx_diff_2_12
   - 228 dx_abs_2_12_is_positive <= 0
 dx_abs_2_12_force_positive: dx_diff_2_12 - 228 dx_abs_2_12_is_positive
   >= -228
 dx_abs_2_12_force_negative: dx_diff_2_12 - 228 dx_abs_2_12_is_positive
   <= 0
 dy_abs_2_12_abs_ge_orig: dy_abs_2_12 - dy_diff_2_12
   - 228 dy_abs_2_12_is_positive >= -228
 dy_abs_2_12_abs_le_orig: dy_abs_2_12 - dy_diff_2_12
   + 228 dy_abs_2_12_is_positive <= 228
 dy_abs_2_12_abs_ge_neg_orig: dy_abs_2_12 + dy_diff_2_12
   + 228 dy_abs_2_12_is_positive >= 0
 dy_abs_2_12_abs_le_neg_orig: dy_abs_2_12 + dy_diff_2_12
   - 228 dy_abs_2_12_is_positive <= 0
 dy_abs_2_12_force_positive: dy_diff_2_12 - 228 dy_abs_2_12_is_positive
   >= -228
 dy_abs_2_12_force_negative: dy_diff_2_12 - 228 dy_abs_2_12_is_positive
   <= 0
 dx_diff_def_3_7: - cx_grid_var_3 + cx_grid_var_7 + dx_diff_3_7 = 0
 dy_diff_def_3_7: - cy_grid_var_3 + cy_grid_var_7 + dy_diff_3_7 = 0
 dx_abs_3_7_abs_ge_orig: dx_abs_3_7 - dx_diff_3_7
   - 228 dx_abs_3_7_is_positive >= -228
 dx_abs_3_7_abs_le_orig: dx_abs_3_7 - dx_diff_3_7
   + 228 dx_abs_3_7_is_positive <= 228
 dx_abs_3_7_abs_ge_neg_orig: dx_abs_3_7 + dx_diff_3_7
   + 228 dx_abs_3_7_is_positive >= 0
 dx_abs_3_7_abs_le_neg_orig: dx_abs_3_7 + dx_diff_3_7
   - 228 dx_abs_3_7_is_positive <= 0
 dx_abs_3_7_force_positive: dx_diff_3_7 - 228 dx_abs_3_7_is_positive
   >= -228
 dx_abs_3_7_force_negative: dx_diff_3_7 - 228 dx_abs_3_7_is_positive <= 0
 dy_abs_3_7_abs_ge_orig: dy_abs_3_7 - dy_diff_3_7
   - 228 dy_abs_3_7_is_positive >= -228
 dy_abs_3_7_abs_le_orig: dy_abs_3_7 - dy_diff_3_7
   + 228 dy_abs_3_7_is_positive <= 228
 dy_abs_3_7_abs_ge_neg_orig: dy_abs_3_7 + dy_diff_3_7
   + 228 dy_abs_3_7_is_positive >= 0
 dy_abs_3_7_abs_le_neg_orig: dy_abs_3_7 + dy_diff_3_7
   - 228 dy_abs_3_7_is_positive <= 0
 dy_abs_3_7_force_positive: dy_diff_3_7 - 228 dy_abs_3_7_is_positive
   >= -228
 dy_abs_3_7_force_negative: dy_diff_3_7 - 228 dy_abs_3_7_is_positive <= 0
 dx_diff_def_3_8: - cx_grid_var_3 + cx_grid_var_8 + dx_diff_3_8 = 0
 dy_diff_def_3_8: - cy_grid_var_3 + cy_grid_var_8 + dy_diff_3_8 = 0
 dx_abs_3_8_abs_ge_orig: dx_abs_3_8 - dx_diff_3_8
   - 228 dx_abs_3_8_is_positive >= -228
 dx_abs_3_8_abs_le_orig: dx_abs_3_8 - dx_diff_3_8
   + 228 dx_abs_3_8_is_positive <= 228
 dx_abs_3_8_abs_ge_neg_orig: dx_abs_3_8 + dx_diff_3_8
   + 228 dx_abs_3_8_is_positive >= 0
 dx_abs_3_8_abs_le_neg_orig: dx_abs_3_8 + dx_diff_3_8
   - 228 dx_abs_3_8_is_positive <= 0
 dx_abs_3_8_force_positive: dx_diff_3_8 - 228 dx_abs_3_8_is_positive
   >= -228
 dx_abs_3_8_force_negative: dx_diff_3_8 - 228 dx_abs_3_8_is_positive <= 0
 dy_abs_3_8_abs_ge_orig: dy_abs_3_8 - dy_diff_3_8
   - 228 dy_abs_3_8_is_positive >= -228
 dy_abs_3_8_abs_le_orig: dy_abs_3_8 - dy_diff_3_8
   + 228 dy_abs_3_8_is_positive <= 228
 dy_abs_3_8_abs_ge_neg_orig: dy_abs_3_8 + dy_diff_3_8
   + 228 dy_abs_3_8_is_positive >= 0
 dy_abs_3_8_abs_le_neg_orig: dy_abs_3_8 + dy_diff_3_8
   - 228 dy_abs_3_8_is_positive <= 0
 dy_abs_3_8_force_positive: dy_diff_3_8 - 228 dy_abs_3_8_is_positive
   >= -228
 dy_abs_3_8_force_negative: dy_diff_3_8 - 228 dy_abs_3_8_is_positive <= 0
 dx_diff_def_3_13: - cx_grid_var_3 + cx_grid_var_13 + dx_diff_3_13 = 0
 dy_diff_def_3_13: - cy_grid_var_3 + cy_grid_var_13 + dy_diff_3_13 = 0
 dx_abs_3_13_abs_ge_orig: dx_abs_3_13 - dx_diff_3_13
   - 228 dx_abs_3_13_is_positive >= -228
 dx_abs_3_13_abs_le_orig: dx_abs_3_13 - dx_diff_3_13
   + 228 dx_abs_3_13_is_positive <= 228
 dx_abs_3_13_abs_ge_neg_orig: dx_abs_3_13 + dx_diff_3_13
   + 228 dx_abs_3_13_is_positive >= 0
 dx_abs_3_13_abs_le_neg_orig: dx_abs_3_13 + dx_diff_3_13
   - 228 dx_abs_3_13_is_positive <= 0
 dx_abs_3_13_force_positive: dx_diff_3_13 - 228 dx_abs_3_13_is_positive
   >= -228
 dx_abs_3_13_force_negative: dx_diff_3_13 - 228 dx_abs_3_13_is_positive
   <= 0
 dy_abs_3_13_abs_ge_orig: dy_abs_3_13 - dy_diff_3_13
   - 228 dy_abs_3_13_is_positive >= -228
 dy_abs_3_13_abs_le_orig: dy_abs_3_13 - dy_diff_3_13
   + 228 dy_abs_3_13_is_positive <= 228
 dy_abs_3_13_abs_ge_neg_orig: dy_abs_3_13 + dy_diff_3_13
   + 228 dy_abs_3_13_is_positive >= 0
 dy_abs_3_13_abs_le_neg_orig: dy_abs_3_13 + dy_diff_3_13
   - 228 dy_abs_3_13_is_positive <= 0
 dy_abs_3_13_force_positive: dy_diff_3_13 - 228 dy_abs_3_13_is_positive
   >= -228
 dy_abs_3_13_force_negative: dy_diff_3_13 - 228 dy_abs_3_13_is_positive
   <= 0
 dx_diff_def_4_11: - cx_grid_var_4 + cx_grid_var_11 + dx_diff_4_11 = 0
 dy_diff_def_4_11: - cy_grid_var_4 + cy_grid_var_11 + dy_diff_4_11 = 0
 dx_abs_4_11_abs_ge_orig: dx_abs_4_11 - dx_diff_4_11
   - 228 dx_abs_4_11_is_positive >= -228
 dx_abs_4_11_abs_le_orig: dx_abs_4_11 - dx_diff_4_11
   + 228 dx_abs_4_11_is_positive <= 228
 dx_abs_4_11_abs_ge_neg_orig: dx_abs_4_11 + dx_diff_4_11
   + 228 dx_abs_4_11_is_positive >= 0
 dx_abs_4_11_abs_le_neg_orig: dx_abs_4_11 + dx_diff_4_11
   - 228 dx_abs_4_11_is_positive <= 0
 dx_abs_4_11_force_positive: dx_diff_4_11 - 228 dx_abs_4_11_is_positive
   >= -228
 dx_abs_4_11_force_negative: dx_diff_4_11 - 228 dx_abs_4_11_is_positive
   <= 0
 dy_abs_4_11_abs_ge_orig: dy_abs_4_11 - dy_diff_4_11
   - 228 dy_abs_4_11_is_positive >= -228
 dy_abs_4_11_abs_le_orig: dy_abs_4_11 - dy_diff_4_11
   + 228 dy_abs_4_11_is_positive <= 228
 dy_abs_4_11_abs_ge_neg_orig: dy_abs_4_11 + dy_diff_4_11
   + 228 dy_abs_4_11_is_positive >= 0
 dy_abs_4_11_abs_le_neg_orig: dy_abs_4_11 + dy_diff_4_11
   - 228 dy_abs_4_11_is_positive <= 0
 dy_abs_4_11_force_positive: dy_diff_4_11 - 228 dy_abs_4_11_is_positive
   >= -228
 dy_abs_4_11_force_negative: dy_diff_4_11 - 228 dy_abs_4_11_is_positive
   <= 0
 dx_diff_def_4_14: - cx_grid_var_4 + cx_grid_var_14 + dx_diff_4_14 = 0
 dy_diff_def_4_14: - cy_grid_var_4 + cy_grid_var_14 + dy_diff_4_14 = 0
 dx_abs_4_14_abs_ge_orig: dx_abs_4_14 - dx_diff_4_14
   - 228 dx_abs_4_14_is_positive >= -228
 dx_abs_4_14_abs_le_orig: dx_abs_4_14 - dx_diff_4_14
   + 228 dx_abs_4_14_is_positive <= 228
 dx_abs_4_14_abs_ge_neg_orig: dx_abs_4_14 + dx_diff_4_14
   + 228 dx_abs_4_14_is_positive >= 0
 dx_abs_4_14_abs_le_neg_orig: dx_abs_4_14 + dx_diff_4_14
   - 228 dx_abs_4_14_is_positive <= 0
 dx_abs_4_14_force_positive: dx_diff_4_14 - 228 dx_abs_4_14_is_positive
   >= -228
 dx_abs_4_14_force_negative: dx_diff_4_14 - 228 dx_abs_4_14_is_positive
   <= 0
 dy_abs_4_14_abs_ge_orig: dy_abs_4_14 - dy_diff_4_14
   - 228 dy_abs_4_14_is_positive >= -228
 dy_abs_4_14_abs_le_orig: dy_abs_4_14 - dy_diff_4_14
   + 228 dy_abs_4_14_is_positive <= 228
 dy_abs_4_14_abs_ge_neg_orig: dy_abs_4_14 + dy_diff_4_14
   + 228 dy_abs_4_14_is_positive >= 0
 dy_abs_4_14_abs_le_neg_orig: dy_abs_4_14 + dy_diff_4_14
   - 228 dy_abs_4_14_is_positive <= 0
 dy_abs_4_14_force_positive: dy_diff_4_14 - 228 dy_abs_4_14_is_positive
   >= -228
 dy_abs_4_14_force_negative: dy_diff_4_14 - 228 dy_abs_4_14_is_positive
   <= 0
 dx_diff_def_5_10: - cx_grid_var_5 + cx_grid_var_10 + dx_diff_5_10 = 0
 dy_diff_def_5_10: - cy_grid_var_5 + cy_grid_var_10 + dy_diff_5_10 = 0
 dx_abs_5_10_abs_ge_orig: dx_abs_5_10 - dx_diff_5_10
   - 228 dx_abs_5_10_is_positive >= -228
 dx_abs_5_10_abs_le_orig: dx_abs_5_10 - dx_diff_5_10
   + 228 dx_abs_5_10_is_positive <= 228
 dx_abs_5_10_abs_ge_neg_orig: dx_abs_5_10 + dx_diff_5_10
   + 228 dx_abs_5_10_is_positive >= 0
 dx_abs_5_10_abs_le_neg_orig: dx_abs_5_10 + dx_diff_5_10
   - 228 dx_abs_5_10_is_positive <= 0
 dx_abs_5_10_force_positive: dx_diff_5_10 - 228 dx_abs_5_10_is_positive
   >= -228
 dx_abs_5_10_force_negative: dx_diff_5_10 - 228 dx_abs_5_10_is_positive
   <= 0
 dy_abs_5_10_abs_ge_orig: dy_abs_5_10 - dy_diff_5_10
   - 228 dy_abs_5_10_is_positive >= -228
 dy_abs_5_10_abs_le_orig: dy_abs_5_10 - dy_diff_5_10
   + 228 dy_abs_5_10_is_positive <= 228
 dy_abs_5_10_abs_ge_neg_orig: dy_abs_5_10 + dy_diff_5_10
   + 228 dy_abs_5_10_is_positive >= 0
 dy_abs_5_10_abs_le_neg_orig: dy_abs_5_10 + dy_diff_5_10
   - 228 dy_abs_5_10_is_positive <= 0
 dy_abs_5_10_force_positive: dy_diff_5_10 - 228 dy_abs_5_10_is_positive
   >= -228
 dy_abs_5_10_force_negative: dy_diff_5_10 - 228 dy_abs_5_10_is_positive
   <= 0
 dx_diff_def_6_14: - cx_grid_var_6 + cx_grid_var_14 + dx_diff_6_14 = 0
 dy_diff_def_6_14: - cy_grid_var_6 + cy_grid_var_14 + dy_diff_6_14 = 0
 dx_abs_6_14_abs_ge_orig: dx_abs_6_14 - dx_diff_6_14
   - 228 dx_abs_6_14_is_positive >= -228
 dx_abs_6_14_abs_le_orig: dx_abs_6_14 - dx_diff_6_14
   + 228 dx_abs_6_14_is_positive <= 228
 dx_abs_6_14_abs_ge_neg_orig: dx_abs_6_14 + dx_diff_6_14
   + 228 dx_abs_6_14_is_positive >= 0
 dx_abs_6_14_abs_le_neg_orig: dx_abs_6_14 + dx_diff_6_14
   - 228 dx_abs_6_14_is_positive <= 0
 dx_abs_6_14_force_positive: dx_diff_6_14 - 228 dx_abs_6_14_is_positive
   >= -228
 dx_abs_6_14_force_negative: dx_diff_6_14 - 228 dx_abs_6_14_is_positive
   <= 0
 dy_abs_6_14_abs_ge_orig: dy_abs_6_14 - dy_diff_6_14
   - 228 dy_abs_6_14_is_positive >= -228
 dy_abs_6_14_abs_le_orig: dy_abs_6_14 - dy_diff_6_14
   + 228 dy_abs_6_14_is_positive <= 228
 dy_abs_6_14_abs_ge_neg_orig: dy_abs_6_14 + dy_diff_6_14
   + 228 dy_abs_6_14_is_positive >= 0
 dy_abs_6_14_abs_le_neg_orig: dy_abs_6_14 + dy_diff_6_14
   - 228 dy_abs_6_14_is_positive <= 0
 dy_abs_6_14_force_positive: dy_diff_6_14 - 228 dy_abs_6_14_is_positive
   >= -228
 dy_abs_6_14_force_negative: dy_diff_6_14 - 228 dy_abs_6_14_is_positive
   <= 0
 dx_diff_def_7_9: - cx_grid_var_7 + cx_grid_var_9 + dx_diff_7_9 = 0
 dy_diff_def_7_9: - cy_grid_var_7 + cy_grid_var_9 + dy_diff_7_9 = 0
 dx_abs_7_9_abs_ge_orig: dx_abs_7_9 - dx_diff_7_9
   - 228 dx_abs_7_9_is_positive >= -228
 dx_abs_7_9_abs_le_orig: dx_abs_7_9 - dx_diff_7_9
   + 228 dx_abs_7_9_is_positive <= 228
 dx_abs_7_9_abs_ge_neg_orig: dx_abs_7_9 + dx_diff_7_9
   + 228 dx_abs_7_9_is_positive >= 0
 dx_abs_7_9_abs_le_neg_orig: dx_abs_7_9 + dx_diff_7_9
   - 228 dx_abs_7_9_is_positive <= 0
 dx_abs_7_9_force_positive: dx_diff_7_9 - 228 dx_abs_7_9_is_positive
   >= -228
 dx_abs_7_9_force_negative: dx_diff_7_9 - 228 dx_abs_7_9_is_positive <= 0
 dy_abs_7_9_abs_ge_orig: dy_abs_7_9 - dy_diff_7_9
   - 228 dy_abs_7_9_is_positive >= -228
 dy_abs_7_9_abs_le_orig: dy_abs_7_9 - dy_diff_7_9
   + 228 dy_abs_7_9_is_positive <= 228
 dy_abs_7_9_abs_ge_neg_orig: dy_abs_7_9 + dy_diff_7_9
   + 228 dy_abs_7_9_is_positive >= 0
 dy_abs_7_9_abs_le_neg_orig: dy_abs_7_9 + dy_diff_7_9
   - 228 dy_abs_7_9_is_positive <= 0
 dy_abs_7_9_force_positive: dy_diff_7_9 - 228 dy_abs_7_9_is_positive
   >= -228
 dy_abs_7_9_force_negative: dy_diff_7_9 - 228 dy_abs_7_9_is_positive <= 0
 dx_diff_def_8_13: - cx_grid_var_8 + cx_grid_var_13 + dx_diff_8_13 = 0
 dy_diff_def_8_13: - cy_grid_var_8 + cy_grid_var_13 + dy_diff_8_13 = 0
 dx_abs_8_13_abs_ge_orig: dx_abs_8_13 - dx_diff_8_13
   - 228 dx_abs_8_13_is_positive >= -228
 dx_abs_8_13_abs_le_orig: dx_abs_8_13 - dx_diff_8_13
   + 228 dx_abs_8_13_is_positive <= 228
 dx_abs_8_13_abs_ge_neg_orig: dx_abs_8_13 + dx_diff_8_13
   + 228 dx_abs_8_13_is_positive >= 0
 dx_abs_8_13_abs_le_neg_orig: dx_abs_8_13 + dx_diff_8_13
   - 228 dx_abs_8_13_is_positive <= 0
 dx_abs_8_13_force_positive: dx_diff_8_13 - 228 dx_abs_8_13_is_positive
   >= -228
 dx_abs_8_13_force_negative: dx_diff_8_13 - 228 dx_abs_8_13_is_positive
   <= 0
 dy_abs_8_13_abs_ge_orig: dy_abs_8_13 - dy_diff_8_13
   - 228 dy_abs_8_13_is_positive >= -228
 dy_abs_8_13_abs_le_orig: dy_abs_8_13 - dy_diff_8_13
   + 228 dy_abs_8_13_is_positive <= 228
 dy_abs_8_13_abs_ge_neg_orig: dy_abs_8_13 + dy_diff_8_13
   + 228 dy_abs_8_13_is_positive >= 0
 dy_abs_8_13_abs_le_neg_orig: dy_abs_8_13 + dy_diff_8_13
   - 228 dy_abs_8_13_is_positive <= 0
 dy_abs_8_13_force_positive: dy_diff_8_13 - 228 dy_abs_8_13_is_positive
   >= -228
 dy_abs_8_13_force_negative: dy_diff_8_13 - 228 dy_abs_8_13_is_positive
   <= 0
 dx_diff_def_9_12: - cx_grid_var_9 + cx_grid_var_12 + dx_diff_9_12 = 0
 dy_diff_def_9_12: - cy_grid_var_9 + cy_grid_var_12 + dy_diff_9_12 = 0
 dx_abs_9_12_abs_ge_orig: dx_abs_9_12 - dx_diff_9_12
   - 228 dx_abs_9_12_is_positive >= -228
 dx_abs_9_12_abs_le_orig: dx_abs_9_12 - dx_diff_9_12
   + 228 dx_abs_9_12_is_positive <= 228
 dx_abs_9_12_abs_ge_neg_orig: dx_abs_9_12 + dx_diff_9_12
   + 228 dx_abs_9_12_is_positive >= 0
 dx_abs_9_12_abs_le_neg_orig: dx_abs_9_12 + dx_diff_9_12
   - 228 dx_abs_9_12_is_positive <= 0
 dx_abs_9_12_force_positive: dx_diff_9_12 - 228 dx_abs_9_12_is_positive
   >= -228
 dx_abs_9_12_force_negative: dx_diff_9_12 - 228 dx_abs_9_12_is_positive
   <= 0
 dy_abs_9_12_abs_ge_orig: dy_abs_9_12 - dy_diff_9_12
   - 228 dy_abs_9_12_is_positive >= -228
 dy_abs_9_12_abs_le_orig: dy_abs_9_12 - dy_diff_9_12
   + 228 dy_abs_9_12_is_positive <= 228
 dy_abs_9_12_abs_ge_neg_orig: dy_abs_9_12 + dy_diff_9_12
   + 228 dy_abs_9_12_is_positive >= 0
 dy_abs_9_12_abs_le_neg_orig: dy_abs_9_12 + dy_diff_9_12
   - 228 dy_abs_9_12_is_positive <= 0
 dy_abs_9_12_force_positive: dy_diff_9_12 - 228 dy_abs_9_12_is_positive
   >= -228
 dy_abs_9_12_force_negative: dy_diff_9_12 - 228 dy_abs_9_12_is_positive
   <= 0
 dx_diff_def_10_11: - cx_grid_var_10 + cx_grid_var_11 + dx_diff_10_11 = 0
 dy_diff_def_10_11: - cy_grid_var_10 + cy_grid_var_11 + dy_diff_10_11 = 0
 dx_abs_10_11_abs_ge_orig: dx_abs_10_11 - dx_diff_10_11
   - 228 dx_abs_10_11_is_positive >= -228
 dx_abs_10_11_abs_le_orig: dx_abs_10_11 - dx_diff_10_11
   + 228 dx_abs_10_11_is_positive <= 228
 dx_abs_10_11_abs_ge_neg_orig: dx_abs_10_11 + dx_diff_10_11
   + 228 dx_abs_10_11_is_positive >= 0
 dx_abs_10_11_abs_le_neg_orig: dx_abs_10_11 + dx_diff_10_11
   - 228 dx_abs_10_11_is_positive <= 0
 dx_abs_10_11_force_positive: dx_diff_10_11 - 228 dx_abs_10_11_is_positive
   >= -228
 dx_abs_10_11_force_negative: dx_diff_10_11 - 228 dx_abs_10_11_is_positive
   <= 0
 dy_abs_10_11_abs_ge_orig: dy_abs_10_11 - dy_diff_10_11
   - 228 dy_abs_10_11_is_positive >= -228
 dy_abs_10_11_abs_le_orig: dy_abs_10_11 - dy_diff_10_11
   + 228 dy_abs_10_11_is_positive <= 228
 dy_abs_10_11_abs_ge_neg_orig: dy_abs_10_11 + dy_diff_10_11
   + 228 dy_abs_10_11_is_positive >= 0
 dy_abs_10_11_abs_le_neg_orig: dy_abs_10_11 + dy_diff_10_11
   - 228 dy_abs_10_11_is_positive <= 0
 dy_abs_10_11_force_positive: dy_diff_10_11 - 228 dy_abs_10_11_is_positive
   >= -228
 dy_abs_10_11_force_negative: dy_diff_10_11 - 228 dy_abs_10_11_is_positive
   <= 0
 dx_diff_def_10_13: - cx_grid_var_10 + cx_grid_var_13 + dx_diff_10_13 = 0
 dy_diff_def_10_13: - cy_grid_var_10 + cy_grid_var_13 + dy_diff_10_13 = 0
 dx_abs_10_13_abs_ge_orig: dx_abs_10_13 - dx_diff_10_13
   - 228 dx_abs_10_13_is_positive >= -228
 dx_abs_10_13_abs_le_orig: dx_abs_10_13 - dx_diff_10_13
   + 228 dx_abs_10_13_is_positive <= 228
 dx_abs_10_13_abs_ge_neg_orig: dx_abs_10_13 + dx_diff_10_13
   + 228 dx_abs_10_13_is_positive >= 0
 dx_abs_10_13_abs_le_neg_orig: dx_abs_10_13 + dx_diff_10_13
   - 228 dx_abs_10_13_is_positive <= 0
 dx_abs_10_13_force_positive: dx_diff_10_13 - 228 dx_abs_10_13_is_positive
   >= -228
 dx_abs_10_13_force_negative: dx_diff_10_13 - 228 dx_abs_10_13_is_positive
   <= 0
 dy_abs_10_13_abs_ge_orig: dy_abs_10_13 - dy_diff_10_13
   - 228 dy_abs_10_13_is_positive >= -228
 dy_abs_10_13_abs_le_orig: dy_abs_10_13 - dy_diff_10_13
   + 228 dy_abs_10_13_is_positive <= 228
 dy_abs_10_13_abs_ge_neg_orig: dy_abs_10_13 + dy_diff_10_13
   + 228 dy_abs_10_13_is_positive >= 0
 dy_abs_10_13_abs_le_neg_orig: dy_abs_10_13 + dy_diff_10_13
   - 228 dy_abs_10_13_is_positive <= 0
 dy_abs_10_13_force_positive: dy_diff_10_13 - 228 dy_abs_10_13_is_positive
   >= -228
 dy_abs_10_13_force_negative: dy_diff_10_13 - 228 dy_abs_10_13_is_positive
   <= 0
 dx_diff_def_11_14: - cx_grid_var_11 + cx_grid_var_14 + dx_diff_11_14 = 0
 dy_diff_def_11_14: - cy_grid_var_11 + cy_grid_var_14 + dy_diff_11_14 = 0
 dx_abs_11_14_abs_ge_orig: dx_abs_11_14 - dx_diff_11_14
   - 228 dx_abs_11_14_is_positive >= -228
 dx_abs_11_14_abs_le_orig: dx_abs_11_14 - dx_diff_11_14
   + 228 dx_abs_11_14_is_positive <= 228
 dx_abs_11_14_abs_ge_neg_orig: dx_abs_11_14 + dx_diff_11_14
   + 228 dx_abs_11_14_is_positive >= 0
 dx_abs_11_14_abs_le_neg_orig: dx_abs_11_14 + dx_diff_11_14
   - 228 dx_abs_11_14_is_positive <= 0
 dx_abs_11_14_force_positive: dx_diff_11_14 - 228 dx_abs_11_14_is_positive
   >= -228
 dx_abs_11_14_force_negative: dx_diff_11_14 - 228 dx_abs_11_14_is_positive
   <= 0
 dy_abs_11_14_abs_ge_orig: dy_abs_11_14 - dy_diff_11_14
   - 228 dy_abs_11_14_is_positive >= -228
 dy_abs_11_14_abs_le_orig: dy_abs_11_14 - dy_diff_11_14
   + 228 dy_abs_11_14_is_positive <= 228
 dy_abs_11_14_abs_ge_neg_orig: dy_abs_11_14 + dy_diff_11_14
   + 228 dy_abs_11_14_is_positive >= 0
 dy_abs_11_14_abs_le_neg_orig: dy_abs_11_14 + dy_diff_11_14
   - 228 dy_abs_11_14_is_positive <= 0
 dy_abs_11_14_force_positive: dy_diff_11_14 - 228 dy_abs_11_14_is_positive
   >= -228
 dy_abs_11_14_force_negative: dy_diff_11_14 - 228 dy_abs_11_14_is_positive
   <= 0
 dx_diff_def_i_0_7: EMIB_cx_grid_var_0_7 - cx_grid_var_0 + dx_diff_i_0_7
   = 0
 dx_diff_def_j_0_7: EMIB_cx_grid_var_0_7 - cx_grid_var_7 + dx_diff_j_0_7
   = 0
 dy_diff_def_i_0_7: EMIB_cy_grid_var_0_7 - cy_grid_var_0 + dy_diff_i_0_7
   = 0
 dy_diff_def_j_0_7: EMIB_cy_grid_var_0_7 - cy_grid_var_7 + dy_diff_j_0_7
   = 0
 dx_abs_i_0_7_abs_ge_orig: dx_abs_i_0_7 - dx_diff_i_0_7
   - 228 dx_abs_i_0_7_is_positive >= -228
 dx_abs_i_0_7_abs_le_orig: dx_abs_i_0_7 - dx_diff_i_0_7
   + 228 dx_abs_i_0_7_is_positive <= 228
 dx_abs_i_0_7_abs_ge_neg_orig: dx_abs_i_0_7 + dx_diff_i_0_7
   + 228 dx_abs_i_0_7_is_positive >= 0
 dx_abs_i_0_7_abs_le_neg_orig: dx_abs_i_0_7 + dx_diff_i_0_7
   - 228 dx_abs_i_0_7_is_positive <= 0
 dx_abs_i_0_7_force_positive: dx_diff_i_0_7 - 228 dx_abs_i_0_7_is_positive
   >= -228
 dx_abs_i_0_7_force_negative: dx_diff_i_0_7 - 228 dx_abs_i_0_7_is_positive
   <= 0
 dy_abs_i_0_7_abs_ge_orig: dy_abs_i_0_7 - dy_diff_i_0_7
   - 228 dy_abs_i_0_7_is_positive >= -228
 dy_abs_i_0_7_abs_le_orig: dy_abs_i_0_7 - dy_diff_i_0_7
   + 228 dy_abs_i_0_7_is_positive <= 228
 dy_abs_i_0_7_abs_ge_neg_orig: dy_abs_i_0_7 + dy_diff_i_0_7
   + 228 dy_abs_i_0_7_is_positive >= 0
 dy_abs_i_0_7_abs_le_neg_orig: dy_abs_i_0_7 + dy_diff_i_0_7
   - 228 dy_abs_i_0_7_is_positive <= 0
 dy_abs_i_0_7_force_positive: dy_diff_i_0_7 - 228 dy_abs_i_0_7_is_positive
   >= -228
 dy_abs_i_0_7_force_negative: dy_diff_i_0_7 - 228 dy_abs_i_0_7_is_positive
   <= 0
 dx_abs_j_0_7_abs_ge_orig: dx_abs_j_0_7 - dx_diff_j_0_7
   - 228 dx_abs_j_0_7_is_positive >= -228
 dx_abs_j_0_7_abs_le_orig: dx_abs_j_0_7 - dx_diff_j_0_7
   + 228 dx_abs_j_0_7_is_positive <= 228
 dx_abs_j_0_7_abs_ge_neg_orig: dx_abs_j_0_7 + dx_diff_j_0_7
   + 228 dx_abs_j_0_7_is_positive >= 0
 dx_abs_j_0_7_abs_le_neg_orig: dx_abs_j_0_7 + dx_diff_j_0_7
   - 228 dx_abs_j_0_7_is_positive <= 0
 dx_abs_j_0_7_force_positive: dx_diff_j_0_7 - 228 dx_abs_j_0_7_is_positive
   >= -228
 dx_abs_j_0_7_force_negative: dx_diff_j_0_7 - 228 dx_abs_j_0_7_is_positive
   <= 0
 dy_abs_j_0_7_abs_ge_orig: dy_abs_j_0_7 - dy_diff_j_0_7
   - 228 dy_abs_j_0_7_is_positive >= -228
 dy_abs_j_0_7_abs_le_orig: dy_abs_j_0_7 - dy_diff_j_0_7
   + 228 dy_abs_j_0_7_is_positive <= 228
 dy_abs_j_0_7_abs_ge_neg_orig: dy_abs_j_0_7 + dy_diff_j_0_7
   + 228 dy_abs_j_0_7_is_positive >= 0
 dy_abs_j_0_7_abs_le_neg_orig: dy_abs_j_0_7 + dy_diff_j_0_7
   - 228 dy_abs_j_0_7_is_positive <= 0
 dy_abs_j_0_7_force_positive: dy_diff_j_0_7 - 228 dy_abs_j_0_7_is_positive
   >= -228
 dy_abs_j_0_7_force_negative: dy_diff_j_0_7 - 228 dy_abs_j_0_7_is_positive
   <= 0
 dx_diff_def_i_0_9: EMIB_cx_grid_var_0_9 - cx_grid_var_0 + dx_diff_i_0_9
   = 0
 dx_diff_def_j_0_9: EMIB_cx_grid_var_0_9 - cx_grid_var_9 + dx_diff_j_0_9
   = 0
 dy_diff_def_i_0_9: EMIB_cy_grid_var_0_9 - cy_grid_var_0 + dy_diff_i_0_9
   = 0
 dy_diff_def_j_0_9: EMIB_cy_grid_var_0_9 - cy_grid_var_9 + dy_diff_j_0_9
   = 0
 dx_abs_i_0_9_abs_ge_orig: dx_abs_i_0_9 - dx_diff_i_0_9
   - 228 dx_abs_i_0_9_is_positive >= -228
 dx_abs_i_0_9_abs_le_orig: dx_abs_i_0_9 - dx_diff_i_0_9
   + 228 dx_abs_i_0_9_is_positive <= 228
 dx_abs_i_0_9_abs_ge_neg_orig: dx_abs_i_0_9 + dx_diff_i_0_9
   + 228 dx_abs_i_0_9_is_positive >= 0
 dx_abs_i_0_9_abs_le_neg_orig: dx_abs_i_0_9 + dx_diff_i_0_9
   - 228 dx_abs_i_0_9_is_positive <= 0
 dx_abs_i_0_9_force_positive: dx_diff_i_0_9 - 228 dx_abs_i_0_9_is_positive
   >= -228
 dx_abs_i_0_9_force_negative: dx_diff_i_0_9 - 228 dx_abs_i_0_9_is_positive
   <= 0
 dy_abs_i_0_9_abs_ge_orig: dy_abs_i_0_9 - dy_diff_i_0_9
   - 228 dy_abs_i_0_9_is_positive >= -228
 dy_abs_i_0_9_abs_le_orig: dy_abs_i_0_9 - dy_diff_i_0_9
   + 228 dy_abs_i_0_9_is_positive <= 228
 dy_abs_i_0_9_abs_ge_neg_orig: dy_abs_i_0_9 + dy_diff_i_0_9
   + 228 dy_abs_i_0_9_is_positive >= 0
 dy_abs_i_0_9_abs_le_neg_orig: dy_abs_i_0_9 + dy_diff_i_0_9
   - 228 dy_abs_i_0_9_is_positive <= 0
 dy_abs_i_0_9_force_positive: dy_diff_i_0_9 - 228 dy_abs_i_0_9_is_positive
   >= -228
 dy_abs_i_0_9_force_negative: dy_diff_i_0_9 - 228 dy_abs_i_0_9_is_positive
   <= 0
 dx_abs_j_0_9_abs_ge_orig: dx_abs_j_0_9 - dx_diff_j_0_9
   - 228 dx_abs_j_0_9_is_positive >= -228
 dx_abs_j_0_9_abs_le_orig: dx_abs_j_0_9 - dx_diff_j_0_9
   + 228 dx_abs_j_0_9_is_positive <= 228
 dx_abs_j_0_9_abs_ge_neg_orig: dx_abs_j_0_9 + dx_diff_j_0_9
   + 228 dx_abs_j_0_9_is_positive >= 0
 dx_abs_j_0_9_abs_le_neg_orig: dx_abs_j_0_9 + dx_diff_j_0_9
   - 228 dx_abs_j_0_9_is_positive <= 0
 dx_abs_j_0_9_force_positive: dx_diff_j_0_9 - 228 dx_abs_j_0_9_is_positive
   >= -228
 dx_abs_j_0_9_force_negative: dx_diff_j_0_9 - 228 dx_abs_j_0_9_is_positive
   <= 0
 dy_abs_j_0_9_abs_ge_orig: dy_abs_j_0_9 - dy_diff_j_0_9
   - 228 dy_abs_j_0_9_is_positive >= -228
 dy_abs_j_0_9_abs_le_orig: dy_abs_j_0_9 - dy_diff_j_0_9
   + 228 dy_abs_j_0_9_is_positive <= 228
 dy_abs_j_0_9_abs_ge_neg_orig: dy_abs_j_0_9 + dy_diff_j_0_9
   + 228 dy_abs_j_0_9_is_positive >= 0
 dy_abs_j_0_9_abs_le_neg_orig: dy_abs_j_0_9 + dy_diff_j_0_9
   - 228 dy_abs_j_0_9_is_positive <= 0
 dy_abs_j_0_9_force_positive: dy_diff_j_0_9 - 228 dy_abs_j_0_9_is_positive
   >= -228
 dy_abs_j_0_9_force_negative: dy_diff_j_0_9 - 228 dy_abs_j_0_9_is_positive
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
   - 228 dx_abs_i_1_4_is_positive >= -228
 dx_abs_i_1_4_abs_le_orig: dx_abs_i_1_4 - dx_diff_i_1_4
   + 228 dx_abs_i_1_4_is_positive <= 228
 dx_abs_i_1_4_abs_ge_neg_orig: dx_abs_i_1_4 + dx_diff_i_1_4
   + 228 dx_abs_i_1_4_is_positive >= 0
 dx_abs_i_1_4_abs_le_neg_orig: dx_abs_i_1_4 + dx_diff_i_1_4
   - 228 dx_abs_i_1_4_is_positive <= 0
 dx_abs_i_1_4_force_positive: dx_diff_i_1_4 - 228 dx_abs_i_1_4_is_positive
   >= -228
 dx_abs_i_1_4_force_negative: dx_diff_i_1_4 - 228 dx_abs_i_1_4_is_positive
   <= 0
 dy_abs_i_1_4_abs_ge_orig: dy_abs_i_1_4 - dy_diff_i_1_4
   - 228 dy_abs_i_1_4_is_positive >= -228
 dy_abs_i_1_4_abs_le_orig: dy_abs_i_1_4 - dy_diff_i_1_4
   + 228 dy_abs_i_1_4_is_positive <= 228
 dy_abs_i_1_4_abs_ge_neg_orig: dy_abs_i_1_4 + dy_diff_i_1_4
   + 228 dy_abs_i_1_4_is_positive >= 0
 dy_abs_i_1_4_abs_le_neg_orig: dy_abs_i_1_4 + dy_diff_i_1_4
   - 228 dy_abs_i_1_4_is_positive <= 0
 dy_abs_i_1_4_force_positive: dy_diff_i_1_4 - 228 dy_abs_i_1_4_is_positive
   >= -228
 dy_abs_i_1_4_force_negative: dy_diff_i_1_4 - 228 dy_abs_i_1_4_is_positive
   <= 0
 dx_abs_j_1_4_abs_ge_orig: dx_abs_j_1_4 - dx_diff_j_1_4
   - 228 dx_abs_j_1_4_is_positive >= -228
 dx_abs_j_1_4_abs_le_orig: dx_abs_j_1_4 - dx_diff_j_1_4
   + 228 dx_abs_j_1_4_is_positive <= 228
 dx_abs_j_1_4_abs_ge_neg_orig: dx_abs_j_1_4 + dx_diff_j_1_4
   + 228 dx_abs_j_1_4_is_positive >= 0
 dx_abs_j_1_4_abs_le_neg_orig: dx_abs_j_1_4 + dx_diff_j_1_4
   - 228 dx_abs_j_1_4_is_positive <= 0
 dx_abs_j_1_4_force_positive: dx_diff_j_1_4 - 228 dx_abs_j_1_4_is_positive
   >= -228
 dx_abs_j_1_4_force_negative: dx_diff_j_1_4 - 228 dx_abs_j_1_4_is_positive
   <= 0
 dy_abs_j_1_4_abs_ge_orig: dy_abs_j_1_4 - dy_diff_j_1_4
   - 228 dy_abs_j_1_4_is_positive >= -228
 dy_abs_j_1_4_abs_le_orig: dy_abs_j_1_4 - dy_diff_j_1_4
   + 228 dy_abs_j_1_4_is_positive <= 228
 dy_abs_j_1_4_abs_ge_neg_orig: dy_abs_j_1_4 + dy_diff_j_1_4
   + 228 dy_abs_j_1_4_is_positive >= 0
 dy_abs_j_1_4_abs_le_neg_orig: dy_abs_j_1_4 + dy_diff_j_1_4
   - 228 dy_abs_j_1_4_is_positive <= 0
 dy_abs_j_1_4_force_positive: dy_diff_j_1_4 - 228 dy_abs_j_1_4_is_positive
   >= -228
 dy_abs_j_1_4_force_negative: dy_diff_j_1_4 - 228 dy_abs_j_1_4_is_positive
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
   - 228 dx_abs_i_1_8_is_positive >= -228
 dx_abs_i_1_8_abs_le_orig: dx_abs_i_1_8 - dx_diff_i_1_8
   + 228 dx_abs_i_1_8_is_positive <= 228
 dx_abs_i_1_8_abs_ge_neg_orig: dx_abs_i_1_8 + dx_diff_i_1_8
   + 228 dx_abs_i_1_8_is_positive >= 0
 dx_abs_i_1_8_abs_le_neg_orig: dx_abs_i_1_8 + dx_diff_i_1_8
   - 228 dx_abs_i_1_8_is_positive <= 0
 dx_abs_i_1_8_force_positive: dx_diff_i_1_8 - 228 dx_abs_i_1_8_is_positive
   >= -228
 dx_abs_i_1_8_force_negative: dx_diff_i_1_8 - 228 dx_abs_i_1_8_is_positive
   <= 0
 dy_abs_i_1_8_abs_ge_orig: dy_abs_i_1_8 - dy_diff_i_1_8
   - 228 dy_abs_i_1_8_is_positive >= -228
 dy_abs_i_1_8_abs_le_orig: dy_abs_i_1_8 - dy_diff_i_1_8
   + 228 dy_abs_i_1_8_is_positive <= 228
 dy_abs_i_1_8_abs_ge_neg_orig: dy_abs_i_1_8 + dy_diff_i_1_8
   + 228 dy_abs_i_1_8_is_positive >= 0
 dy_abs_i_1_8_abs_le_neg_orig: dy_abs_i_1_8 + dy_diff_i_1_8
   - 228 dy_abs_i_1_8_is_positive <= 0
 dy_abs_i_1_8_force_positive: dy_diff_i_1_8 - 228 dy_abs_i_1_8_is_positive
   >= -228
 dy_abs_i_1_8_force_negative: dy_diff_i_1_8 - 228 dy_abs_i_1_8_is_positive
   <= 0
 dx_abs_j_1_8_abs_ge_orig: dx_abs_j_1_8 - dx_diff_j_1_8
   - 228 dx_abs_j_1_8_is_positive >= -228
 dx_abs_j_1_8_abs_le_orig: dx_abs_j_1_8 - dx_diff_j_1_8
   + 228 dx_abs_j_1_8_is_positive <= 228
 dx_abs_j_1_8_abs_ge_neg_orig: dx_abs_j_1_8 + dx_diff_j_1_8
   + 228 dx_abs_j_1_8_is_positive >= 0
 dx_abs_j_1_8_abs_le_neg_orig: dx_abs_j_1_8 + dx_diff_j_1_8
   - 228 dx_abs_j_1_8_is_positive <= 0
 dx_abs_j_1_8_force_positive: dx_diff_j_1_8 - 228 dx_abs_j_1_8_is_positive
   >= -228
 dx_abs_j_1_8_force_negative: dx_diff_j_1_8 - 228 dx_abs_j_1_8_is_positive
   <= 0
 dy_abs_j_1_8_abs_ge_orig: dy_abs_j_1_8 - dy_diff_j_1_8
   - 228 dy_abs_j_1_8_is_positive >= -228
 dy_abs_j_1_8_abs_le_orig: dy_abs_j_1_8 - dy_diff_j_1_8
   + 228 dy_abs_j_1_8_is_positive <= 228
 dy_abs_j_1_8_abs_ge_neg_orig: dy_abs_j_1_8 + dy_diff_j_1_8
   + 228 dy_abs_j_1_8_is_positive >= 0
 dy_abs_j_1_8_abs_le_neg_orig: dy_abs_j_1_8 + dy_diff_j_1_8
   - 228 dy_abs_j_1_8_is_positive <= 0
 dy_abs_j_1_8_force_positive: dy_diff_j_1_8 - 228 dy_abs_j_1_8_is_positive
   >= -228
 dy_abs_j_1_8_force_negative: dy_diff_j_1_8 - 228 dy_abs_j_1_8_is_positive
   <= 0
 dx_diff_def_i_1_11: EMIB_cx_grid_var_1_11 - cx_grid_var_1 + dx_diff_i_1_11
   = 0
 dx_diff_def_j_1_11: EMIB_cx_grid_var_1_11 - cx_grid_var_11
   + dx_diff_j_1_11 = 0
 dy_diff_def_i_1_11: EMIB_cy_grid_var_1_11 - cy_grid_var_1 + dy_diff_i_1_11
   = 0
 dy_diff_def_j_1_11: EMIB_cy_grid_var_1_11 - cy_grid_var_11
   + dy_diff_j_1_11 = 0
 dx_abs_i_1_11_abs_ge_orig: dx_abs_i_1_11 - dx_diff_i_1_11
   - 228 dx_abs_i_1_11_is_positive >= -228
 dx_abs_i_1_11_abs_le_orig: dx_abs_i_1_11 - dx_diff_i_1_11
   + 228 dx_abs_i_1_11_is_positive <= 228
 dx_abs_i_1_11_abs_ge_neg_orig: dx_abs_i_1_11 + dx_diff_i_1_11
   + 228 dx_abs_i_1_11_is_positive >= 0
 dx_abs_i_1_11_abs_le_neg_orig: dx_abs_i_1_11 + dx_diff_i_1_11
   - 228 dx_abs_i_1_11_is_positive <= 0
 dx_abs_i_1_11_force_positive: dx_diff_i_1_11
   - 228 dx_abs_i_1_11_is_positive >= -228
 dx_abs_i_1_11_force_negative: dx_diff_i_1_11
   - 228 dx_abs_i_1_11_is_positive <= 0
 dy_abs_i_1_11_abs_ge_orig: dy_abs_i_1_11 - dy_diff_i_1_11
   - 228 dy_abs_i_1_11_is_positive >= -228
 dy_abs_i_1_11_abs_le_orig: dy_abs_i_1_11 - dy_diff_i_1_11
   + 228 dy_abs_i_1_11_is_positive <= 228
 dy_abs_i_1_11_abs_ge_neg_orig: dy_abs_i_1_11 + dy_diff_i_1_11
   + 228 dy_abs_i_1_11_is_positive >= 0
 dy_abs_i_1_11_abs_le_neg_orig: dy_abs_i_1_11 + dy_diff_i_1_11
   - 228 dy_abs_i_1_11_is_positive <= 0
 dy_abs_i_1_11_force_positive: dy_diff_i_1_11
   - 228 dy_abs_i_1_11_is_positive >= -228
 dy_abs_i_1_11_force_negative: dy_diff_i_1_11
   - 228 dy_abs_i_1_11_is_positive <= 0
 dx_abs_j_1_11_abs_ge_orig: dx_abs_j_1_11 - dx_diff_j_1_11
   - 228 dx_abs_j_1_11_is_positive >= -228
 dx_abs_j_1_11_abs_le_orig: dx_abs_j_1_11 - dx_diff_j_1_11
   + 228 dx_abs_j_1_11_is_positive <= 228
 dx_abs_j_1_11_abs_ge_neg_orig: dx_abs_j_1_11 + dx_diff_j_1_11
   + 228 dx_abs_j_1_11_is_positive >= 0
 dx_abs_j_1_11_abs_le_neg_orig: dx_abs_j_1_11 + dx_diff_j_1_11
   - 228 dx_abs_j_1_11_is_positive <= 0
 dx_abs_j_1_11_force_positive: dx_diff_j_1_11
   - 228 dx_abs_j_1_11_is_positive >= -228
 dx_abs_j_1_11_force_negative: dx_diff_j_1_11
   - 228 dx_abs_j_1_11_is_positive <= 0
 dy_abs_j_1_11_abs_ge_orig: dy_abs_j_1_11 - dy_diff_j_1_11
   - 228 dy_abs_j_1_11_is_positive >= -228
 dy_abs_j_1_11_abs_le_orig: dy_abs_j_1_11 - dy_diff_j_1_11
   + 228 dy_abs_j_1_11_is_positive <= 228
 dy_abs_j_1_11_abs_ge_neg_orig: dy_abs_j_1_11 + dy_diff_j_1_11
   + 228 dy_abs_j_1_11_is_positive >= 0
 dy_abs_j_1_11_abs_le_neg_orig: dy_abs_j_1_11 + dy_diff_j_1_11
   - 228 dy_abs_j_1_11_is_positive <= 0
 dy_abs_j_1_11_force_positive: dy_diff_j_1_11
   - 228 dy_abs_j_1_11_is_positive >= -228
 dy_abs_j_1_11_force_negative: dy_diff_j_1_11
   - 228 dy_abs_j_1_11_is_positive <= 0
 dx_diff_def_i_1_13: EMIB_cx_grid_var_1_13 - cx_grid_var_1 + dx_diff_i_1_13
   = 0
 dx_diff_def_j_1_13: EMIB_cx_grid_var_1_13 - cx_grid_var_13
   + dx_diff_j_1_13 = 0
 dy_diff_def_i_1_13: EMIB_cy_grid_var_1_13 - cy_grid_var_1 + dy_diff_i_1_13
   = 0
 dy_diff_def_j_1_13: EMIB_cy_grid_var_1_13 - cy_grid_var_13
   + dy_diff_j_1_13 = 0
 dx_abs_i_1_13_abs_ge_orig: dx_abs_i_1_13 - dx_diff_i_1_13
   - 228 dx_abs_i_1_13_is_positive >= -228
 dx_abs_i_1_13_abs_le_orig: dx_abs_i_1_13 - dx_diff_i_1_13
   + 228 dx_abs_i_1_13_is_positive <= 228
 dx_abs_i_1_13_abs_ge_neg_orig: dx_abs_i_1_13 + dx_diff_i_1_13
   + 228 dx_abs_i_1_13_is_positive >= 0
 dx_abs_i_1_13_abs_le_neg_orig: dx_abs_i_1_13 + dx_diff_i_1_13
   - 228 dx_abs_i_1_13_is_positive <= 0
 dx_abs_i_1_13_force_positive: dx_diff_i_1_13
   - 228 dx_abs_i_1_13_is_positive >= -228
 dx_abs_i_1_13_force_negative: dx_diff_i_1_13
   - 228 dx_abs_i_1_13_is_positive <= 0
 dy_abs_i_1_13_abs_ge_orig: dy_abs_i_1_13 - dy_diff_i_1_13
   - 228 dy_abs_i_1_13_is_positive >= -228
 dy_abs_i_1_13_abs_le_orig: dy_abs_i_1_13 - dy_diff_i_1_13
   + 228 dy_abs_i_1_13_is_positive <= 228
 dy_abs_i_1_13_abs_ge_neg_orig: dy_abs_i_1_13 + dy_diff_i_1_13
   + 228 dy_abs_i_1_13_is_positive >= 0
 dy_abs_i_1_13_abs_le_neg_orig: dy_abs_i_1_13 + dy_diff_i_1_13
   - 228 dy_abs_i_1_13_is_positive <= 0
 dy_abs_i_1_13_force_positive: dy_diff_i_1_13
   - 228 dy_abs_i_1_13_is_positive >= -228
 dy_abs_i_1_13_force_negative: dy_diff_i_1_13
   - 228 dy_abs_i_1_13_is_positive <= 0
 dx_abs_j_1_13_abs_ge_orig: dx_abs_j_1_13 - dx_diff_j_1_13
   - 228 dx_abs_j_1_13_is_positive >= -228
 dx_abs_j_1_13_abs_le_orig: dx_abs_j_1_13 - dx_diff_j_1_13
   + 228 dx_abs_j_1_13_is_positive <= 228
 dx_abs_j_1_13_abs_ge_neg_orig: dx_abs_j_1_13 + dx_diff_j_1_13
   + 228 dx_abs_j_1_13_is_positive >= 0
 dx_abs_j_1_13_abs_le_neg_orig: dx_abs_j_1_13 + dx_diff_j_1_13
   - 228 dx_abs_j_1_13_is_positive <= 0
 dx_abs_j_1_13_force_positive: dx_diff_j_1_13
   - 228 dx_abs_j_1_13_is_positive >= -228
 dx_abs_j_1_13_force_negative: dx_diff_j_1_13
   - 228 dx_abs_j_1_13_is_positive <= 0
 dy_abs_j_1_13_abs_ge_orig: dy_abs_j_1_13 - dy_diff_j_1_13
   - 228 dy_abs_j_1_13_is_positive >= -228
 dy_abs_j_1_13_abs_le_orig: dy_abs_j_1_13 - dy_diff_j_1_13
   + 228 dy_abs_j_1_13_is_positive <= 228
 dy_abs_j_1_13_abs_ge_neg_orig: dy_abs_j_1_13 + dy_diff_j_1_13
   + 228 dy_abs_j_1_13_is_positive >= 0
 dy_abs_j_1_13_abs_le_neg_orig: dy_abs_j_1_13 + dy_diff_j_1_13
   - 228 dy_abs_j_1_13_is_positive <= 0
 dy_abs_j_1_13_force_positive: dy_diff_j_1_13
   - 228 dy_abs_j_1_13_is_positive >= -228
 dy_abs_j_1_13_force_negative: dy_diff_j_1_13
   - 228 dy_abs_j_1_13_is_positive <= 0
 dx_diff_def_i_2_3: EMIB_cx_grid_var_2_3 - cx_grid_var_2 + dx_diff_i_2_3
   = 0
 dx_diff_def_j_2_3: EMIB_cx_grid_var_2_3 - cx_grid_var_3 + dx_diff_j_2_3
   = 0
 dy_diff_def_i_2_3: EMIB_cy_grid_var_2_3 - cy_grid_var_2 + dy_diff_i_2_3
   = 0
 dy_diff_def_j_2_3: EMIB_cy_grid_var_2_3 - cy_grid_var_3 + dy_diff_j_2_3
   = 0
 dx_abs_i_2_3_abs_ge_orig: dx_abs_i_2_3 - dx_diff_i_2_3
   - 228 dx_abs_i_2_3_is_positive >= -228
 dx_abs_i_2_3_abs_le_orig: dx_abs_i_2_3 - dx_diff_i_2_3
   + 228 dx_abs_i_2_3_is_positive <= 228
 dx_abs_i_2_3_abs_ge_neg_orig: dx_abs_i_2_3 + dx_diff_i_2_3
   + 228 dx_abs_i_2_3_is_positive >= 0
 dx_abs_i_2_3_abs_le_neg_orig: dx_abs_i_2_3 + dx_diff_i_2_3
   - 228 dx_abs_i_2_3_is_positive <= 0
 dx_abs_i_2_3_force_positive: dx_diff_i_2_3 - 228 dx_abs_i_2_3_is_positive
   >= -228
 dx_abs_i_2_3_force_negative: dx_diff_i_2_3 - 228 dx_abs_i_2_3_is_positive
   <= 0
 dy_abs_i_2_3_abs_ge_orig: dy_abs_i_2_3 - dy_diff_i_2_3
   - 228 dy_abs_i_2_3_is_positive >= -228
 dy_abs_i_2_3_abs_le_orig: dy_abs_i_2_3 - dy_diff_i_2_3
   + 228 dy_abs_i_2_3_is_positive <= 228
 dy_abs_i_2_3_abs_ge_neg_orig: dy_abs_i_2_3 + dy_diff_i_2_3
   + 228 dy_abs_i_2_3_is_positive >= 0
 dy_abs_i_2_3_abs_le_neg_orig: dy_abs_i_2_3 + dy_diff_i_2_3
   - 228 dy_abs_i_2_3_is_positive <= 0
 dy_abs_i_2_3_force_positive: dy_diff_i_2_3 - 228 dy_abs_i_2_3_is_positive
   >= -228
 dy_abs_i_2_3_force_negative: dy_diff_i_2_3 - 228 dy_abs_i_2_3_is_positive
   <= 0
 dx_abs_j_2_3_abs_ge_orig: dx_abs_j_2_3 - dx_diff_j_2_3
   - 228 dx_abs_j_2_3_is_positive >= -228
 dx_abs_j_2_3_abs_le_orig: dx_abs_j_2_3 - dx_diff_j_2_3
   + 228 dx_abs_j_2_3_is_positive <= 228
 dx_abs_j_2_3_abs_ge_neg_orig: dx_abs_j_2_3 + dx_diff_j_2_3
   + 228 dx_abs_j_2_3_is_positive >= 0
 dx_abs_j_2_3_abs_le_neg_orig: dx_abs_j_2_3 + dx_diff_j_2_3
   - 228 dx_abs_j_2_3_is_positive <= 0
 dx_abs_j_2_3_force_positive: dx_diff_j_2_3 - 228 dx_abs_j_2_3_is_positive
   >= -228
 dx_abs_j_2_3_force_negative: dx_diff_j_2_3 - 228 dx_abs_j_2_3_is_positive
   <= 0
 dy_abs_j_2_3_abs_ge_orig: dy_abs_j_2_3 - dy_diff_j_2_3
   - 228 dy_abs_j_2_3_is_positive >= -228
 dy_abs_j_2_3_abs_le_orig: dy_abs_j_2_3 - dy_diff_j_2_3
   + 228 dy_abs_j_2_3_is_positive <= 228
 dy_abs_j_2_3_abs_ge_neg_orig: dy_abs_j_2_3 + dy_diff_j_2_3
   + 228 dy_abs_j_2_3_is_positive >= 0
 dy_abs_j_2_3_abs_le_neg_orig: dy_abs_j_2_3 + dy_diff_j_2_3
   - 228 dy_abs_j_2_3_is_positive <= 0
 dy_abs_j_2_3_force_positive: dy_diff_j_2_3 - 228 dy_abs_j_2_3_is_positive
   >= -228
 dy_abs_j_2_3_force_negative: dy_diff_j_2_3 - 228 dy_abs_j_2_3_is_positive
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
   - 228 dx_abs_i_2_5_is_positive >= -228
 dx_abs_i_2_5_abs_le_orig: dx_abs_i_2_5 - dx_diff_i_2_5
   + 228 dx_abs_i_2_5_is_positive <= 228
 dx_abs_i_2_5_abs_ge_neg_orig: dx_abs_i_2_5 + dx_diff_i_2_5
   + 228 dx_abs_i_2_5_is_positive >= 0
 dx_abs_i_2_5_abs_le_neg_orig: dx_abs_i_2_5 + dx_diff_i_2_5
   - 228 dx_abs_i_2_5_is_positive <= 0
 dx_abs_i_2_5_force_positive: dx_diff_i_2_5 - 228 dx_abs_i_2_5_is_positive
   >= -228
 dx_abs_i_2_5_force_negative: dx_diff_i_2_5 - 228 dx_abs_i_2_5_is_positive
   <= 0
 dy_abs_i_2_5_abs_ge_orig: dy_abs_i_2_5 - dy_diff_i_2_5
   - 228 dy_abs_i_2_5_is_positive >= -228
 dy_abs_i_2_5_abs_le_orig: dy_abs_i_2_5 - dy_diff_i_2_5
   + 228 dy_abs_i_2_5_is_positive <= 228
 dy_abs_i_2_5_abs_ge_neg_orig: dy_abs_i_2_5 + dy_diff_i_2_5
   + 228 dy_abs_i_2_5_is_positive >= 0
 dy_abs_i_2_5_abs_le_neg_orig: dy_abs_i_2_5 + dy_diff_i_2_5
   - 228 dy_abs_i_2_5_is_positive <= 0
 dy_abs_i_2_5_force_positive: dy_diff_i_2_5 - 228 dy_abs_i_2_5_is_positive
   >= -228
 dy_abs_i_2_5_force_negative: dy_diff_i_2_5 - 228 dy_abs_i_2_5_is_positive
   <= 0
 dx_abs_j_2_5_abs_ge_orig: dx_abs_j_2_5 - dx_diff_j_2_5
   - 228 dx_abs_j_2_5_is_positive >= -228
 dx_abs_j_2_5_abs_le_orig: dx_abs_j_2_5 - dx_diff_j_2_5
   + 228 dx_abs_j_2_5_is_positive <= 228
 dx_abs_j_2_5_abs_ge_neg_orig: dx_abs_j_2_5 + dx_diff_j_2_5
   + 228 dx_abs_j_2_5_is_positive >= 0
 dx_abs_j_2_5_abs_le_neg_orig: dx_abs_j_2_5 + dx_diff_j_2_5
   - 228 dx_abs_j_2_5_is_positive <= 0
 dx_abs_j_2_5_force_positive: dx_diff_j_2_5 - 228 dx_abs_j_2_5_is_positive
   >= -228
 dx_abs_j_2_5_force_negative: dx_diff_j_2_5 - 228 dx_abs_j_2_5_is_positive
   <= 0
 dy_abs_j_2_5_abs_ge_orig: dy_abs_j_2_5 - dy_diff_j_2_5
   - 228 dy_abs_j_2_5_is_positive >= -228
 dy_abs_j_2_5_abs_le_orig: dy_abs_j_2_5 - dy_diff_j_2_5
   + 228 dy_abs_j_2_5_is_positive <= 228
 dy_abs_j_2_5_abs_ge_neg_orig: dy_abs_j_2_5 + dy_diff_j_2_5
   + 228 dy_abs_j_2_5_is_positive >= 0
 dy_abs_j_2_5_abs_le_neg_orig: dy_abs_j_2_5 + dy_diff_j_2_5
   - 228 dy_abs_j_2_5_is_positive <= 0
 dy_abs_j_2_5_force_positive: dy_diff_j_2_5 - 228 dy_abs_j_2_5_is_positive
   >= -228
 dy_abs_j_2_5_force_negative: dy_diff_j_2_5 - 228 dy_abs_j_2_5_is_positive
   <= 0
 dx_diff_def_i_2_14: EMIB_cx_grid_var_2_14 - cx_grid_var_2 + dx_diff_i_2_14
   = 0
 dx_diff_def_j_2_14: EMIB_cx_grid_var_2_14 - cx_grid_var_14
   + dx_diff_j_2_14 = 0
 dy_diff_def_i_2_14: EMIB_cy_grid_var_2_14 - cy_grid_var_2 + dy_diff_i_2_14
   = 0
 dy_diff_def_j_2_14: EMIB_cy_grid_var_2_14 - cy_grid_var_14
   + dy_diff_j_2_14 = 0
 dx_abs_i_2_14_abs_ge_orig: dx_abs_i_2_14 - dx_diff_i_2_14
   - 228 dx_abs_i_2_14_is_positive >= -228
 dx_abs_i_2_14_abs_le_orig: dx_abs_i_2_14 - dx_diff_i_2_14
   + 228 dx_abs_i_2_14_is_positive <= 228
 dx_abs_i_2_14_abs_ge_neg_orig: dx_abs_i_2_14 + dx_diff_i_2_14
   + 228 dx_abs_i_2_14_is_positive >= 0
 dx_abs_i_2_14_abs_le_neg_orig: dx_abs_i_2_14 + dx_diff_i_2_14
   - 228 dx_abs_i_2_14_is_positive <= 0
 dx_abs_i_2_14_force_positive: dx_diff_i_2_14
   - 228 dx_abs_i_2_14_is_positive >= -228
 dx_abs_i_2_14_force_negative: dx_diff_i_2_14
   - 228 dx_abs_i_2_14_is_positive <= 0
 dy_abs_i_2_14_abs_ge_orig: dy_abs_i_2_14 - dy_diff_i_2_14
   - 228 dy_abs_i_2_14_is_positive >= -228
 dy_abs_i_2_14_abs_le_orig: dy_abs_i_2_14 - dy_diff_i_2_14
   + 228 dy_abs_i_2_14_is_positive <= 228
 dy_abs_i_2_14_abs_ge_neg_orig: dy_abs_i_2_14 + dy_diff_i_2_14
   + 228 dy_abs_i_2_14_is_positive >= 0
 dy_abs_i_2_14_abs_le_neg_orig: dy_abs_i_2_14 + dy_diff_i_2_14
   - 228 dy_abs_i_2_14_is_positive <= 0
 dy_abs_i_2_14_force_positive: dy_diff_i_2_14
   - 228 dy_abs_i_2_14_is_positive >= -228
 dy_abs_i_2_14_force_negative: dy_diff_i_2_14
   - 228 dy_abs_i_2_14_is_positive <= 0
 dx_abs_j_2_14_abs_ge_orig: dx_abs_j_2_14 - dx_diff_j_2_14
   - 228 dx_abs_j_2_14_is_positive >= -228
 dx_abs_j_2_14_abs_le_orig: dx_abs_j_2_14 - dx_diff_j_2_14
   + 228 dx_abs_j_2_14_is_positive <= 228
 dx_abs_j_2_14_abs_ge_neg_orig: dx_abs_j_2_14 + dx_diff_j_2_14
   + 228 dx_abs_j_2_14_is_positive >= 0
 dx_abs_j_2_14_abs_le_neg_orig: dx_abs_j_2_14 + dx_diff_j_2_14
   - 228 dx_abs_j_2_14_is_positive <= 0
 dx_abs_j_2_14_force_positive: dx_diff_j_2_14
   - 228 dx_abs_j_2_14_is_positive >= -228
 dx_abs_j_2_14_force_negative: dx_diff_j_2_14
   - 228 dx_abs_j_2_14_is_positive <= 0
 dy_abs_j_2_14_abs_ge_orig: dy_abs_j_2_14 - dy_diff_j_2_14
   - 228 dy_abs_j_2_14_is_positive >= -228
 dy_abs_j_2_14_abs_le_orig: dy_abs_j_2_14 - dy_diff_j_2_14
   + 228 dy_abs_j_2_14_is_positive <= 228
 dy_abs_j_2_14_abs_ge_neg_orig: dy_abs_j_2_14 + dy_diff_j_2_14
   + 228 dy_abs_j_2_14_is_positive >= 0
 dy_abs_j_2_14_abs_le_neg_orig: dy_abs_j_2_14 + dy_diff_j_2_14
   - 228 dy_abs_j_2_14_is_positive <= 0
 dy_abs_j_2_14_force_positive: dy_diff_j_2_14
   - 228 dy_abs_j_2_14_is_positive >= -228
 dy_abs_j_2_14_force_negative: dy_diff_j_2_14
   - 228 dy_abs_j_2_14_is_positive <= 0
 dx_diff_def_i_3_11: EMIB_cx_grid_var_3_11 - cx_grid_var_3 + dx_diff_i_3_11
   = 0
 dx_diff_def_j_3_11: EMIB_cx_grid_var_3_11 - cx_grid_var_11
   + dx_diff_j_3_11 = 0
 dy_diff_def_i_3_11: EMIB_cy_grid_var_3_11 - cy_grid_var_3 + dy_diff_i_3_11
   = 0
 dy_diff_def_j_3_11: EMIB_cy_grid_var_3_11 - cy_grid_var_11
   + dy_diff_j_3_11 = 0
 dx_abs_i_3_11_abs_ge_orig: dx_abs_i_3_11 - dx_diff_i_3_11
   - 228 dx_abs_i_3_11_is_positive >= -228
 dx_abs_i_3_11_abs_le_orig: dx_abs_i_3_11 - dx_diff_i_3_11
   + 228 dx_abs_i_3_11_is_positive <= 228
 dx_abs_i_3_11_abs_ge_neg_orig: dx_abs_i_3_11 + dx_diff_i_3_11
   + 228 dx_abs_i_3_11_is_positive >= 0
 dx_abs_i_3_11_abs_le_neg_orig: dx_abs_i_3_11 + dx_diff_i_3_11
   - 228 dx_abs_i_3_11_is_positive <= 0
 dx_abs_i_3_11_force_positive: dx_diff_i_3_11
   - 228 dx_abs_i_3_11_is_positive >= -228
 dx_abs_i_3_11_force_negative: dx_diff_i_3_11
   - 228 dx_abs_i_3_11_is_positive <= 0
 dy_abs_i_3_11_abs_ge_orig: dy_abs_i_3_11 - dy_diff_i_3_11
   - 228 dy_abs_i_3_11_is_positive >= -228
 dy_abs_i_3_11_abs_le_orig: dy_abs_i_3_11 - dy_diff_i_3_11
   + 228 dy_abs_i_3_11_is_positive <= 228
 dy_abs_i_3_11_abs_ge_neg_orig: dy_abs_i_3_11 + dy_diff_i_3_11
   + 228 dy_abs_i_3_11_is_positive >= 0
 dy_abs_i_3_11_abs_le_neg_orig: dy_abs_i_3_11 + dy_diff_i_3_11
   - 228 dy_abs_i_3_11_is_positive <= 0
 dy_abs_i_3_11_force_positive: dy_diff_i_3_11
   - 228 dy_abs_i_3_11_is_positive >= -228
 dy_abs_i_3_11_force_negative: dy_diff_i_3_11
   - 228 dy_abs_i_3_11_is_positive <= 0
 dx_abs_j_3_11_abs_ge_orig: dx_abs_j_3_11 - dx_diff_j_3_11
   - 228 dx_abs_j_3_11_is_positive >= -228
 dx_abs_j_3_11_abs_le_orig: dx_abs_j_3_11 - dx_diff_j_3_11
   + 228 dx_abs_j_3_11_is_positive <= 228
 dx_abs_j_3_11_abs_ge_neg_orig: dx_abs_j_3_11 + dx_diff_j_3_11
   + 228 dx_abs_j_3_11_is_positive >= 0
 dx_abs_j_3_11_abs_le_neg_orig: dx_abs_j_3_11 + dx_diff_j_3_11
   - 228 dx_abs_j_3_11_is_positive <= 0
 dx_abs_j_3_11_force_positive: dx_diff_j_3_11
   - 228 dx_abs_j_3_11_is_positive >= -228
 dx_abs_j_3_11_force_negative: dx_diff_j_3_11
   - 228 dx_abs_j_3_11_is_positive <= 0
 dy_abs_j_3_11_abs_ge_orig: dy_abs_j_3_11 - dy_diff_j_3_11
   - 228 dy_abs_j_3_11_is_positive >= -228
 dy_abs_j_3_11_abs_le_orig: dy_abs_j_3_11 - dy_diff_j_3_11
   + 228 dy_abs_j_3_11_is_positive <= 228
 dy_abs_j_3_11_abs_ge_neg_orig: dy_abs_j_3_11 + dy_diff_j_3_11
   + 228 dy_abs_j_3_11_is_positive >= 0
 dy_abs_j_3_11_abs_le_neg_orig: dy_abs_j_3_11 + dy_diff_j_3_11
   - 228 dy_abs_j_3_11_is_positive <= 0
 dy_abs_j_3_11_force_positive: dy_diff_j_3_11
   - 228 dy_abs_j_3_11_is_positive >= -228
 dy_abs_j_3_11_force_negative: dy_diff_j_3_11
   - 228 dy_abs_j_3_11_is_positive <= 0
 dx_diff_def_i_5_7: EMIB_cx_grid_var_5_7 - cx_grid_var_5 + dx_diff_i_5_7
   = 0
 dx_diff_def_j_5_7: EMIB_cx_grid_var_5_7 - cx_grid_var_7 + dx_diff_j_5_7
   = 0
 dy_diff_def_i_5_7: EMIB_cy_grid_var_5_7 - cy_grid_var_5 + dy_diff_i_5_7
   = 0
 dy_diff_def_j_5_7: EMIB_cy_grid_var_5_7 - cy_grid_var_7 + dy_diff_j_5_7
   = 0
 dx_abs_i_5_7_abs_ge_orig: dx_abs_i_5_7 - dx_diff_i_5_7
   - 228 dx_abs_i_5_7_is_positive >= -228
 dx_abs_i_5_7_abs_le_orig: dx_abs_i_5_7 - dx_diff_i_5_7
   + 228 dx_abs_i_5_7_is_positive <= 228
 dx_abs_i_5_7_abs_ge_neg_orig: dx_abs_i_5_7 + dx_diff_i_5_7
   + 228 dx_abs_i_5_7_is_positive >= 0
 dx_abs_i_5_7_abs_le_neg_orig: dx_abs_i_5_7 + dx_diff_i_5_7
   - 228 dx_abs_i_5_7_is_positive <= 0
 dx_abs_i_5_7_force_positive: dx_diff_i_5_7 - 228 dx_abs_i_5_7_is_positive
   >= -228
 dx_abs_i_5_7_force_negative: dx_diff_i_5_7 - 228 dx_abs_i_5_7_is_positive
   <= 0
 dy_abs_i_5_7_abs_ge_orig: dy_abs_i_5_7 - dy_diff_i_5_7
   - 228 dy_abs_i_5_7_is_positive >= -228
 dy_abs_i_5_7_abs_le_orig: dy_abs_i_5_7 - dy_diff_i_5_7
   + 228 dy_abs_i_5_7_is_positive <= 228
 dy_abs_i_5_7_abs_ge_neg_orig: dy_abs_i_5_7 + dy_diff_i_5_7
   + 228 dy_abs_i_5_7_is_positive >= 0
 dy_abs_i_5_7_abs_le_neg_orig: dy_abs_i_5_7 + dy_diff_i_5_7
   - 228 dy_abs_i_5_7_is_positive <= 0
 dy_abs_i_5_7_force_positive: dy_diff_i_5_7 - 228 dy_abs_i_5_7_is_positive
   >= -228
 dy_abs_i_5_7_force_negative: dy_diff_i_5_7 - 228 dy_abs_i_5_7_is_positive
   <= 0
 dx_abs_j_5_7_abs_ge_orig: dx_abs_j_5_7 - dx_diff_j_5_7
   - 228 dx_abs_j_5_7_is_positive >= -228
 dx_abs_j_5_7_abs_le_orig: dx_abs_j_5_7 - dx_diff_j_5_7
   + 228 dx_abs_j_5_7_is_positive <= 228
 dx_abs_j_5_7_abs_ge_neg_orig: dx_abs_j_5_7 + dx_diff_j_5_7
   + 228 dx_abs_j_5_7_is_positive >= 0
 dx_abs_j_5_7_abs_le_neg_orig: dx_abs_j_5_7 + dx_diff_j_5_7
   - 228 dx_abs_j_5_7_is_positive <= 0
 dx_abs_j_5_7_force_positive: dx_diff_j_5_7 - 228 dx_abs_j_5_7_is_positive
   >= -228
 dx_abs_j_5_7_force_negative: dx_diff_j_5_7 - 228 dx_abs_j_5_7_is_positive
   <= 0
 dy_abs_j_5_7_abs_ge_orig: dy_abs_j_5_7 - dy_diff_j_5_7
   - 228 dy_abs_j_5_7_is_positive >= -228
 dy_abs_j_5_7_abs_le_orig: dy_abs_j_5_7 - dy_diff_j_5_7
   + 228 dy_abs_j_5_7_is_positive <= 228
 dy_abs_j_5_7_abs_ge_neg_orig: dy_abs_j_5_7 + dy_diff_j_5_7
   + 228 dy_abs_j_5_7_is_positive >= 0
 dy_abs_j_5_7_abs_le_neg_orig: dy_abs_j_5_7 + dy_diff_j_5_7
   - 228 dy_abs_j_5_7_is_positive <= 0
 dy_abs_j_5_7_force_positive: dy_diff_j_5_7 - 228 dy_abs_j_5_7_is_positive
   >= -228
 dy_abs_j_5_7_force_negative: dy_diff_j_5_7 - 228 dy_abs_j_5_7_is_positive
   <= 0
 dx_diff_def_i_5_9: EMIB_cx_grid_var_5_9 - cx_grid_var_5 + dx_diff_i_5_9
   = 0
 dx_diff_def_j_5_9: EMIB_cx_grid_var_5_9 - cx_grid_var_9 + dx_diff_j_5_9
   = 0
 dy_diff_def_i_5_9: EMIB_cy_grid_var_5_9 - cy_grid_var_5 + dy_diff_i_5_9
   = 0
 dy_diff_def_j_5_9: EMIB_cy_grid_var_5_9 - cy_grid_var_9 + dy_diff_j_5_9
   = 0
 dx_abs_i_5_9_abs_ge_orig: dx_abs_i_5_9 - dx_diff_i_5_9
   - 228 dx_abs_i_5_9_is_positive >= -228
 dx_abs_i_5_9_abs_le_orig: dx_abs_i_5_9 - dx_diff_i_5_9
   + 228 dx_abs_i_5_9_is_positive <= 228
 dx_abs_i_5_9_abs_ge_neg_orig: dx_abs_i_5_9 + dx_diff_i_5_9
   + 228 dx_abs_i_5_9_is_positive >= 0
 dx_abs_i_5_9_abs_le_neg_orig: dx_abs_i_5_9 + dx_diff_i_5_9
   - 228 dx_abs_i_5_9_is_positive <= 0
 dx_abs_i_5_9_force_positive: dx_diff_i_5_9 - 228 dx_abs_i_5_9_is_positive
   >= -228
 dx_abs_i_5_9_force_negative: dx_diff_i_5_9 - 228 dx_abs_i_5_9_is_positive
   <= 0
 dy_abs_i_5_9_abs_ge_orig: dy_abs_i_5_9 - dy_diff_i_5_9
   - 228 dy_abs_i_5_9_is_positive >= -228
 dy_abs_i_5_9_abs_le_orig: dy_abs_i_5_9 - dy_diff_i_5_9
   + 228 dy_abs_i_5_9_is_positive <= 228
 dy_abs_i_5_9_abs_ge_neg_orig: dy_abs_i_5_9 + dy_diff_i_5_9
   + 228 dy_abs_i_5_9_is_positive >= 0
 dy_abs_i_5_9_abs_le_neg_orig: dy_abs_i_5_9 + dy_diff_i_5_9
   - 228 dy_abs_i_5_9_is_positive <= 0
 dy_abs_i_5_9_force_positive: dy_diff_i_5_9 - 228 dy_abs_i_5_9_is_positive
   >= -228
 dy_abs_i_5_9_force_negative: dy_diff_i_5_9 - 228 dy_abs_i_5_9_is_positive
   <= 0
 dx_abs_j_5_9_abs_ge_orig: dx_abs_j_5_9 - dx_diff_j_5_9
   - 228 dx_abs_j_5_9_is_positive >= -228
 dx_abs_j_5_9_abs_le_orig: dx_abs_j_5_9 - dx_diff_j_5_9
   + 228 dx_abs_j_5_9_is_positive <= 228
 dx_abs_j_5_9_abs_ge_neg_orig: dx_abs_j_5_9 + dx_diff_j_5_9
   + 228 dx_abs_j_5_9_is_positive >= 0
 dx_abs_j_5_9_abs_le_neg_orig: dx_abs_j_5_9 + dx_diff_j_5_9
   - 228 dx_abs_j_5_9_is_positive <= 0
 dx_abs_j_5_9_force_positive: dx_diff_j_5_9 - 228 dx_abs_j_5_9_is_positive
   >= -228
 dx_abs_j_5_9_force_negative: dx_diff_j_5_9 - 228 dx_abs_j_5_9_is_positive
   <= 0
 dy_abs_j_5_9_abs_ge_orig: dy_abs_j_5_9 - dy_diff_j_5_9
   - 228 dy_abs_j_5_9_is_positive >= -228
 dy_abs_j_5_9_abs_le_orig: dy_abs_j_5_9 - dy_diff_j_5_9
   + 228 dy_abs_j_5_9_is_positive <= 228
 dy_abs_j_5_9_abs_ge_neg_orig: dy_abs_j_5_9 + dy_diff_j_5_9
   + 228 dy_abs_j_5_9_is_positive >= 0
 dy_abs_j_5_9_abs_le_neg_orig: dy_abs_j_5_9 + dy_diff_j_5_9
   - 228 dy_abs_j_5_9_is_positive <= 0
 dy_abs_j_5_9_force_positive: dy_diff_j_5_9 - 228 dy_abs_j_5_9_is_positive
   >= -228
 dy_abs_j_5_9_force_negative: dy_diff_j_5_9 - 228 dy_abs_j_5_9_is_positive
   <= 0
 dx_diff_def_i_5_11: EMIB_cx_grid_var_5_11 - cx_grid_var_5 + dx_diff_i_5_11
   = 0
 dx_diff_def_j_5_11: EMIB_cx_grid_var_5_11 - cx_grid_var_11
   + dx_diff_j_5_11 = 0
 dy_diff_def_i_5_11: EMIB_cy_grid_var_5_11 - cy_grid_var_5 + dy_diff_i_5_11
   = 0
 dy_diff_def_j_5_11: EMIB_cy_grid_var_5_11 - cy_grid_var_11
   + dy_diff_j_5_11 = 0
 dx_abs_i_5_11_abs_ge_orig: dx_abs_i_5_11 - dx_diff_i_5_11
   - 228 dx_abs_i_5_11_is_positive >= -228
 dx_abs_i_5_11_abs_le_orig: dx_abs_i_5_11 - dx_diff_i_5_11
   + 228 dx_abs_i_5_11_is_positive <= 228
 dx_abs_i_5_11_abs_ge_neg_orig: dx_abs_i_5_11 + dx_diff_i_5_11
   + 228 dx_abs_i_5_11_is_positive >= 0
 dx_abs_i_5_11_abs_le_neg_orig: dx_abs_i_5_11 + dx_diff_i_5_11
   - 228 dx_abs_i_5_11_is_positive <= 0
 dx_abs_i_5_11_force_positive: dx_diff_i_5_11
   - 228 dx_abs_i_5_11_is_positive >= -228
 dx_abs_i_5_11_force_negative: dx_diff_i_5_11
   - 228 dx_abs_i_5_11_is_positive <= 0
 dy_abs_i_5_11_abs_ge_orig: dy_abs_i_5_11 - dy_diff_i_5_11
   - 228 dy_abs_i_5_11_is_positive >= -228
 dy_abs_i_5_11_abs_le_orig: dy_abs_i_5_11 - dy_diff_i_5_11
   + 228 dy_abs_i_5_11_is_positive <= 228
 dy_abs_i_5_11_abs_ge_neg_orig: dy_abs_i_5_11 + dy_diff_i_5_11
   + 228 dy_abs_i_5_11_is_positive >= 0
 dy_abs_i_5_11_abs_le_neg_orig: dy_abs_i_5_11 + dy_diff_i_5_11
   - 228 dy_abs_i_5_11_is_positive <= 0
 dy_abs_i_5_11_force_positive: dy_diff_i_5_11
   - 228 dy_abs_i_5_11_is_positive >= -228
 dy_abs_i_5_11_force_negative: dy_diff_i_5_11
   - 228 dy_abs_i_5_11_is_positive <= 0
 dx_abs_j_5_11_abs_ge_orig: dx_abs_j_5_11 - dx_diff_j_5_11
   - 228 dx_abs_j_5_11_is_positive >= -228
 dx_abs_j_5_11_abs_le_orig: dx_abs_j_5_11 - dx_diff_j_5_11
   + 228 dx_abs_j_5_11_is_positive <= 228
 dx_abs_j_5_11_abs_ge_neg_orig: dx_abs_j_5_11 + dx_diff_j_5_11
   + 228 dx_abs_j_5_11_is_positive >= 0
 dx_abs_j_5_11_abs_le_neg_orig: dx_abs_j_5_11 + dx_diff_j_5_11
   - 228 dx_abs_j_5_11_is_positive <= 0
 dx_abs_j_5_11_force_positive: dx_diff_j_5_11
   - 228 dx_abs_j_5_11_is_positive >= -228
 dx_abs_j_5_11_force_negative: dx_diff_j_5_11
   - 228 dx_abs_j_5_11_is_positive <= 0
 dy_abs_j_5_11_abs_ge_orig: dy_abs_j_5_11 - dy_diff_j_5_11
   - 228 dy_abs_j_5_11_is_positive >= -228
 dy_abs_j_5_11_abs_le_orig: dy_abs_j_5_11 - dy_diff_j_5_11
   + 228 dy_abs_j_5_11_is_positive <= 228
 dy_abs_j_5_11_abs_ge_neg_orig: dy_abs_j_5_11 + dy_diff_j_5_11
   + 228 dy_abs_j_5_11_is_positive >= 0
 dy_abs_j_5_11_abs_le_neg_orig: dy_abs_j_5_11 + dy_diff_j_5_11
   - 228 dy_abs_j_5_11_is_positive <= 0
 dy_abs_j_5_11_force_positive: dy_diff_j_5_11
   - 228 dy_abs_j_5_11_is_positive >= -228
 dy_abs_j_5_11_force_negative: dy_diff_j_5_11
   - 228 dy_abs_j_5_11_is_positive <= 0
 dx_diff_def_i_5_12: EMIB_cx_grid_var_5_12 - cx_grid_var_5 + dx_diff_i_5_12
   = 0
 dx_diff_def_j_5_12: EMIB_cx_grid_var_5_12 - cx_grid_var_12
   + dx_diff_j_5_12 = 0
 dy_diff_def_i_5_12: EMIB_cy_grid_var_5_12 - cy_grid_var_5 + dy_diff_i_5_12
   = 0
 dy_diff_def_j_5_12: EMIB_cy_grid_var_5_12 - cy_grid_var_12
   + dy_diff_j_5_12 = 0
 dx_abs_i_5_12_abs_ge_orig: dx_abs_i_5_12 - dx_diff_i_5_12
   - 228 dx_abs_i_5_12_is_positive >= -228
 dx_abs_i_5_12_abs_le_orig: dx_abs_i_5_12 - dx_diff_i_5_12
   + 228 dx_abs_i_5_12_is_positive <= 228
 dx_abs_i_5_12_abs_ge_neg_orig: dx_abs_i_5_12 + dx_diff_i_5_12
   + 228 dx_abs_i_5_12_is_positive >= 0
 dx_abs_i_5_12_abs_le_neg_orig: dx_abs_i_5_12 + dx_diff_i_5_12
   - 228 dx_abs_i_5_12_is_positive <= 0
 dx_abs_i_5_12_force_positive: dx_diff_i_5_12
   - 228 dx_abs_i_5_12_is_positive >= -228
 dx_abs_i_5_12_force_negative: dx_diff_i_5_12
   - 228 dx_abs_i_5_12_is_positive <= 0
 dy_abs_i_5_12_abs_ge_orig: dy_abs_i_5_12 - dy_diff_i_5_12
   - 228 dy_abs_i_5_12_is_positive >= -228
 dy_abs_i_5_12_abs_le_orig: dy_abs_i_5_12 - dy_diff_i_5_12
   + 228 dy_abs_i_5_12_is_positive <= 228
 dy_abs_i_5_12_abs_ge_neg_orig: dy_abs_i_5_12 + dy_diff_i_5_12
   + 228 dy_abs_i_5_12_is_positive >= 0
 dy_abs_i_5_12_abs_le_neg_orig: dy_abs_i_5_12 + dy_diff_i_5_12
   - 228 dy_abs_i_5_12_is_positive <= 0
 dy_abs_i_5_12_force_positive: dy_diff_i_5_12
   - 228 dy_abs_i_5_12_is_positive >= -228
 dy_abs_i_5_12_force_negative: dy_diff_i_5_12
   - 228 dy_abs_i_5_12_is_positive <= 0
 dx_abs_j_5_12_abs_ge_orig: dx_abs_j_5_12 - dx_diff_j_5_12
   - 228 dx_abs_j_5_12_is_positive >= -228
 dx_abs_j_5_12_abs_le_orig: dx_abs_j_5_12 - dx_diff_j_5_12
   + 228 dx_abs_j_5_12_is_positive <= 228
 dx_abs_j_5_12_abs_ge_neg_orig: dx_abs_j_5_12 + dx_diff_j_5_12
   + 228 dx_abs_j_5_12_is_positive >= 0
 dx_abs_j_5_12_abs_le_neg_orig: dx_abs_j_5_12 + dx_diff_j_5_12
   - 228 dx_abs_j_5_12_is_positive <= 0
 dx_abs_j_5_12_force_positive: dx_diff_j_5_12
   - 228 dx_abs_j_5_12_is_positive >= -228
 dx_abs_j_5_12_force_negative: dx_diff_j_5_12
   - 228 dx_abs_j_5_12_is_positive <= 0
 dy_abs_j_5_12_abs_ge_orig: dy_abs_j_5_12 - dy_diff_j_5_12
   - 228 dy_abs_j_5_12_is_positive >= -228
 dy_abs_j_5_12_abs_le_orig: dy_abs_j_5_12 - dy_diff_j_5_12
   + 228 dy_abs_j_5_12_is_positive <= 228
 dy_abs_j_5_12_abs_ge_neg_orig: dy_abs_j_5_12 + dy_diff_j_5_12
   + 228 dy_abs_j_5_12_is_positive >= 0
 dy_abs_j_5_12_abs_le_neg_orig: dy_abs_j_5_12 + dy_diff_j_5_12
   - 228 dy_abs_j_5_12_is_positive <= 0
 dy_abs_j_5_12_force_positive: dy_diff_j_5_12
   - 228 dy_abs_j_5_12_is_positive >= -228
 dy_abs_j_5_12_force_negative: dy_diff_j_5_12
   - 228 dy_abs_j_5_12_is_positive <= 0
 dx_diff_def_i_5_14: EMIB_cx_grid_var_5_14 - cx_grid_var_5 + dx_diff_i_5_14
   = 0
 dx_diff_def_j_5_14: EMIB_cx_grid_var_5_14 - cx_grid_var_14
   + dx_diff_j_5_14 = 0
 dy_diff_def_i_5_14: EMIB_cy_grid_var_5_14 - cy_grid_var_5 + dy_diff_i_5_14
   = 0
 dy_diff_def_j_5_14: EMIB_cy_grid_var_5_14 - cy_grid_var_14
   + dy_diff_j_5_14 = 0
 dx_abs_i_5_14_abs_ge_orig: dx_abs_i_5_14 - dx_diff_i_5_14
   - 228 dx_abs_i_5_14_is_positive >= -228
 dx_abs_i_5_14_abs_le_orig: dx_abs_i_5_14 - dx_diff_i_5_14
   + 228 dx_abs_i_5_14_is_positive <= 228
 dx_abs_i_5_14_abs_ge_neg_orig: dx_abs_i_5_14 + dx_diff_i_5_14
   + 228 dx_abs_i_5_14_is_positive >= 0
 dx_abs_i_5_14_abs_le_neg_orig: dx_abs_i_5_14 + dx_diff_i_5_14
   - 228 dx_abs_i_5_14_is_positive <= 0
 dx_abs_i_5_14_force_positive: dx_diff_i_5_14
   - 228 dx_abs_i_5_14_is_positive >= -228
 dx_abs_i_5_14_force_negative: dx_diff_i_5_14
   - 228 dx_abs_i_5_14_is_positive <= 0
 dy_abs_i_5_14_abs_ge_orig: dy_abs_i_5_14 - dy_diff_i_5_14
   - 228 dy_abs_i_5_14_is_positive >= -228
 dy_abs_i_5_14_abs_le_orig: dy_abs_i_5_14 - dy_diff_i_5_14
   + 228 dy_abs_i_5_14_is_positive <= 228
 dy_abs_i_5_14_abs_ge_neg_orig: dy_abs_i_5_14 + dy_diff_i_5_14
   + 228 dy_abs_i_5_14_is_positive >= 0
 dy_abs_i_5_14_abs_le_neg_orig: dy_abs_i_5_14 + dy_diff_i_5_14
   - 228 dy_abs_i_5_14_is_positive <= 0
 dy_abs_i_5_14_force_positive: dy_diff_i_5_14
   - 228 dy_abs_i_5_14_is_positive >= -228
 dy_abs_i_5_14_force_negative: dy_diff_i_5_14
   - 228 dy_abs_i_5_14_is_positive <= 0
 dx_abs_j_5_14_abs_ge_orig: dx_abs_j_5_14 - dx_diff_j_5_14
   - 228 dx_abs_j_5_14_is_positive >= -228
 dx_abs_j_5_14_abs_le_orig: dx_abs_j_5_14 - dx_diff_j_5_14
   + 228 dx_abs_j_5_14_is_positive <= 228
 dx_abs_j_5_14_abs_ge_neg_orig: dx_abs_j_5_14 + dx_diff_j_5_14
   + 228 dx_abs_j_5_14_is_positive >= 0
 dx_abs_j_5_14_abs_le_neg_orig: dx_abs_j_5_14 + dx_diff_j_5_14
   - 228 dx_abs_j_5_14_is_positive <= 0
 dx_abs_j_5_14_force_positive: dx_diff_j_5_14
   - 228 dx_abs_j_5_14_is_positive >= -228
 dx_abs_j_5_14_force_negative: dx_diff_j_5_14
   - 228 dx_abs_j_5_14_is_positive <= 0
 dy_abs_j_5_14_abs_ge_orig: dy_abs_j_5_14 - dy_diff_j_5_14
   - 228 dy_abs_j_5_14_is_positive >= -228
 dy_abs_j_5_14_abs_le_orig: dy_abs_j_5_14 - dy_diff_j_5_14
   + 228 dy_abs_j_5_14_is_positive <= 228
 dy_abs_j_5_14_abs_ge_neg_orig: dy_abs_j_5_14 + dy_diff_j_5_14
   + 228 dy_abs_j_5_14_is_positive >= 0
 dy_abs_j_5_14_abs_le_neg_orig: dy_abs_j_5_14 + dy_diff_j_5_14
   - 228 dy_abs_j_5_14_is_positive <= 0
 dy_abs_j_5_14_force_positive: dy_diff_j_5_14
   - 228 dy_abs_j_5_14_is_positive >= -228
 dy_abs_j_5_14_force_negative: dy_diff_j_5_14
   - 228 dy_abs_j_5_14_is_positive <= 0
 dx_diff_def_i_6_12: EMIB_cx_grid_var_6_12 - cx_grid_var_6 + dx_diff_i_6_12
   = 0
 dx_diff_def_j_6_12: EMIB_cx_grid_var_6_12 - cx_grid_var_12
   + dx_diff_j_6_12 = 0
 dy_diff_def_i_6_12: EMIB_cy_grid_var_6_12 - cy_grid_var_6 + dy_diff_i_6_12
   = 0
 dy_diff_def_j_6_12: EMIB_cy_grid_var_6_12 - cy_grid_var_12
   + dy_diff_j_6_12 = 0
 dx_abs_i_6_12_abs_ge_orig: dx_abs_i_6_12 - dx_diff_i_6_12
   - 228 dx_abs_i_6_12_is_positive >= -228
 dx_abs_i_6_12_abs_le_orig: dx_abs_i_6_12 - dx_diff_i_6_12
   + 228 dx_abs_i_6_12_is_positive <= 228
 dx_abs_i_6_12_abs_ge_neg_orig: dx_abs_i_6_12 + dx_diff_i_6_12
   + 228 dx_abs_i_6_12_is_positive >= 0
 dx_abs_i_6_12_abs_le_neg_orig: dx_abs_i_6_12 + dx_diff_i_6_12
   - 228 dx_abs_i_6_12_is_positive <= 0
 dx_abs_i_6_12_force_positive: dx_diff_i_6_12
   - 228 dx_abs_i_6_12_is_positive >= -228
 dx_abs_i_6_12_force_negative: dx_diff_i_6_12
   - 228 dx_abs_i_6_12_is_positive <= 0
 dy_abs_i_6_12_abs_ge_orig: dy_abs_i_6_12 - dy_diff_i_6_12
   - 228 dy_abs_i_6_12_is_positive >= -228
 dy_abs_i_6_12_abs_le_orig: dy_abs_i_6_12 - dy_diff_i_6_12
   + 228 dy_abs_i_6_12_is_positive <= 228
 dy_abs_i_6_12_abs_ge_neg_orig: dy_abs_i_6_12 + dy_diff_i_6_12
   + 228 dy_abs_i_6_12_is_positive >= 0
 dy_abs_i_6_12_abs_le_neg_orig: dy_abs_i_6_12 + dy_diff_i_6_12
   - 228 dy_abs_i_6_12_is_positive <= 0
 dy_abs_i_6_12_force_positive: dy_diff_i_6_12
   - 228 dy_abs_i_6_12_is_positive >= -228
 dy_abs_i_6_12_force_negative: dy_diff_i_6_12
   - 228 dy_abs_i_6_12_is_positive <= 0
 dx_abs_j_6_12_abs_ge_orig: dx_abs_j_6_12 - dx_diff_j_6_12
   - 228 dx_abs_j_6_12_is_positive >= -228
 dx_abs_j_6_12_abs_le_orig: dx_abs_j_6_12 - dx_diff_j_6_12
   + 228 dx_abs_j_6_12_is_positive <= 228
 dx_abs_j_6_12_abs_ge_neg_orig: dx_abs_j_6_12 + dx_diff_j_6_12
   + 228 dx_abs_j_6_12_is_positive >= 0
 dx_abs_j_6_12_abs_le_neg_orig: dx_abs_j_6_12 + dx_diff_j_6_12
   - 228 dx_abs_j_6_12_is_positive <= 0
 dx_abs_j_6_12_force_positive: dx_diff_j_6_12
   - 228 dx_abs_j_6_12_is_positive >= -228
 dx_abs_j_6_12_force_negative: dx_diff_j_6_12
   - 228 dx_abs_j_6_12_is_positive <= 0
 dy_abs_j_6_12_abs_ge_orig: dy_abs_j_6_12 - dy_diff_j_6_12
   - 228 dy_abs_j_6_12_is_positive >= -228
 dy_abs_j_6_12_abs_le_orig: dy_abs_j_6_12 - dy_diff_j_6_12
   + 228 dy_abs_j_6_12_is_positive <= 228
 dy_abs_j_6_12_abs_ge_neg_orig: dy_abs_j_6_12 + dy_diff_j_6_12
   + 228 dy_abs_j_6_12_is_positive >= 0
 dy_abs_j_6_12_abs_le_neg_orig: dy_abs_j_6_12 + dy_diff_j_6_12
   - 228 dy_abs_j_6_12_is_positive <= 0
 dy_abs_j_6_12_force_positive: dy_diff_j_6_12
   - 228 dy_abs_j_6_12_is_positive >= -228
 dy_abs_j_6_12_force_negative: dy_diff_j_6_12
   - 228 dy_abs_j_6_12_is_positive <= 0
 dx_diff_def_i_7_13: EMIB_cx_grid_var_7_13 - cx_grid_var_7 + dx_diff_i_7_13
   = 0
 dx_diff_def_j_7_13: EMIB_cx_grid_var_7_13 - cx_grid_var_13
   + dx_diff_j_7_13 = 0
 dy_diff_def_i_7_13: EMIB_cy_grid_var_7_13 - cy_grid_var_7 + dy_diff_i_7_13
   = 0
 dy_diff_def_j_7_13: EMIB_cy_grid_var_7_13 - cy_grid_var_13
   + dy_diff_j_7_13 = 0
 dx_abs_i_7_13_abs_ge_orig: dx_abs_i_7_13 - dx_diff_i_7_13
   - 228 dx_abs_i_7_13_is_positive >= -228
 dx_abs_i_7_13_abs_le_orig: dx_abs_i_7_13 - dx_diff_i_7_13
   + 228 dx_abs_i_7_13_is_positive <= 228
 dx_abs_i_7_13_abs_ge_neg_orig: dx_abs_i_7_13 + dx_diff_i_7_13
   + 228 dx_abs_i_7_13_is_positive >= 0
 dx_abs_i_7_13_abs_le_neg_orig: dx_abs_i_7_13 + dx_diff_i_7_13
   - 228 dx_abs_i_7_13_is_positive <= 0
 dx_abs_i_7_13_force_positive: dx_diff_i_7_13
   - 228 dx_abs_i_7_13_is_positive >= -228
 dx_abs_i_7_13_force_negative: dx_diff_i_7_13
   - 228 dx_abs_i_7_13_is_positive <= 0
 dy_abs_i_7_13_abs_ge_orig: dy_abs_i_7_13 - dy_diff_i_7_13
   - 228 dy_abs_i_7_13_is_positive >= -228
 dy_abs_i_7_13_abs_le_orig: dy_abs_i_7_13 - dy_diff_i_7_13
   + 228 dy_abs_i_7_13_is_positive <= 228
 dy_abs_i_7_13_abs_ge_neg_orig: dy_abs_i_7_13 + dy_diff_i_7_13
   + 228 dy_abs_i_7_13_is_positive >= 0
 dy_abs_i_7_13_abs_le_neg_orig: dy_abs_i_7_13 + dy_diff_i_7_13
   - 228 dy_abs_i_7_13_is_positive <= 0
 dy_abs_i_7_13_force_positive: dy_diff_i_7_13
   - 228 dy_abs_i_7_13_is_positive >= -228
 dy_abs_i_7_13_force_negative: dy_diff_i_7_13
   - 228 dy_abs_i_7_13_is_positive <= 0
 dx_abs_j_7_13_abs_ge_orig: dx_abs_j_7_13 - dx_diff_j_7_13
   - 228 dx_abs_j_7_13_is_positive >= -228
 dx_abs_j_7_13_abs_le_orig: dx_abs_j_7_13 - dx_diff_j_7_13
   + 228 dx_abs_j_7_13_is_positive <= 228
 dx_abs_j_7_13_abs_ge_neg_orig: dx_abs_j_7_13 + dx_diff_j_7_13
   + 228 dx_abs_j_7_13_is_positive >= 0
 dx_abs_j_7_13_abs_le_neg_orig: dx_abs_j_7_13 + dx_diff_j_7_13
   - 228 dx_abs_j_7_13_is_positive <= 0
 dx_abs_j_7_13_force_positive: dx_diff_j_7_13
   - 228 dx_abs_j_7_13_is_positive >= -228
 dx_abs_j_7_13_force_negative: dx_diff_j_7_13
   - 228 dx_abs_j_7_13_is_positive <= 0
 dy_abs_j_7_13_abs_ge_orig: dy_abs_j_7_13 - dy_diff_j_7_13
   - 228 dy_abs_j_7_13_is_positive >= -228
 dy_abs_j_7_13_abs_le_orig: dy_abs_j_7_13 - dy_diff_j_7_13
   + 228 dy_abs_j_7_13_is_positive <= 228
 dy_abs_j_7_13_abs_ge_neg_orig: dy_abs_j_7_13 + dy_diff_j_7_13
   + 228 dy_abs_j_7_13_is_positive >= 0
 dy_abs_j_7_13_abs_le_neg_orig: dy_abs_j_7_13 + dy_diff_j_7_13
   - 228 dy_abs_j_7_13_is_positive <= 0
 dy_abs_j_7_13_force_positive: dy_diff_j_7_13
   - 228 dy_abs_j_7_13_is_positive >= -228
 dy_abs_j_7_13_force_negative: dy_diff_j_7_13
   - 228 dy_abs_j_7_13_is_positive <= 0
 dx_diff_def_i_7_14: EMIB_cx_grid_var_7_14 - cx_grid_var_7 + dx_diff_i_7_14
   = 0
 dx_diff_def_j_7_14: EMIB_cx_grid_var_7_14 - cx_grid_var_14
   + dx_diff_j_7_14 = 0
 dy_diff_def_i_7_14: EMIB_cy_grid_var_7_14 - cy_grid_var_7 + dy_diff_i_7_14
   = 0
 dy_diff_def_j_7_14: EMIB_cy_grid_var_7_14 - cy_grid_var_14
   + dy_diff_j_7_14 = 0
 dx_abs_i_7_14_abs_ge_orig: dx_abs_i_7_14 - dx_diff_i_7_14
   - 228 dx_abs_i_7_14_is_positive >= -228
 dx_abs_i_7_14_abs_le_orig: dx_abs_i_7_14 - dx_diff_i_7_14
   + 228 dx_abs_i_7_14_is_positive <= 228
 dx_abs_i_7_14_abs_ge_neg_orig: dx_abs_i_7_14 + dx_diff_i_7_14
   + 228 dx_abs_i_7_14_is_positive >= 0
 dx_abs_i_7_14_abs_le_neg_orig: dx_abs_i_7_14 + dx_diff_i_7_14
   - 228 dx_abs_i_7_14_is_positive <= 0
 dx_abs_i_7_14_force_positive: dx_diff_i_7_14
   - 228 dx_abs_i_7_14_is_positive >= -228
 dx_abs_i_7_14_force_negative: dx_diff_i_7_14
   - 228 dx_abs_i_7_14_is_positive <= 0
 dy_abs_i_7_14_abs_ge_orig: dy_abs_i_7_14 - dy_diff_i_7_14
   - 228 dy_abs_i_7_14_is_positive >= -228
 dy_abs_i_7_14_abs_le_orig: dy_abs_i_7_14 - dy_diff_i_7_14
   + 228 dy_abs_i_7_14_is_positive <= 228
 dy_abs_i_7_14_abs_ge_neg_orig: dy_abs_i_7_14 + dy_diff_i_7_14
   + 228 dy_abs_i_7_14_is_positive >= 0
 dy_abs_i_7_14_abs_le_neg_orig: dy_abs_i_7_14 + dy_diff_i_7_14
   - 228 dy_abs_i_7_14_is_positive <= 0
 dy_abs_i_7_14_force_positive: dy_diff_i_7_14
   - 228 dy_abs_i_7_14_is_positive >= -228
 dy_abs_i_7_14_force_negative: dy_diff_i_7_14
   - 228 dy_abs_i_7_14_is_positive <= 0
 dx_abs_j_7_14_abs_ge_orig: dx_abs_j_7_14 - dx_diff_j_7_14
   - 228 dx_abs_j_7_14_is_positive >= -228
 dx_abs_j_7_14_abs_le_orig: dx_abs_j_7_14 - dx_diff_j_7_14
   + 228 dx_abs_j_7_14_is_positive <= 228
 dx_abs_j_7_14_abs_ge_neg_orig: dx_abs_j_7_14 + dx_diff_j_7_14
   + 228 dx_abs_j_7_14_is_positive >= 0
 dx_abs_j_7_14_abs_le_neg_orig: dx_abs_j_7_14 + dx_diff_j_7_14
   - 228 dx_abs_j_7_14_is_positive <= 0
 dx_abs_j_7_14_force_positive: dx_diff_j_7_14
   - 228 dx_abs_j_7_14_is_positive >= -228
 dx_abs_j_7_14_force_negative: dx_diff_j_7_14
   - 228 dx_abs_j_7_14_is_positive <= 0
 dy_abs_j_7_14_abs_ge_orig: dy_abs_j_7_14 - dy_diff_j_7_14
   - 228 dy_abs_j_7_14_is_positive >= -228
 dy_abs_j_7_14_abs_le_orig: dy_abs_j_7_14 - dy_diff_j_7_14
   + 228 dy_abs_j_7_14_is_positive <= 228
 dy_abs_j_7_14_abs_ge_neg_orig: dy_abs_j_7_14 + dy_diff_j_7_14
   + 228 dy_abs_j_7_14_is_positive >= 0
 dy_abs_j_7_14_abs_le_neg_orig: dy_abs_j_7_14 + dy_diff_j_7_14
   - 228 dy_abs_j_7_14_is_positive <= 0
 dy_abs_j_7_14_force_positive: dy_diff_j_7_14
   - 228 dy_abs_j_7_14_is_positive >= -228
 dy_abs_j_7_14_force_negative: dy_diff_j_7_14
   - 228 dy_abs_j_7_14_is_positive <= 0
 dx_diff_def_i_9_14: EMIB_cx_grid_var_9_14 - cx_grid_var_9 + dx_diff_i_9_14
   = 0
 dx_diff_def_j_9_14: EMIB_cx_grid_var_9_14 - cx_grid_var_14
   + dx_diff_j_9_14 = 0
 dy_diff_def_i_9_14: EMIB_cy_grid_var_9_14 - cy_grid_var_9 + dy_diff_i_9_14
   = 0
 dy_diff_def_j_9_14: EMIB_cy_grid_var_9_14 - cy_grid_var_14
   + dy_diff_j_9_14 = 0
 dx_abs_i_9_14_abs_ge_orig: dx_abs_i_9_14 - dx_diff_i_9_14
   - 228 dx_abs_i_9_14_is_positive >= -228
 dx_abs_i_9_14_abs_le_orig: dx_abs_i_9_14 - dx_diff_i_9_14
   + 228 dx_abs_i_9_14_is_positive <= 228
 dx_abs_i_9_14_abs_ge_neg_orig: dx_abs_i_9_14 + dx_diff_i_9_14
   + 228 dx_abs_i_9_14_is_positive >= 0
 dx_abs_i_9_14_abs_le_neg_orig: dx_abs_i_9_14 + dx_diff_i_9_14
   - 228 dx_abs_i_9_14_is_positive <= 0
 dx_abs_i_9_14_force_positive: dx_diff_i_9_14
   - 228 dx_abs_i_9_14_is_positive >= -228
 dx_abs_i_9_14_force_negative: dx_diff_i_9_14
   - 228 dx_abs_i_9_14_is_positive <= 0
 dy_abs_i_9_14_abs_ge_orig: dy_abs_i_9_14 - dy_diff_i_9_14
   - 228 dy_abs_i_9_14_is_positive >= -228
 dy_abs_i_9_14_abs_le_orig: dy_abs_i_9_14 - dy_diff_i_9_14
   + 228 dy_abs_i_9_14_is_positive <= 228
 dy_abs_i_9_14_abs_ge_neg_orig: dy_abs_i_9_14 + dy_diff_i_9_14
   + 228 dy_abs_i_9_14_is_positive >= 0
 dy_abs_i_9_14_abs_le_neg_orig: dy_abs_i_9_14 + dy_diff_i_9_14
   - 228 dy_abs_i_9_14_is_positive <= 0
 dy_abs_i_9_14_force_positive: dy_diff_i_9_14
   - 228 dy_abs_i_9_14_is_positive >= -228
 dy_abs_i_9_14_force_negative: dy_diff_i_9_14
   - 228 dy_abs_i_9_14_is_positive <= 0
 dx_abs_j_9_14_abs_ge_orig: dx_abs_j_9_14 - dx_diff_j_9_14
   - 228 dx_abs_j_9_14_is_positive >= -228
 dx_abs_j_9_14_abs_le_orig: dx_abs_j_9_14 - dx_diff_j_9_14
   + 228 dx_abs_j_9_14_is_positive <= 228
 dx_abs_j_9_14_abs_ge_neg_orig: dx_abs_j_9_14 + dx_diff_j_9_14
   + 228 dx_abs_j_9_14_is_positive >= 0
 dx_abs_j_9_14_abs_le_neg_orig: dx_abs_j_9_14 + dx_diff_j_9_14
   - 228 dx_abs_j_9_14_is_positive <= 0
 dx_abs_j_9_14_force_positive: dx_diff_j_9_14
   - 228 dx_abs_j_9_14_is_positive >= -228
 dx_abs_j_9_14_force_negative: dx_diff_j_9_14
   - 228 dx_abs_j_9_14_is_positive <= 0
 dy_abs_j_9_14_abs_ge_orig: dy_abs_j_9_14 - dy_diff_j_9_14
   - 228 dy_abs_j_9_14_is_positive >= -228
 dy_abs_j_9_14_abs_le_orig: dy_abs_j_9_14 - dy_diff_j_9_14
   + 228 dy_abs_j_9_14_is_positive <= 228
 dy_abs_j_9_14_abs_ge_neg_orig: dy_abs_j_9_14 + dy_diff_j_9_14
   + 228 dy_abs_j_9_14_is_positive >= 0
 dy_abs_j_9_14_abs_le_neg_orig: dy_abs_j_9_14 + dy_diff_j_9_14
   - 228 dy_abs_j_9_14_is_positive <= 0
 dy_abs_j_9_14_force_positive: dy_diff_j_9_14
   - 228 dy_abs_j_9_14_is_positive >= -228
 dy_abs_j_9_14_force_negative: dy_diff_j_9_14
   - 228 dy_abs_j_9_14_is_positive <= 0
 dx_diff_def_i_10_12: EMIB_cx_grid_var_10_12 - cx_grid_var_10
   + dx_diff_i_10_12 = 0
 dx_diff_def_j_10_12: EMIB_cx_grid_var_10_12 - cx_grid_var_12
   + dx_diff_j_10_12 = 0
 dy_diff_def_i_10_12: EMIB_cy_grid_var_10_12 - cy_grid_var_10
   + dy_diff_i_10_12 = 0
 dy_diff_def_j_10_12: EMIB_cy_grid_var_10_12 - cy_grid_var_12
   + dy_diff_j_10_12 = 0
 dx_abs_i_10_12_abs_ge_orig: dx_abs_i_10_12 - dx_diff_i_10_12
   - 228 dx_abs_i_10_12_is_positive >= -228
 dx_abs_i_10_12_abs_le_orig: dx_abs_i_10_12 - dx_diff_i_10_12
   + 228 dx_abs_i_10_12_is_positive <= 228
 dx_abs_i_10_12_abs_ge_neg_orig: dx_abs_i_10_12 + dx_diff_i_10_12
   + 228 dx_abs_i_10_12_is_positive >= 0
 dx_abs_i_10_12_abs_le_neg_orig: dx_abs_i_10_12 + dx_diff_i_10_12
   - 228 dx_abs_i_10_12_is_positive <= 0
 dx_abs_i_10_12_force_positive: dx_diff_i_10_12
   - 228 dx_abs_i_10_12_is_positive >= -228
 dx_abs_i_10_12_force_negative: dx_diff_i_10_12
   - 228 dx_abs_i_10_12_is_positive <= 0
 dy_abs_i_10_12_abs_ge_orig: dy_abs_i_10_12 - dy_diff_i_10_12
   - 228 dy_abs_i_10_12_is_positive >= -228
 dy_abs_i_10_12_abs_le_orig: dy_abs_i_10_12 - dy_diff_i_10_12
   + 228 dy_abs_i_10_12_is_positive <= 228
 dy_abs_i_10_12_abs_ge_neg_orig: dy_abs_i_10_12 + dy_diff_i_10_12
   + 228 dy_abs_i_10_12_is_positive >= 0
 dy_abs_i_10_12_abs_le_neg_orig: dy_abs_i_10_12 + dy_diff_i_10_12
   - 228 dy_abs_i_10_12_is_positive <= 0
 dy_abs_i_10_12_force_positive: dy_diff_i_10_12
   - 228 dy_abs_i_10_12_is_positive >= -228
 dy_abs_i_10_12_force_negative: dy_diff_i_10_12
   - 228 dy_abs_i_10_12_is_positive <= 0
 dx_abs_j_10_12_abs_ge_orig: dx_abs_j_10_12 - dx_diff_j_10_12
   - 228 dx_abs_j_10_12_is_positive >= -228
 dx_abs_j_10_12_abs_le_orig: dx_abs_j_10_12 - dx_diff_j_10_12
   + 228 dx_abs_j_10_12_is_positive <= 228
 dx_abs_j_10_12_abs_ge_neg_orig: dx_abs_j_10_12 + dx_diff_j_10_12
   + 228 dx_abs_j_10_12_is_positive >= 0
 dx_abs_j_10_12_abs_le_neg_orig: dx_abs_j_10_12 + dx_diff_j_10_12
   - 228 dx_abs_j_10_12_is_positive <= 0
 dx_abs_j_10_12_force_positive: dx_diff_j_10_12
   - 228 dx_abs_j_10_12_is_positive >= -228
 dx_abs_j_10_12_force_negative: dx_diff_j_10_12
   - 228 dx_abs_j_10_12_is_positive <= 0
 dy_abs_j_10_12_abs_ge_orig: dy_abs_j_10_12 - dy_diff_j_10_12
   - 228 dy_abs_j_10_12_is_positive >= -228
 dy_abs_j_10_12_abs_le_orig: dy_abs_j_10_12 - dy_diff_j_10_12
   + 228 dy_abs_j_10_12_is_positive <= 228
 dy_abs_j_10_12_abs_ge_neg_orig: dy_abs_j_10_12 + dy_diff_j_10_12
   + 228 dy_abs_j_10_12_is_positive >= 0
 dy_abs_j_10_12_abs_le_neg_orig: dy_abs_j_10_12 + dy_diff_j_10_12
   - 228 dy_abs_j_10_12_is_positive <= 0
 dy_abs_j_10_12_force_positive: dy_diff_j_10_12
   - 228 dy_abs_j_10_12_is_positive >= -228
 dy_abs_j_10_12_force_negative: dy_diff_j_10_12
   - 228 dy_abs_j_10_12_is_positive <= 0
 dx_diff_def_i_11_12: EMIB_cx_grid_var_11_12 - cx_grid_var_11
   + dx_diff_i_11_12 = 0
 dx_diff_def_j_11_12: EMIB_cx_grid_var_11_12 - cx_grid_var_12
   + dx_diff_j_11_12 = 0
 dy_diff_def_i_11_12: EMIB_cy_grid_var_11_12 - cy_grid_var_11
   + dy_diff_i_11_12 = 0
 dy_diff_def_j_11_12: EMIB_cy_grid_var_11_12 - cy_grid_var_12
   + dy_diff_j_11_12 = 0
 dx_abs_i_11_12_abs_ge_orig: dx_abs_i_11_12 - dx_diff_i_11_12
   - 228 dx_abs_i_11_12_is_positive >= -228
 dx_abs_i_11_12_abs_le_orig: dx_abs_i_11_12 - dx_diff_i_11_12
   + 228 dx_abs_i_11_12_is_positive <= 228
 dx_abs_i_11_12_abs_ge_neg_orig: dx_abs_i_11_12 + dx_diff_i_11_12
   + 228 dx_abs_i_11_12_is_positive >= 0
 dx_abs_i_11_12_abs_le_neg_orig: dx_abs_i_11_12 + dx_diff_i_11_12
   - 228 dx_abs_i_11_12_is_positive <= 0
 dx_abs_i_11_12_force_positive: dx_diff_i_11_12
   - 228 dx_abs_i_11_12_is_positive >= -228
 dx_abs_i_11_12_force_negative: dx_diff_i_11_12
   - 228 dx_abs_i_11_12_is_positive <= 0
 dy_abs_i_11_12_abs_ge_orig: dy_abs_i_11_12 - dy_diff_i_11_12
   - 228 dy_abs_i_11_12_is_positive >= -228
 dy_abs_i_11_12_abs_le_orig: dy_abs_i_11_12 - dy_diff_i_11_12
   + 228 dy_abs_i_11_12_is_positive <= 228
 dy_abs_i_11_12_abs_ge_neg_orig: dy_abs_i_11_12 + dy_diff_i_11_12
   + 228 dy_abs_i_11_12_is_positive >= 0
 dy_abs_i_11_12_abs_le_neg_orig: dy_abs_i_11_12 + dy_diff_i_11_12
   - 228 dy_abs_i_11_12_is_positive <= 0
 dy_abs_i_11_12_force_positive: dy_diff_i_11_12
   - 228 dy_abs_i_11_12_is_positive >= -228
 dy_abs_i_11_12_force_negative: dy_diff_i_11_12
   - 228 dy_abs_i_11_12_is_positive <= 0
 dx_abs_j_11_12_abs_ge_orig: dx_abs_j_11_12 - dx_diff_j_11_12
   - 228 dx_abs_j_11_12_is_positive >= -228
 dx_abs_j_11_12_abs_le_orig: dx_abs_j_11_12 - dx_diff_j_11_12
   + 228 dx_abs_j_11_12_is_positive <= 228
 dx_abs_j_11_12_abs_ge_neg_orig: dx_abs_j_11_12 + dx_diff_j_11_12
   + 228 dx_abs_j_11_12_is_positive >= 0
 dx_abs_j_11_12_abs_le_neg_orig: dx_abs_j_11_12 + dx_diff_j_11_12
   - 228 dx_abs_j_11_12_is_positive <= 0
 dx_abs_j_11_12_force_positive: dx_diff_j_11_12
   - 228 dx_abs_j_11_12_is_positive >= -228
 dx_abs_j_11_12_force_negative: dx_diff_j_11_12
   - 228 dx_abs_j_11_12_is_positive <= 0
 dy_abs_j_11_12_abs_ge_orig: dy_abs_j_11_12 - dy_diff_j_11_12
   - 228 dy_abs_j_11_12_is_positive >= -228
 dy_abs_j_11_12_abs_le_orig: dy_abs_j_11_12 - dy_diff_j_11_12
   + 228 dy_abs_j_11_12_is_positive <= 228
 dy_abs_j_11_12_abs_ge_neg_orig: dy_abs_j_11_12 + dy_diff_j_11_12
   + 228 dy_abs_j_11_12_is_positive >= 0
 dy_abs_j_11_12_abs_le_neg_orig: dy_abs_j_11_12 + dy_diff_j_11_12
   - 228 dy_abs_j_11_12_is_positive <= 0
 dy_abs_j_11_12_force_positive: dy_diff_j_11_12
   - 228 dy_abs_j_11_12_is_positive >= -228
 dy_abs_j_11_12_force_negative: dy_diff_j_11_12
   - 228 dy_abs_j_11_12_is_positive <= 0
 dx_diff_def_i_12_13: EMIB_cx_grid_var_12_13 - cx_grid_var_12
   + dx_diff_i_12_13 = 0
 dx_diff_def_j_12_13: EMIB_cx_grid_var_12_13 - cx_grid_var_13
   + dx_diff_j_12_13 = 0
 dy_diff_def_i_12_13: EMIB_cy_grid_var_12_13 - cy_grid_var_12
   + dy_diff_i_12_13 = 0
 dy_diff_def_j_12_13: EMIB_cy_grid_var_12_13 - cy_grid_var_13
   + dy_diff_j_12_13 = 0
 dx_abs_i_12_13_abs_ge_orig: dx_abs_i_12_13 - dx_diff_i_12_13
   - 228 dx_abs_i_12_13_is_positive >= -228
 dx_abs_i_12_13_abs_le_orig: dx_abs_i_12_13 - dx_diff_i_12_13
   + 228 dx_abs_i_12_13_is_positive <= 228
 dx_abs_i_12_13_abs_ge_neg_orig: dx_abs_i_12_13 + dx_diff_i_12_13
   + 228 dx_abs_i_12_13_is_positive >= 0
 dx_abs_i_12_13_abs_le_neg_orig: dx_abs_i_12_13 + dx_diff_i_12_13
   - 228 dx_abs_i_12_13_is_positive <= 0
 dx_abs_i_12_13_force_positive: dx_diff_i_12_13
   - 228 dx_abs_i_12_13_is_positive >= -228
 dx_abs_i_12_13_force_negative: dx_diff_i_12_13
   - 228 dx_abs_i_12_13_is_positive <= 0
 dy_abs_i_12_13_abs_ge_orig: dy_abs_i_12_13 - dy_diff_i_12_13
   - 228 dy_abs_i_12_13_is_positive >= -228
 dy_abs_i_12_13_abs_le_orig: dy_abs_i_12_13 - dy_diff_i_12_13
   + 228 dy_abs_i_12_13_is_positive <= 228
 dy_abs_i_12_13_abs_ge_neg_orig: dy_abs_i_12_13 + dy_diff_i_12_13
   + 228 dy_abs_i_12_13_is_positive >= 0
 dy_abs_i_12_13_abs_le_neg_orig: dy_abs_i_12_13 + dy_diff_i_12_13
   - 228 dy_abs_i_12_13_is_positive <= 0
 dy_abs_i_12_13_force_positive: dy_diff_i_12_13
   - 228 dy_abs_i_12_13_is_positive >= -228
 dy_abs_i_12_13_force_negative: dy_diff_i_12_13
   - 228 dy_abs_i_12_13_is_positive <= 0
 dx_abs_j_12_13_abs_ge_orig: dx_abs_j_12_13 - dx_diff_j_12_13
   - 228 dx_abs_j_12_13_is_positive >= -228
 dx_abs_j_12_13_abs_le_orig: dx_abs_j_12_13 - dx_diff_j_12_13
   + 228 dx_abs_j_12_13_is_positive <= 228
 dx_abs_j_12_13_abs_ge_neg_orig: dx_abs_j_12_13 + dx_diff_j_12_13
   + 228 dx_abs_j_12_13_is_positive >= 0
 dx_abs_j_12_13_abs_le_neg_orig: dx_abs_j_12_13 + dx_diff_j_12_13
   - 228 dx_abs_j_12_13_is_positive <= 0
 dx_abs_j_12_13_force_positive: dx_diff_j_12_13
   - 228 dx_abs_j_12_13_is_positive >= -228
 dx_abs_j_12_13_force_negative: dx_diff_j_12_13
   - 228 dx_abs_j_12_13_is_positive <= 0
 dy_abs_j_12_13_abs_ge_orig: dy_abs_j_12_13 - dy_diff_j_12_13
   - 228 dy_abs_j_12_13_is_positive >= -228
 dy_abs_j_12_13_abs_le_orig: dy_abs_j_12_13 - dy_diff_j_12_13
   + 228 dy_abs_j_12_13_is_positive <= 228
 dy_abs_j_12_13_abs_ge_neg_orig: dy_abs_j_12_13 + dy_diff_j_12_13
   + 228 dy_abs_j_12_13_is_positive >= 0
 dy_abs_j_12_13_abs_le_neg_orig: dy_abs_j_12_13 + dy_diff_j_12_13
   - 228 dy_abs_j_12_13_is_positive <= 0
 dy_abs_j_12_13_force_positive: dy_diff_j_12_13
   - 228 dy_abs_j_12_13_is_positive >= -228
 dy_abs_j_12_13_force_negative: dy_diff_j_12_13
   - 228 dy_abs_j_12_13_is_positive <= 0
 dx_diff_def_i_13_14: EMIB_cx_grid_var_13_14 - cx_grid_var_13
   + dx_diff_i_13_14 = 0
 dx_diff_def_j_13_14: EMIB_cx_grid_var_13_14 - cx_grid_var_14
   + dx_diff_j_13_14 = 0
 dy_diff_def_i_13_14: EMIB_cy_grid_var_13_14 - cy_grid_var_13
   + dy_diff_i_13_14 = 0
 dy_diff_def_j_13_14: EMIB_cy_grid_var_13_14 - cy_grid_var_14
   + dy_diff_j_13_14 = 0
 dx_abs_i_13_14_abs_ge_orig: dx_abs_i_13_14 - dx_diff_i_13_14
   - 228 dx_abs_i_13_14_is_positive >= -228
 dx_abs_i_13_14_abs_le_orig: dx_abs_i_13_14 - dx_diff_i_13_14
   + 228 dx_abs_i_13_14_is_positive <= 228
 dx_abs_i_13_14_abs_ge_neg_orig: dx_abs_i_13_14 + dx_diff_i_13_14
   + 228 dx_abs_i_13_14_is_positive >= 0
 dx_abs_i_13_14_abs_le_neg_orig: dx_abs_i_13_14 + dx_diff_i_13_14
   - 228 dx_abs_i_13_14_is_positive <= 0
 dx_abs_i_13_14_force_positive: dx_diff_i_13_14
   - 228 dx_abs_i_13_14_is_positive >= -228
 dx_abs_i_13_14_force_negative: dx_diff_i_13_14
   - 228 dx_abs_i_13_14_is_positive <= 0
 dy_abs_i_13_14_abs_ge_orig: dy_abs_i_13_14 - dy_diff_i_13_14
   - 228 dy_abs_i_13_14_is_positive >= -228
 dy_abs_i_13_14_abs_le_orig: dy_abs_i_13_14 - dy_diff_i_13_14
   + 228 dy_abs_i_13_14_is_positive <= 228
 dy_abs_i_13_14_abs_ge_neg_orig: dy_abs_i_13_14 + dy_diff_i_13_14
   + 228 dy_abs_i_13_14_is_positive >= 0
 dy_abs_i_13_14_abs_le_neg_orig: dy_abs_i_13_14 + dy_diff_i_13_14
   - 228 dy_abs_i_13_14_is_positive <= 0
 dy_abs_i_13_14_force_positive: dy_diff_i_13_14
   - 228 dy_abs_i_13_14_is_positive >= -228
 dy_abs_i_13_14_force_negative: dy_diff_i_13_14
   - 228 dy_abs_i_13_14_is_positive <= 0
 dx_abs_j_13_14_abs_ge_orig: dx_abs_j_13_14 - dx_diff_j_13_14
   - 228 dx_abs_j_13_14_is_positive >= -228
 dx_abs_j_13_14_abs_le_orig: dx_abs_j_13_14 - dx_diff_j_13_14
   + 228 dx_abs_j_13_14_is_positive <= 228
 dx_abs_j_13_14_abs_ge_neg_orig: dx_abs_j_13_14 + dx_diff_j_13_14
   + 228 dx_abs_j_13_14_is_positive >= 0
 dx_abs_j_13_14_abs_le_neg_orig: dx_abs_j_13_14 + dx_diff_j_13_14
   - 228 dx_abs_j_13_14_is_positive <= 0
 dx_abs_j_13_14_force_positive: dx_diff_j_13_14
   - 228 dx_abs_j_13_14_is_positive >= -228
 dx_abs_j_13_14_force_negative: dx_diff_j_13_14
   - 228 dx_abs_j_13_14_is_positive <= 0
 dy_abs_j_13_14_abs_ge_orig: dy_abs_j_13_14 - dy_diff_j_13_14
   - 228 dy_abs_j_13_14_is_positive >= -228
 dy_abs_j_13_14_abs_le_orig: dy_abs_j_13_14 - dy_diff_j_13_14
   + 228 dy_abs_j_13_14_is_positive <= 228
 dy_abs_j_13_14_abs_ge_neg_orig: dy_abs_j_13_14 + dy_diff_j_13_14
   + 228 dy_abs_j_13_14_is_positive >= 0
 dy_abs_j_13_14_abs_le_neg_orig: dy_abs_j_13_14 + dy_diff_j_13_14
   - 228 dy_abs_j_13_14_is_positive <= 0
 dy_abs_j_13_14_force_positive: dy_diff_j_13_14
   - 228 dy_abs_j_13_14_is_positive >= -228
 dy_abs_j_13_14_force_negative: dy_diff_j_13_14
   - 228 dy_abs_j_13_14_is_positive <= 0
 wirelength_def: wirelength - 128 dx_abs_0_1 - 128 dy_abs_0_1
   - 128 dx_abs_0_2 - 128 dy_abs_0_2 - 128 dx_abs_0_3 - 128 dy_abs_0_3
   - 128 dx_abs_0_8 - 128 dy_abs_0_8 - 128 dx_abs_1_7 - 128 dy_abs_1_7
   - 128 dx_abs_2_9 - 128 dy_abs_2_9 - 128 dx_abs_2_12 - 128 dy_abs_2_12
   - 128 dx_abs_3_7 - 128 dy_abs_3_7 - 128 dx_abs_3_8 - 128 dy_abs_3_8
   - 128 dx_abs_3_13 - 128 dy_abs_3_13 - 128 dx_abs_4_11 - 128 dy_abs_4_11
   - 128 dx_abs_4_14 - 128 dy_abs_4_14 - 128 dx_abs_5_10 - 128 dy_abs_5_10
   - 128 dx_abs_6_14 - 128 dy_abs_6_14 - 128 dx_abs_7_9 - 128 dy_abs_7_9
   - 128 dx_abs_8_13 - 128 dy_abs_8_13 - 128 dx_abs_9_12 - 128 dy_abs_9_12
   - 128 dx_abs_10_11 - 128 dy_abs_10_11 - 128 dx_abs_10_13
   - 128 dy_abs_10_13 - 128 dx_abs_11_14 - 128 dy_abs_11_14
   - 512 dx_abs_i_0_7 - 512 dy_abs_i_0_7 - 512 dx_abs_j_0_7
   - 512 dy_abs_j_0_7 - 512 dx_abs_i_0_9 - 512 dy_abs_i_0_9
   - 512 dx_abs_j_0_9 - 512 dy_abs_j_0_9 - 256 dx_abs_i_1_4
   - 256 dy_abs_i_1_4 - 256 dx_abs_j_1_4 - 256 dy_abs_j_1_4
   - 256 dx_abs_i_1_8 - 256 dy_abs_i_1_8 - 256 dx_abs_j_1_8
   - 256 dy_abs_j_1_8 - 512 dx_abs_i_1_11 - 512 dy_abs_i_1_11
   - 512 dx_abs_j_1_11 - 512 dy_abs_j_1_11 - 512 dx_abs_i_1_13
   - 512 dy_abs_i_1_13 - 512 dx_abs_j_1_13 - 512 dy_abs_j_1_13
   - 256 dx_abs_i_2_3 - 256 dy_abs_i_2_3 - 256 dx_abs_j_2_3
   - 256 dy_abs_j_2_3 - 256 dx_abs_i_2_5 - 256 dy_abs_i_2_5
   - 256 dx_abs_j_2_5 - 256 dy_abs_j_2_5 - 256 dx_abs_i_2_14
   - 256 dy_abs_i_2_14 - 256 dx_abs_j_2_14 - 256 dy_abs_j_2_14
   - 256 dx_abs_i_3_11 - 256 dy_abs_i_3_11 - 256 dx_abs_j_3_11
   - 256 dy_abs_j_3_11 - 256 dx_abs_i_5_7 - 256 dy_abs_i_5_7
   - 256 dx_abs_j_5_7 - 256 dy_abs_j_5_7 - 256 dx_abs_i_5_9
   - 256 dy_abs_i_5_9 - 256 dx_abs_j_5_9 - 256 dy_abs_j_5_9
   - 512 dx_abs_i_5_11 - 512 dy_abs_i_5_11 - 512 dx_abs_j_5_11
   - 512 dy_abs_j_5_11 - 512 dx_abs_i_5_12 - 512 dy_abs_i_5_12
   - 512 dx_abs_j_5_12 - 512 dy_abs_j_5_12 - 256 dx_abs_i_5_14
   - 256 dy_abs_i_5_14 - 256 dx_abs_j_5_14 - 256 dy_abs_j_5_14
   - 256 dx_abs_i_6_12 - 256 dy_abs_i_6_12 - 256 dx_abs_j_6_12
   - 256 dy_abs_j_6_12 - 256 dx_abs_i_7_13 - 256 dy_abs_i_7_13
   - 256 dx_abs_j_7_13 - 256 dy_abs_j_7_13 - 256 dx_abs_i_7_14
   - 256 dy_abs_i_7_14 - 256 dx_abs_j_7_14 - 256 dy_abs_j_7_14
   - 256 dx_abs_i_9_14 - 256 dy_abs_i_9_14 - 256 dx_abs_j_9_14
   - 256 dy_abs_j_9_14 - 256 dx_abs_i_10_12 - 256 dy_abs_i_10_12
   - 256 dx_abs_j_10_12 - 256 dy_abs_j_10_12 - 512 dx_abs_i_11_12
   - 512 dy_abs_i_11_12 - 512 dx_abs_j_11_12 - 512 dy_abs_j_11_12
   - 256 dx_abs_i_12_13 - 256 dy_abs_i_12_13 - 256 dx_abs_j_12_13
   - 256 dy_abs_j_12_13 - 256 dx_abs_i_13_14 - 256 dy_abs_i_13_14
   - 256 dx_abs_j_13_14 - 256 dy_abs_j_13_14 = 0
 t_ge_scaled_mean: - 0.8 bbox_w - 0.8 bbox_h + bbox_area_proxy_t >= 0
Bounds
 6 <= w_var_0 <= 8
 6 <= h_var_0 <= 8
 5 <= w_var_1 <= 6
 5 <= h_var_1 <= 6
 8 <= w_var_2 <= 9
 8 <= h_var_2 <= 9
 6 <= w_var_3 <= 7
 6 <= h_var_3 <= 7
 5 <= w_var_4 <= 7
 5 <= h_var_4 <= 7
 8 <= w_var_5 <= 9
 8 <= h_var_5 <= 9
 6 <= w_var_6 <= 7
 6 <= h_var_6 <= 7
 5 <= w_var_7 <= 9
 5 <= h_var_7 <= 9
 6 <= w_var_8 <= 9
 6 <= h_var_8 <= 9
 w_var_9 = 6
 h_var_9 = 6
 6 <= w_var_10 <= 7
 6 <= h_var_10 <= 7
 6 <= w_var_11 <= 8
 6 <= h_var_11 <= 8
 7 <= w_var_12 <= 8
 7 <= h_var_12 <= 8
 6 <= w_var_13 <= 7
 6 <= h_var_13 <= 7
 5 <= w_var_14 <= 8
 5 <= h_var_14 <= 8
 1.7067 <= EMIB_w_var_0_7 <= 2
 1.7067 <= EMIB_h_var_0_7 <= 2
 1.7067 <= EMIB_w_var_0_9 <= 2
 1.7067 <= EMIB_h_var_0_9 <= 2
 0.8533 <= EMIB_w_var_1_4 <= 2
 0.8533 <= EMIB_h_var_1_4 <= 2
 0.8533 <= EMIB_w_var_1_8 <= 2
 0.8533 <= EMIB_h_var_1_8 <= 2
 1.7067 <= EMIB_w_var_1_11 <= 2
 1.7067 <= EMIB_h_var_1_11 <= 2
 1.7067 <= EMIB_w_var_1_13 <= 2
 1.7067 <= EMIB_h_var_1_13 <= 2
 0.8533 <= EMIB_w_var_2_3 <= 2
 0.8533 <= EMIB_h_var_2_3 <= 2
 0.8533 <= EMIB_w_var_2_5 <= 2
 0.8533 <= EMIB_h_var_2_5 <= 2
 0.8533 <= EMIB_w_var_2_14 <= 2
 0.8533 <= EMIB_h_var_2_14 <= 2
 0.8533 <= EMIB_w_var_3_11 <= 2
 0.8533 <= EMIB_h_var_3_11 <= 2
 0.8533 <= EMIB_w_var_5_7 <= 2
 0.8533 <= EMIB_h_var_5_7 <= 2
 0.8533 <= EMIB_w_var_5_9 <= 2
 0.8533 <= EMIB_h_var_5_9 <= 2
 1.7067 <= EMIB_w_var_5_11 <= 2
 1.7067 <= EMIB_h_var_5_11 <= 2
 1.7067 <= EMIB_w_var_5_12 <= 2
 1.7067 <= EMIB_h_var_5_12 <= 2
 0.8533 <= EMIB_w_var_5_14 <= 2
 0.8533 <= EMIB_h_var_5_14 <= 2
 0.8533 <= EMIB_w_var_6_12 <= 2
 0.8533 <= EMIB_h_var_6_12 <= 2
 0.8533 <= EMIB_w_var_7_13 <= 2
 0.8533 <= EMIB_h_var_7_13 <= 2
 0.8533 <= EMIB_w_var_7_14 <= 2
 0.8533 <= EMIB_h_var_7_14 <= 2
 0.8533 <= EMIB_w_var_9_14 <= 2
 0.8533 <= EMIB_h_var_9_14 <= 2
 0.8533 <= EMIB_w_var_10_12 <= 2
 0.8533 <= EMIB_h_var_10_12 <= 2
 1.7067 <= EMIB_w_var_11_12 <= 2
 1.7067 <= EMIB_h_var_11_12 <= 2
 0.8533 <= EMIB_w_var_12_13 <= 2
 0.8533 <= EMIB_h_var_12_13 <= 2
 0.8533 <= EMIB_w_var_13_14 <= 2
 0.8533 <= EMIB_h_var_13_14 <= 2
 x_grid_var_0 <= 114
 y_grid_var_0 <= 114
 x_grid_var_1 <= 114
 y_grid_var_1 <= 114
 x_grid_var_2 <= 114
 y_grid_var_2 <= 114
 x_grid_var_3 <= 114
 y_grid_var_3 <= 114
 x_grid_var_4 <= 114
 y_grid_var_4 <= 114
 x_grid_var_5 <= 114
 y_grid_var_5 <= 114
 x_grid_var_6 <= 114
 y_grid_var_6 <= 114
 x_grid_var_7 <= 114
 y_grid_var_7 <= 114
 x_grid_var_8 <= 114
 y_grid_var_8 <= 114
 x_grid_var_9 <= 114
 y_grid_var_9 <= 114
 x_grid_var_10 <= 114
 y_grid_var_10 <= 114
 x_grid_var_11 <= 114
 y_grid_var_11 <= 114
 x_grid_var_12 <= 114
 y_grid_var_12 <= 114
 x_grid_var_13 <= 114
 y_grid_var_13 <= 114
 x_grid_var_14 <= 114
 y_grid_var_14 <= 114
 EMIB_x_grid_var_0_7 <= 114
 EMIB_y_grid_var_0_7 <= 114
 EMIB_x_grid_var_0_9 <= 114
 EMIB_y_grid_var_0_9 <= 114
 EMIB_x_grid_var_1_4 <= 114
 EMIB_y_grid_var_1_4 <= 114
 EMIB_x_grid_var_1_8 <= 114
 EMIB_y_grid_var_1_8 <= 114
 EMIB_x_grid_var_1_11 <= 114
 EMIB_y_grid_var_1_11 <= 114
 EMIB_x_grid_var_1_13 <= 114
 EMIB_y_grid_var_1_13 <= 114
 EMIB_x_grid_var_2_3 <= 114
 EMIB_y_grid_var_2_3 <= 114
 EMIB_x_grid_var_2_5 <= 114
 EMIB_y_grid_var_2_5 <= 114
 EMIB_x_grid_var_2_14 <= 114
 EMIB_y_grid_var_2_14 <= 114
 EMIB_x_grid_var_3_11 <= 114
 EMIB_y_grid_var_3_11 <= 114
 EMIB_x_grid_var_5_7 <= 114
 EMIB_y_grid_var_5_7 <= 114
 EMIB_x_grid_var_5_9 <= 114
 EMIB_y_grid_var_5_9 <= 114
 EMIB_x_grid_var_5_11 <= 114
 EMIB_y_grid_var_5_11 <= 114
 EMIB_x_grid_var_5_12 <= 114
 EMIB_y_grid_var_5_12 <= 114
 EMIB_x_grid_var_5_14 <= 114
 EMIB_y_grid_var_5_14 <= 114
 EMIB_x_grid_var_6_12 <= 114
 EMIB_y_grid_var_6_12 <= 114
 EMIB_x_grid_var_7_13 <= 114
 EMIB_y_grid_var_7_13 <= 114
 EMIB_x_grid_var_7_14 <= 114
 EMIB_y_grid_var_7_14 <= 114
 EMIB_x_grid_var_9_14 <= 114
 EMIB_y_grid_var_9_14 <= 114
 EMIB_x_grid_var_10_12 <= 114
 EMIB_y_grid_var_10_12 <= 114
 EMIB_x_grid_var_11_12 <= 114
 EMIB_y_grid_var_11_12 <= 114
 EMIB_x_grid_var_12_13 <= 114
 EMIB_y_grid_var_12_13 <= 114
 EMIB_x_grid_var_13_14 <= 114
 EMIB_y_grid_var_13_14 <= 114
 EMIB_cx_grid_var_0_7 <= 228
 EMIB_cy_grid_var_0_7 <= 228
 EMIB_cx_grid_var_0_9 <= 228
 EMIB_cy_grid_var_0_9 <= 228
 EMIB_cx_grid_var_1_4 <= 228
 EMIB_cy_grid_var_1_4 <= 228
 EMIB_cx_grid_var_1_8 <= 228
 EMIB_cy_grid_var_1_8 <= 228
 EMIB_cx_grid_var_1_11 <= 228
 EMIB_cy_grid_var_1_11 <= 228
 EMIB_cx_grid_var_1_13 <= 228
 EMIB_cy_grid_var_1_13 <= 228
 EMIB_cx_grid_var_2_3 <= 228
 EMIB_cy_grid_var_2_3 <= 228
 EMIB_cx_grid_var_2_5 <= 228
 EMIB_cy_grid_var_2_5 <= 228
 EMIB_cx_grid_var_2_14 <= 228
 EMIB_cy_grid_var_2_14 <= 228
 EMIB_cx_grid_var_3_11 <= 228
 EMIB_cy_grid_var_3_11 <= 228
 EMIB_cx_grid_var_5_7 <= 228
 EMIB_cy_grid_var_5_7 <= 228
 EMIB_cx_grid_var_5_9 <= 228
 EMIB_cy_grid_var_5_9 <= 228
 EMIB_cx_grid_var_5_11 <= 228
 EMIB_cy_grid_var_5_11 <= 228
 EMIB_cx_grid_var_5_12 <= 228
 EMIB_cy_grid_var_5_12 <= 228
 EMIB_cx_grid_var_5_14 <= 228
 EMIB_cy_grid_var_5_14 <= 228
 EMIB_cx_grid_var_6_12 <= 228
 EMIB_cy_grid_var_6_12 <= 228
 EMIB_cx_grid_var_7_13 <= 228
 EMIB_cy_grid_var_7_13 <= 228
 EMIB_cx_grid_var_7_14 <= 228
 EMIB_cy_grid_var_7_14 <= 228
 EMIB_cx_grid_var_9_14 <= 228
 EMIB_cy_grid_var_9_14 <= 228
 EMIB_cx_grid_var_10_12 <= 228
 EMIB_cy_grid_var_10_12 <= 228
 EMIB_cx_grid_var_11_12 <= 228
 EMIB_cy_grid_var_11_12 <= 228
 EMIB_cx_grid_var_12_13 <= 228
 EMIB_cy_grid_var_12_13 <= 228
 EMIB_cx_grid_var_13_14 <= 228
 EMIB_cy_grid_var_13_14 <= 228
 cx_grid_var_0 <= 228
 cy_grid_var_0 <= 228
 cx_grid_var_1 <= 228
 cy_grid_var_1 <= 228
 cx_grid_var_2 <= 228
 cy_grid_var_2 <= 228
 cx_grid_var_3 <= 228
 cy_grid_var_3 <= 228
 cx_grid_var_4 <= 228
 cy_grid_var_4 <= 228
 cx_grid_var_5 <= 228
 cy_grid_var_5 <= 228
 cx_grid_var_6 <= 228
 cy_grid_var_6 <= 228
 cx_grid_var_7 <= 228
 cy_grid_var_7 <= 228
 cx_grid_var_8 <= 228
 cy_grid_var_8 <= 228
 cx_grid_var_9 <= 228
 cy_grid_var_9 <= 228
 cx_grid_var_10 <= 228
 cy_grid_var_10 <= 228
 cx_grid_var_11 <= 228
 cy_grid_var_11 <= 228
 cx_grid_var_12 <= 228
 cy_grid_var_12 <= 228
 cx_grid_var_13 <= 228
 cy_grid_var_13 <= 228
 cx_grid_var_14 <= 228
 cy_grid_var_14 <= 228
 cx_center <= 114
 cy_center <= 114
 bbox_min_x <= 114
 bbox_max_x <= 114
 bbox_min_y <= 114
 bbox_max_y <= 114
 bbox_w <= 114
 bbox_h <= 114
 aspect_ratio_penalty <= 114
 dx_grid_abs_pair_0_1 <= 114
 dy_grid_abs_pair_0_1 <= 114
 -114 <= dx_grid_diff_0_1 <= 114
 -114 <= dy_grid_diff_0_1 <= 114
 dist_curr_pair_0_1 <= 228
 dx_grid_abs_pair_0_7 <= 114
 dy_grid_abs_pair_0_7 <= 114
 -114 <= dx_grid_diff_0_7 <= 114
 -114 <= dy_grid_diff_0_7 <= 114
 dist_curr_pair_0_7 <= 228
 dx_grid_abs_pair_0_9 <= 114
 dy_grid_abs_pair_0_9 <= 114
 -114 <= dx_grid_diff_0_9 <= 114
 -114 <= dy_grid_diff_0_9 <= 114
 dist_curr_pair_0_9 <= 228
 dx_grid_abs_pair_1_7 <= 114
 dy_grid_abs_pair_1_7 <= 114
 -114 <= dx_grid_diff_1_7 <= 114
 -114 <= dy_grid_diff_1_7 <= 114
 dist_curr_pair_1_7 <= 228
 dx_grid_abs_pair_1_9 <= 114
 dy_grid_abs_pair_1_9 <= 114
 -114 <= dx_grid_diff_1_9 <= 114
 -114 <= dy_grid_diff_1_9 <= 114
 dist_curr_pair_1_9 <= 228
 dx_grid_abs_pair_7_9 <= 114
 dy_grid_abs_pair_7_9 <= 114
 -114 <= dx_grid_diff_7_9 <= 114
 -114 <= dy_grid_diff_7_9 <= 114
 dist_curr_pair_7_9 <= 228
 -114 <= dx_center_diff_0 <= 114
 dx_center_abs_0 <= 114
 -114 <= dy_center_diff_0 <= 114
 dy_center_abs_0 <= 114
 dist_center_0 <= 228
 -114 <= dx_center_diff_1 <= 114
 dx_center_abs_1 <= 114
 -114 <= dy_center_diff_1 <= 114
 dy_center_abs_1 <= 114
 dist_center_1 <= 228
 -114 <= dx_center_diff_7 <= 114
 dx_center_abs_7 <= 114
 -114 <= dy_center_diff_7 <= 114
 dy_center_abs_7 <= 114
 dist_center_7 <= 228
 -114 <= dx_center_diff_9 <= 114
 dx_center_abs_9 <= 114
 -114 <= dy_center_diff_9 <= 114
 dy_center_abs_9 <= 114
 dist_center_9 <= 228
 wirelength <= 4.0157184e+07
 -114 <= dx_diff_0_1 <= 114
 -114 <= dy_diff_0_1 <= 114
 -114 <= dx_diff_0_2 <= 114
 -114 <= dy_diff_0_2 <= 114
 -114 <= dx_diff_0_3 <= 114
 -114 <= dy_diff_0_3 <= 114
 -114 <= dx_diff_0_8 <= 114
 -114 <= dy_diff_0_8 <= 114
 -114 <= dx_diff_1_7 <= 114
 -114 <= dy_diff_1_7 <= 114
 -114 <= dx_diff_2_9 <= 114
 -114 <= dy_diff_2_9 <= 114
 -114 <= dx_diff_2_12 <= 114
 -114 <= dy_diff_2_12 <= 114
 -114 <= dx_diff_3_7 <= 114
 -114 <= dy_diff_3_7 <= 114
 -114 <= dx_diff_3_8 <= 114
 -114 <= dy_diff_3_8 <= 114
 -114 <= dx_diff_3_13 <= 114
 -114 <= dy_diff_3_13 <= 114
 -114 <= dx_diff_4_11 <= 114
 -114 <= dy_diff_4_11 <= 114
 -114 <= dx_diff_4_14 <= 114
 -114 <= dy_diff_4_14 <= 114
 -114 <= dx_diff_5_10 <= 114
 -114 <= dy_diff_5_10 <= 114
 -114 <= dx_diff_6_14 <= 114
 -114 <= dy_diff_6_14 <= 114
 -114 <= dx_diff_7_9 <= 114
 -114 <= dy_diff_7_9 <= 114
 -114 <= dx_diff_8_13 <= 114
 -114 <= dy_diff_8_13 <= 114
 -114 <= dx_diff_9_12 <= 114
 -114 <= dy_diff_9_12 <= 114
 -114 <= dx_diff_10_11 <= 114
 -114 <= dy_diff_10_11 <= 114
 -114 <= dx_diff_10_13 <= 114
 -114 <= dy_diff_10_13 <= 114
 -114 <= dx_diff_11_14 <= 114
 -114 <= dy_diff_11_14 <= 114
 -114 <= dx_diff_i_0_7 <= 114
 -114 <= dy_diff_i_0_7 <= 114
 -114 <= dx_diff_j_0_7 <= 114
 -114 <= dy_diff_j_0_7 <= 114
 -114 <= dx_diff_i_0_9 <= 114
 -114 <= dy_diff_i_0_9 <= 114
 -114 <= dx_diff_j_0_9 <= 114
 -114 <= dy_diff_j_0_9 <= 114
 -114 <= dx_diff_i_1_4 <= 114
 -114 <= dy_diff_i_1_4 <= 114
 -114 <= dx_diff_j_1_4 <= 114
 -114 <= dy_diff_j_1_4 <= 114
 -114 <= dx_diff_i_1_8 <= 114
 -114 <= dy_diff_i_1_8 <= 114
 -114 <= dx_diff_j_1_8 <= 114
 -114 <= dy_diff_j_1_8 <= 114
 -114 <= dx_diff_i_1_11 <= 114
 -114 <= dy_diff_i_1_11 <= 114
 -114 <= dx_diff_j_1_11 <= 114
 -114 <= dy_diff_j_1_11 <= 114
 -114 <= dx_diff_i_1_13 <= 114
 -114 <= dy_diff_i_1_13 <= 114
 -114 <= dx_diff_j_1_13 <= 114
 -114 <= dy_diff_j_1_13 <= 114
 -114 <= dx_diff_i_2_3 <= 114
 -114 <= dy_diff_i_2_3 <= 114
 -114 <= dx_diff_j_2_3 <= 114
 -114 <= dy_diff_j_2_3 <= 114
 -114 <= dx_diff_i_2_5 <= 114
 -114 <= dy_diff_i_2_5 <= 114
 -114 <= dx_diff_j_2_5 <= 114
 -114 <= dy_diff_j_2_5 <= 114
 -114 <= dx_diff_i_2_14 <= 114
 -114 <= dy_diff_i_2_14 <= 114
 -114 <= dx_diff_j_2_14 <= 114
 -114 <= dy_diff_j_2_14 <= 114
 -114 <= dx_diff_i_3_11 <= 114
 -114 <= dy_diff_i_3_11 <= 114
 -114 <= dx_diff_j_3_11 <= 114
 -114 <= dy_diff_j_3_11 <= 114
 -114 <= dx_diff_i_5_7 <= 114
 -114 <= dy_diff_i_5_7 <= 114
 -114 <= dx_diff_j_5_7 <= 114
 -114 <= dy_diff_j_5_7 <= 114
 -114 <= dx_diff_i_5_9 <= 114
 -114 <= dy_diff_i_5_9 <= 114
 -114 <= dx_diff_j_5_9 <= 114
 -114 <= dy_diff_j_5_9 <= 114
 -114 <= dx_diff_i_5_11 <= 114
 -114 <= dy_diff_i_5_11 <= 114
 -114 <= dx_diff_j_5_11 <= 114
 -114 <= dy_diff_j_5_11 <= 114
 -114 <= dx_diff_i_5_12 <= 114
 -114 <= dy_diff_i_5_12 <= 114
 -114 <= dx_diff_j_5_12 <= 114
 -114 <= dy_diff_j_5_12 <= 114
 -114 <= dx_diff_i_5_14 <= 114
 -114 <= dy_diff_i_5_14 <= 114
 -114 <= dx_diff_j_5_14 <= 114
 -114 <= dy_diff_j_5_14 <= 114
 -114 <= dx_diff_i_6_12 <= 114
 -114 <= dy_diff_i_6_12 <= 114
 -114 <= dx_diff_j_6_12 <= 114
 -114 <= dy_diff_j_6_12 <= 114
 -114 <= dx_diff_i_7_13 <= 114
 -114 <= dy_diff_i_7_13 <= 114
 -114 <= dx_diff_j_7_13 <= 114
 -114 <= dy_diff_j_7_13 <= 114
 -114 <= dx_diff_i_7_14 <= 114
 -114 <= dy_diff_i_7_14 <= 114
 -114 <= dx_diff_j_7_14 <= 114
 -114 <= dy_diff_j_7_14 <= 114
 -114 <= dx_diff_i_9_14 <= 114
 -114 <= dy_diff_i_9_14 <= 114
 -114 <= dx_diff_j_9_14 <= 114
 -114 <= dy_diff_j_9_14 <= 114
 -114 <= dx_diff_i_10_12 <= 114
 -114 <= dy_diff_i_10_12 <= 114
 -114 <= dx_diff_j_10_12 <= 114
 -114 <= dy_diff_j_10_12 <= 114
 -114 <= dx_diff_i_11_12 <= 114
 -114 <= dy_diff_i_11_12 <= 114
 -114 <= dx_diff_j_11_12 <= 114
 -114 <= dy_diff_j_11_12 <= 114
 -114 <= dx_diff_i_12_13 <= 114
 -114 <= dy_diff_i_12_13 <= 114
 -114 <= dx_diff_j_12_13 <= 114
 -114 <= dy_diff_j_12_13 <= 114
 -114 <= dx_diff_i_13_14 <= 114
 -114 <= dy_diff_i_13_14 <= 114
 -114 <= dx_diff_j_13_14 <= 114
 -114 <= dy_diff_j_13_14 <= 114
 bbox_area_proxy_t <= 228
Binaries
 r_0 r_1 r_2 r_3 r_4 r_5 r_6 r_7 r_8 r_9 r_10 r_11 r_12 r_13 r_14
 r_EMIB_0_7 r_EMIB_0_9 r_EMIB_1_4 r_EMIB_1_8 r_EMIB_1_11 r_EMIB_1_13
 r_EMIB_2_3 r_EMIB_2_5 r_EMIB_2_14 r_EMIB_3_11 r_EMIB_5_7 r_EMIB_5_9
 r_EMIB_5_11 r_EMIB_5_12 r_EMIB_5_14 r_EMIB_6_12 r_EMIB_7_13 r_EMIB_7_14
 r_EMIB_9_14 r_EMIB_10_12 r_EMIB_11_12 r_EMIB_12_13 r_EMIB_13_14 z1_0_7
 z2_0_7 z1L_0_7 z1R_0_7 z2D_0_7 z2U_0_7 z1_0_9 z2_0_9 z1L_0_9 z1R_0_9
 z2D_0_9 z2U_0_9 z1_1_4 z2_1_4 z1L_1_4 z1R_1_4 z2D_1_4 z2U_1_4 z1_1_8
 z2_1_8 z1L_1_8 z1R_1_8 z2D_1_8 z2U_1_8 z1_1_11 z2_1_11 z1L_1_11 z1R_1_11
 z2D_1_11 z2U_1_11 z1_1_13 z2_1_13 z1L_1_13 z1R_1_13 z2D_1_13 z2U_1_13
 z1_2_3 z2_2_3 z1L_2_3 z1R_2_3 z2D_2_3 z2U_2_3 z1_2_5 z2_2_5 z1L_2_5
 z1R_2_5 z2D_2_5 z2U_2_5 z1_2_14 z2_2_14 z1L_2_14 z1R_2_14 z2D_2_14
 z2U_2_14 z1_3_11 z2_3_11 z1L_3_11 z1R_3_11 z2D_3_11 z2U_3_11 z1_5_7 z2_5_7
 z1L_5_7 z1R_5_7 z2D_5_7 z2U_5_7 z1_5_9 z2_5_9 z1L_5_9 z1R_5_9 z2D_5_9
 z2U_5_9 z1_5_11 z2_5_11 z1L_5_11 z1R_5_11 z2D_5_11 z2U_5_11 z1_5_12
 z2_5_12 z1L_5_12 z1R_5_12 z2D_5_12 z2U_5_12 z1_5_14 z2_5_14 z1L_5_14
 z1R_5_14 z2D_5_14 z2U_5_14 z1_6_12 z2_6_12 z1L_6_12 z1R_6_12 z2D_6_12
 z2U_6_12 z1_7_13 z2_7_13 z1L_7_13 z1R_7_13 z2D_7_13 z2U_7_13 z1_7_14
 z2_7_14 z1L_7_14 z1R_7_14 z2D_7_14 z2U_7_14 z1_9_14 z2_9_14 z1L_9_14
 z1R_9_14 z2D_9_14 z2U_9_14 z1_10_12 z2_10_12 z1L_10_12 z1R_10_12 z2D_10_12
 z2U_10_12 z1_11_12 z2_11_12 z1L_11_12 z1R_11_12 z2D_11_12 z2U_11_12
 z1_12_13 z2_12_13 z1L_12_13 z1R_12_13 z2D_12_13 z2U_12_13 z1_13_14
 z2_13_14 z1L_13_14 z1R_13_14 z2D_13_14 z2U_13_14 p_left_0_1 p_right_0_1
 p_down_0_1 p_up_0_1 p_left_0_2 p_right_0_2 p_down_0_2 p_up_0_2 p_left_0_3
 p_right_0_3 p_down_0_3 p_up_0_3 p_left_0_4 p_right_0_4 p_down_0_4 p_up_0_4
 p_left_0_5 p_right_0_5 p_down_0_5 p_up_0_5 p_left_0_6 p_right_0_6
 p_down_0_6 p_up_0_6 p_left_0_7 p_right_0_7 p_down_0_7 p_up_0_7 p_left_0_8
 p_right_0_8 p_down_0_8 p_up_0_8 p_left_0_9 p_right_0_9 p_down_0_9 p_up_0_9
 p_left_0_10 p_right_0_10 p_down_0_10 p_up_0_10 p_left_0_11 p_right_0_11
 p_down_0_11 p_up_0_11 p_left_0_12 p_right_0_12 p_down_0_12 p_up_0_12
 p_left_0_13 p_right_0_13 p_down_0_13 p_up_0_13 p_left_0_14 p_right_0_14
 p_down_0_14 p_up_0_14 p_left_1_2 p_right_1_2 p_down_1_2 p_up_1_2
 p_left_1_3 p_right_1_3 p_down_1_3 p_up_1_3 p_left_1_4 p_right_1_4
 p_down_1_4 p_up_1_4 p_left_1_5 p_right_1_5 p_down_1_5 p_up_1_5 p_left_1_6
 p_right_1_6 p_down_1_6 p_up_1_6 p_left_1_7 p_right_1_7 p_down_1_7 p_up_1_7
 p_left_1_8 p_right_1_8 p_down_1_8 p_up_1_8 p_left_1_9 p_right_1_9
 p_down_1_9 p_up_1_9 p_left_1_10 p_right_1_10 p_down_1_10 p_up_1_10
 p_left_1_11 p_right_1_11 p_down_1_11 p_up_1_11 p_left_1_12 p_right_1_12
 p_down_1_12 p_up_1_12 p_left_1_13 p_right_1_13 p_down_1_13 p_up_1_13
 p_left_1_14 p_right_1_14 p_down_1_14 p_up_1_14 p_left_2_3 p_right_2_3
 p_down_2_3 p_up_2_3 p_left_2_4 p_right_2_4 p_down_2_4 p_up_2_4 p_left_2_5
 p_right_2_5 p_down_2_5 p_up_2_5 p_left_2_6 p_right_2_6 p_down_2_6 p_up_2_6
 p_left_2_7 p_right_2_7 p_down_2_7 p_up_2_7 p_left_2_8 p_right_2_8
 p_down_2_8 p_up_2_8 p_left_2_9 p_right_2_9 p_down_2_9 p_up_2_9 p_left_2_10
 p_right_2_10 p_down_2_10 p_up_2_10 p_left_2_11 p_right_2_11 p_down_2_11
 p_up_2_11 p_left_2_12 p_right_2_12 p_down_2_12 p_up_2_12 p_left_2_13
 p_right_2_13 p_down_2_13 p_up_2_13 p_left_2_14 p_right_2_14 p_down_2_14
 p_up_2_14 p_left_3_4 p_right_3_4 p_down_3_4 p_up_3_4 p_left_3_5
 p_right_3_5 p_down_3_5 p_up_3_5 p_left_3_6 p_right_3_6 p_down_3_6 p_up_3_6
 p_left_3_7 p_right_3_7 p_down_3_7 p_up_3_7 p_left_3_8 p_right_3_8
 p_down_3_8 p_up_3_8 p_left_3_9 p_right_3_9 p_down_3_9 p_up_3_9 p_left_3_10
 p_right_3_10 p_down_3_10 p_up_3_10 p_left_3_11 p_right_3_11 p_down_3_11
 p_up_3_11 p_left_3_12 p_right_3_12 p_down_3_12 p_up_3_12 p_left_3_13
 p_right_3_13 p_down_3_13 p_up_3_13 p_left_3_14 p_right_3_14 p_down_3_14
 p_up_3_14 p_left_4_5 p_right_4_5 p_down_4_5 p_up_4_5 p_left_4_6
 p_right_4_6 p_down_4_6 p_up_4_6 p_left_4_7 p_right_4_7 p_down_4_7 p_up_4_7
 p_left_4_8 p_right_4_8 p_down_4_8 p_up_4_8 p_left_4_9 p_right_4_9
 p_down_4_9 p_up_4_9 p_left_4_10 p_right_4_10 p_down_4_10 p_up_4_10
 p_left_4_11 p_right_4_11 p_down_4_11 p_up_4_11 p_left_4_12 p_right_4_12
 p_down_4_12 p_up_4_12 p_left_4_13 p_right_4_13 p_down_4_13 p_up_4_13
 p_left_4_14 p_right_4_14 p_down_4_14 p_up_4_14 p_left_5_6 p_right_5_6
 p_down_5_6 p_up_5_6 p_left_5_7 p_right_5_7 p_down_5_7 p_up_5_7 p_left_5_8
 p_right_5_8 p_down_5_8 p_up_5_8 p_left_5_9 p_right_5_9 p_down_5_9 p_up_5_9
 p_left_5_10 p_right_5_10 p_down_5_10 p_up_5_10 p_left_5_11 p_right_5_11
 p_down_5_11 p_up_5_11 p_left_5_12 p_right_5_12 p_down_5_12 p_up_5_12
 p_left_5_13 p_right_5_13 p_down_5_13 p_up_5_13 p_left_5_14 p_right_5_14
 p_down_5_14 p_up_5_14 p_left_6_7 p_right_6_7 p_down_6_7 p_up_6_7
 p_left_6_8 p_right_6_8 p_down_6_8 p_up_6_8 p_left_6_9 p_right_6_9
 p_down_6_9 p_up_6_9 p_left_6_10 p_right_6_10 p_down_6_10 p_up_6_10
 p_left_6_11 p_right_6_11 p_down_6_11 p_up_6_11 p_left_6_12 p_right_6_12
 p_down_6_12 p_up_6_12 p_left_6_13 p_right_6_13 p_down_6_13 p_up_6_13
 p_left_6_14 p_right_6_14 p_down_6_14 p_up_6_14 p_left_7_8 p_right_7_8
 p_down_7_8 p_up_7_8 p_left_7_9 p_right_7_9 p_down_7_9 p_up_7_9 p_left_7_10
 p_right_7_10 p_down_7_10 p_up_7_10 p_left_7_11 p_right_7_11 p_down_7_11
 p_up_7_11 p_left_7_12 p_right_7_12 p_down_7_12 p_up_7_12 p_left_7_13
 p_right_7_13 p_down_7_13 p_up_7_13 p_left_7_14 p_right_7_14 p_down_7_14
 p_up_7_14 p_left_8_9 p_right_8_9 p_down_8_9 p_up_8_9 p_left_8_10
 p_right_8_10 p_down_8_10 p_up_8_10 p_left_8_11 p_right_8_11 p_down_8_11
 p_up_8_11 p_left_8_12 p_right_8_12 p_down_8_12 p_up_8_12 p_left_8_13
 p_right_8_13 p_down_8_13 p_up_8_13 p_left_8_14 p_right_8_14 p_down_8_14
 p_up_8_14 p_left_9_10 p_right_9_10 p_down_9_10 p_up_9_10 p_left_9_11
 p_right_9_11 p_down_9_11 p_up_9_11 p_left_9_12 p_right_9_12 p_down_9_12
 p_up_9_12 p_left_9_13 p_right_9_13 p_down_9_13 p_up_9_13 p_left_9_14
 p_right_9_14 p_down_9_14 p_up_9_14 p_left_10_11 p_right_10_11 p_down_10_11
 p_up_10_11 p_left_10_12 p_right_10_12 p_down_10_12 p_up_10_12 p_left_10_13
 p_right_10_13 p_down_10_13 p_up_10_13 p_left_10_14 p_right_10_14
 p_down_10_14 p_up_10_14 p_left_11_12 p_right_11_12 p_down_11_12 p_up_11_12
 p_left_11_13 p_right_11_13 p_down_11_13 p_up_11_13 p_left_11_14
 p_right_11_14 p_down_11_14 p_up_11_14 p_left_12_13 p_right_12_13
 p_down_12_13 p_up_12_13 p_left_12_14 p_right_12_14 p_down_12_14 p_up_12_14
 p_left_13_14 p_right_13_14 p_down_13_14 p_up_13_14 p_EMIB_left_0_7_0_9
 p_EMIB_right_0_7_0_9 p_EMIB_down_0_7_0_9 p_EMIB_up_0_7_0_9
 p_EMIB_left_0_7_5_7 p_EMIB_right_0_7_5_7 p_EMIB_down_0_7_5_7
 p_EMIB_up_0_7_5_7 p_EMIB_left_0_7_7_13 p_EMIB_right_0_7_7_13
 p_EMIB_down_0_7_7_13 p_EMIB_up_0_7_7_13 p_EMIB_left_0_7_7_14
 p_EMIB_right_0_7_7_14 p_EMIB_down_0_7_7_14 p_EMIB_up_0_7_7_14
 p_EMIB_left_0_9_5_9 p_EMIB_right_0_9_5_9 p_EMIB_down_0_9_5_9
 p_EMIB_up_0_9_5_9 p_EMIB_left_0_9_9_14 p_EMIB_right_0_9_9_14
 p_EMIB_down_0_9_9_14 p_EMIB_up_0_9_9_14 p_EMIB_left_1_4_1_8
 p_EMIB_right_1_4_1_8 p_EMIB_down_1_4_1_8 p_EMIB_up_1_4_1_8
 p_EMIB_left_1_4_1_11 p_EMIB_right_1_4_1_11 p_EMIB_down_1_4_1_11
 p_EMIB_up_1_4_1_11 p_EMIB_left_1_4_1_13 p_EMIB_right_1_4_1_13
 p_EMIB_down_1_4_1_13 p_EMIB_up_1_4_1_13 p_EMIB_left_1_8_1_11
 p_EMIB_right_1_8_1_11 p_EMIB_down_1_8_1_11 p_EMIB_up_1_8_1_11
 p_EMIB_left_1_8_1_13 p_EMIB_right_1_8_1_13 p_EMIB_down_1_8_1_13
 p_EMIB_up_1_8_1_13 p_EMIB_left_1_11_1_13 p_EMIB_right_1_11_1_13
 p_EMIB_down_1_11_1_13 p_EMIB_up_1_11_1_13 p_EMIB_left_1_11_3_11
 p_EMIB_right_1_11_3_11 p_EMIB_down_1_11_3_11 p_EMIB_up_1_11_3_11
 p_EMIB_left_1_11_5_11 p_EMIB_right_1_11_5_11 p_EMIB_down_1_11_5_11
 p_EMIB_up_1_11_5_11 p_EMIB_left_1_11_11_12 p_EMIB_right_1_11_11_12
 p_EMIB_down_1_11_11_12 p_EMIB_up_1_11_11_12 p_EMIB_left_1_13_7_13
 p_EMIB_right_1_13_7_13 p_EMIB_down_1_13_7_13 p_EMIB_up_1_13_7_13
 p_EMIB_left_1_13_12_13 p_EMIB_right_1_13_12_13 p_EMIB_down_1_13_12_13
 p_EMIB_up_1_13_12_13 p_EMIB_left_1_13_13_14 p_EMIB_right_1_13_13_14
 p_EMIB_down_1_13_13_14 p_EMIB_up_1_13_13_14 p_EMIB_left_2_3_2_5
 p_EMIB_right_2_3_2_5 p_EMIB_down_2_3_2_5 p_EMIB_up_2_3_2_5
 p_EMIB_left_2_3_2_14 p_EMIB_right_2_3_2_14 p_EMIB_down_2_3_2_14
 p_EMIB_up_2_3_2_14 p_EMIB_left_2_3_3_11 p_EMIB_right_2_3_3_11
 p_EMIB_down_2_3_3_11 p_EMIB_up_2_3_3_11 p_EMIB_left_2_5_2_14
 p_EMIB_right_2_5_2_14 p_EMIB_down_2_5_2_14 p_EMIB_up_2_5_2_14
 p_EMIB_left_2_5_5_7 p_EMIB_right_2_5_5_7 p_EMIB_down_2_5_5_7
 p_EMIB_up_2_5_5_7 p_EMIB_left_2_5_5_9 p_EMIB_right_2_5_5_9
 p_EMIB_down_2_5_5_9 p_EMIB_up_2_5_5_9 p_EMIB_left_2_5_5_11
 p_EMIB_right_2_5_5_11 p_EMIB_down_2_5_5_11 p_EMIB_up_2_5_5_11
 p_EMIB_left_2_5_5_12 p_EMIB_right_2_5_5_12 p_EMIB_down_2_5_5_12
 p_EMIB_up_2_5_5_12 p_EMIB_left_2_5_5_14 p_EMIB_right_2_5_5_14
 p_EMIB_down_2_5_5_14 p_EMIB_up_2_5_5_14 p_EMIB_left_2_14_5_14
 p_EMIB_right_2_14_5_14 p_EMIB_down_2_14_5_14 p_EMIB_up_2_14_5_14
 p_EMIB_left_2_14_7_14 p_EMIB_right_2_14_7_14 p_EMIB_down_2_14_7_14
 p_EMIB_up_2_14_7_14 p_EMIB_left_2_14_9_14 p_EMIB_right_2_14_9_14
 p_EMIB_down_2_14_9_14 p_EMIB_up_2_14_9_14 p_EMIB_left_2_14_13_14
 p_EMIB_right_2_14_13_14 p_EMIB_down_2_14_13_14 p_EMIB_up_2_14_13_14
 p_EMIB_left_3_11_5_11 p_EMIB_right_3_11_5_11 p_EMIB_down_3_11_5_11
 p_EMIB_up_3_11_5_11 p_EMIB_left_3_11_11_12 p_EMIB_right_3_11_11_12
 p_EMIB_down_3_11_11_12 p_EMIB_up_3_11_11_12 p_EMIB_left_5_7_5_9
 p_EMIB_right_5_7_5_9 p_EMIB_down_5_7_5_9 p_EMIB_up_5_7_5_9
 p_EMIB_left_5_7_5_11 p_EMIB_right_5_7_5_11 p_EMIB_down_5_7_5_11
 p_EMIB_up_5_7_5_11 p_EMIB_left_5_7_5_12 p_EMIB_right_5_7_5_12
 p_EMIB_down_5_7_5_12 p_EMIB_up_5_7_5_12 p_EMIB_left_5_7_5_14
 p_EMIB_right_5_7_5_14 p_EMIB_down_5_7_5_14 p_EMIB_up_5_7_5_14
 p_EMIB_left_5_7_7_13 p_EMIB_right_5_7_7_13 p_EMIB_down_5_7_7_13
 p_EMIB_up_5_7_7_13 p_EMIB_left_5_7_7_14 p_EMIB_right_5_7_7_14
 p_EMIB_down_5_7_7_14 p_EMIB_up_5_7_7_14 p_EMIB_left_5_9_5_11
 p_EMIB_right_5_9_5_11 p_EMIB_down_5_9_5_11 p_EMIB_up_5_9_5_11
 p_EMIB_left_5_9_5_12 p_EMIB_right_5_9_5_12 p_EMIB_down_5_9_5_12
 p_EMIB_up_5_9_5_12 p_EMIB_left_5_9_5_14 p_EMIB_right_5_9_5_14
 p_EMIB_down_5_9_5_14 p_EMIB_up_5_9_5_14 p_EMIB_left_5_9_9_14
 p_EMIB_right_5_9_9_14 p_EMIB_down_5_9_9_14 p_EMIB_up_5_9_9_14
 p_EMIB_left_5_11_5_12 p_EMIB_right_5_11_5_12 p_EMIB_down_5_11_5_12
 p_EMIB_up_5_11_5_12 p_EMIB_left_5_11_5_14 p_EMIB_right_5_11_5_14
 p_EMIB_down_5_11_5_14 p_EMIB_up_5_11_5_14 p_EMIB_left_5_11_11_12
 p_EMIB_right_5_11_11_12 p_EMIB_down_5_11_11_12 p_EMIB_up_5_11_11_12
 p_EMIB_left_5_12_5_14 p_EMIB_right_5_12_5_14 p_EMIB_down_5_12_5_14
 p_EMIB_up_5_12_5_14 p_EMIB_left_5_12_6_12 p_EMIB_right_5_12_6_12
 p_EMIB_down_5_12_6_12 p_EMIB_up_5_12_6_12 p_EMIB_left_5_12_10_12
 p_EMIB_right_5_12_10_12 p_EMIB_down_5_12_10_12 p_EMIB_up_5_12_10_12
 p_EMIB_left_5_12_11_12 p_EMIB_right_5_12_11_12 p_EMIB_down_5_12_11_12
 p_EMIB_up_5_12_11_12 p_EMIB_left_5_12_12_13 p_EMIB_right_5_12_12_13
 p_EMIB_down_5_12_12_13 p_EMIB_up_5_12_12_13 p_EMIB_left_5_14_7_14
 p_EMIB_right_5_14_7_14 p_EMIB_down_5_14_7_14 p_EMIB_up_5_14_7_14
 p_EMIB_left_5_14_9_14 p_EMIB_right_5_14_9_14 p_EMIB_down_5_14_9_14
 p_EMIB_up_5_14_9_14 p_EMIB_left_5_14_13_14 p_EMIB_right_5_14_13_14
 p_EMIB_down_5_14_13_14 p_EMIB_up_5_14_13_14 p_EMIB_left_6_12_10_12
 p_EMIB_right_6_12_10_12 p_EMIB_down_6_12_10_12 p_EMIB_up_6_12_10_12
 p_EMIB_left_6_12_11_12 p_EMIB_right_6_12_11_12 p_EMIB_down_6_12_11_12
 p_EMIB_up_6_12_11_12 p_EMIB_left_6_12_12_13 p_EMIB_right_6_12_12_13
 p_EMIB_down_6_12_12_13 p_EMIB_up_6_12_12_13 p_EMIB_left_7_13_7_14
 p_EMIB_right_7_13_7_14 p_EMIB_down_7_13_7_14 p_EMIB_up_7_13_7_14
 p_EMIB_left_7_13_12_13 p_EMIB_right_7_13_12_13 p_EMIB_down_7_13_12_13
 p_EMIB_up_7_13_12_13 p_EMIB_left_7_13_13_14 p_EMIB_right_7_13_13_14
 p_EMIB_down_7_13_13_14 p_EMIB_up_7_13_13_14 p_EMIB_left_7_14_9_14
 p_EMIB_right_7_14_9_14 p_EMIB_down_7_14_9_14 p_EMIB_up_7_14_9_14
 p_EMIB_left_7_14_13_14 p_EMIB_right_7_14_13_14 p_EMIB_down_7_14_13_14
 p_EMIB_up_7_14_13_14 p_EMIB_left_9_14_13_14 p_EMIB_right_9_14_13_14
 p_EMIB_down_9_14_13_14 p_EMIB_up_9_14_13_14 p_EMIB_left_10_12_11_12
 p_EMIB_right_10_12_11_12 p_EMIB_down_10_12_11_12 p_EMIB_up_10_12_11_12
 p_EMIB_left_10_12_12_13 p_EMIB_right_10_12_12_13 p_EMIB_down_10_12_12_13
 p_EMIB_up_10_12_12_13 p_EMIB_left_11_12_12_13 p_EMIB_right_11_12_12_13
 p_EMIB_down_11_12_12_13 p_EMIB_up_11_12_12_13 p_EMIB_left_12_13_13_14
 p_EMIB_right_12_13_13_14 p_EMIB_down_12_13_13_14 p_EMIB_up_12_13_13_14
 dx_grid_abs_pair_0_1_is_positive dy_grid_abs_pair_0_1_is_positive
 dx_grid_abs_pair_0_7_is_positive dy_grid_abs_pair_0_7_is_positive
 dx_grid_abs_pair_0_9_is_positive dy_grid_abs_pair_0_9_is_positive
 dx_grid_abs_pair_1_7_is_positive dy_grid_abs_pair_1_7_is_positive
 dx_grid_abs_pair_1_9_is_positive dy_grid_abs_pair_1_9_is_positive
 dx_grid_abs_pair_7_9_is_positive dy_grid_abs_pair_7_9_is_positive
 dx_center_abs_0_is_positive dy_center_abs_0_is_positive
 dx_center_abs_1_is_positive dy_center_abs_1_is_positive
 dx_center_abs_7_is_positive dy_center_abs_7_is_positive
 dx_center_abs_9_is_positive dy_center_abs_9_is_positive
 dx_abs_0_1_is_positive dy_abs_0_1_is_positive dx_abs_0_2_is_positive
 dy_abs_0_2_is_positive dx_abs_0_3_is_positive dy_abs_0_3_is_positive
 dx_abs_0_8_is_positive dy_abs_0_8_is_positive dx_abs_1_7_is_positive
 dy_abs_1_7_is_positive dx_abs_2_9_is_positive dy_abs_2_9_is_positive
 dx_abs_2_12_is_positive dy_abs_2_12_is_positive dx_abs_3_7_is_positive
 dy_abs_3_7_is_positive dx_abs_3_8_is_positive dy_abs_3_8_is_positive
 dx_abs_3_13_is_positive dy_abs_3_13_is_positive dx_abs_4_11_is_positive
 dy_abs_4_11_is_positive dx_abs_4_14_is_positive dy_abs_4_14_is_positive
 dx_abs_5_10_is_positive dy_abs_5_10_is_positive dx_abs_6_14_is_positive
 dy_abs_6_14_is_positive dx_abs_7_9_is_positive dy_abs_7_9_is_positive
 dx_abs_8_13_is_positive dy_abs_8_13_is_positive dx_abs_9_12_is_positive
 dy_abs_9_12_is_positive dx_abs_10_11_is_positive dy_abs_10_11_is_positive
 dx_abs_10_13_is_positive dy_abs_10_13_is_positive dx_abs_11_14_is_positive
 dy_abs_11_14_is_positive dx_abs_i_0_7_is_positive dy_abs_i_0_7_is_positive
 dx_abs_j_0_7_is_positive dy_abs_j_0_7_is_positive dx_abs_i_0_9_is_positive
 dy_abs_i_0_9_is_positive dx_abs_j_0_9_is_positive dy_abs_j_0_9_is_positive
 dx_abs_i_1_4_is_positive dy_abs_i_1_4_is_positive dx_abs_j_1_4_is_positive
 dy_abs_j_1_4_is_positive dx_abs_i_1_8_is_positive dy_abs_i_1_8_is_positive
 dx_abs_j_1_8_is_positive dy_abs_j_1_8_is_positive
 dx_abs_i_1_11_is_positive dy_abs_i_1_11_is_positive
 dx_abs_j_1_11_is_positive dy_abs_j_1_11_is_positive
 dx_abs_i_1_13_is_positive dy_abs_i_1_13_is_positive
 dx_abs_j_1_13_is_positive dy_abs_j_1_13_is_positive
 dx_abs_i_2_3_is_positive dy_abs_i_2_3_is_positive dx_abs_j_2_3_is_positive
 dy_abs_j_2_3_is_positive dx_abs_i_2_5_is_positive dy_abs_i_2_5_is_positive
 dx_abs_j_2_5_is_positive dy_abs_j_2_5_is_positive
 dx_abs_i_2_14_is_positive dy_abs_i_2_14_is_positive
 dx_abs_j_2_14_is_positive dy_abs_j_2_14_is_positive
 dx_abs_i_3_11_is_positive dy_abs_i_3_11_is_positive
 dx_abs_j_3_11_is_positive dy_abs_j_3_11_is_positive
 dx_abs_i_5_7_is_positive dy_abs_i_5_7_is_positive dx_abs_j_5_7_is_positive
 dy_abs_j_5_7_is_positive dx_abs_i_5_9_is_positive dy_abs_i_5_9_is_positive
 dx_abs_j_5_9_is_positive dy_abs_j_5_9_is_positive
 dx_abs_i_5_11_is_positive dy_abs_i_5_11_is_positive
 dx_abs_j_5_11_is_positive dy_abs_j_5_11_is_positive
 dx_abs_i_5_12_is_positive dy_abs_i_5_12_is_positive
 dx_abs_j_5_12_is_positive dy_abs_j_5_12_is_positive
 dx_abs_i_5_14_is_positive dy_abs_i_5_14_is_positive
 dx_abs_j_5_14_is_positive dy_abs_j_5_14_is_positive
 dx_abs_i_6_12_is_positive dy_abs_i_6_12_is_positive
 dx_abs_j_6_12_is_positive dy_abs_j_6_12_is_positive
 dx_abs_i_7_13_is_positive dy_abs_i_7_13_is_positive
 dx_abs_j_7_13_is_positive dy_abs_j_7_13_is_positive
 dx_abs_i_7_14_is_positive dy_abs_i_7_14_is_positive
 dx_abs_j_7_14_is_positive dy_abs_j_7_14_is_positive
 dx_abs_i_9_14_is_positive dy_abs_i_9_14_is_positive
 dx_abs_j_9_14_is_positive dy_abs_j_9_14_is_positive
 dx_abs_i_10_12_is_positive dy_abs_i_10_12_is_positive
 dx_abs_j_10_12_is_positive dy_abs_j_10_12_is_positive
 dx_abs_i_11_12_is_positive dy_abs_i_11_12_is_positive
 dx_abs_j_11_12_is_positive dy_abs_j_11_12_is_positive
 dx_abs_i_12_13_is_positive dy_abs_i_12_13_is_positive
 dx_abs_j_12_13_is_positive dy_abs_j_12_13_is_positive
 dx_abs_i_13_14_is_positive dy_abs_i_13_14_is_positive
 dx_abs_j_13_14_is_positive dy_abs_j_13_14_is_positive
End

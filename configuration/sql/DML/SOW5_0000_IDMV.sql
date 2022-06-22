--
INSERT INTO ft_t_idmv (intrnl_dmn_val_id, fld_data_cl_id, fld_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_txt, intrnl_dmn_val_nme, intrnl_dmn_desc, data_src_id, data_stat_typ)  SELECT 'ICCREA0001','DSRCID','',SYSDATE,'ICR:CSTM','N','MANUAL','Manual','Manual','ICCREACSTM','ACTIVE'     FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM ft_t_idmv WHERE fld_data_cl_id = 'DSRCID' AND intrnl_dmn_val_txt = 'MANUAL');
update ft_t_idmv set intrnl_dmn_desc = 'MANUAL', last_chg_usr_id = 'ICR:CSTM' where fld_data_cl_id = 'DSRCID' AND intrnl_dmn_val_txt = 'MANUAL';


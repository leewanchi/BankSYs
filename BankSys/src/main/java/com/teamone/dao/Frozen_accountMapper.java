package com.teamone.dao;

import com.teamone.entity.Frozen_account;


public interface Frozen_accountMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table frozen_account
     *
     * @mbggenerated Fri Jul 28 15:07:17 CST 2017
     */
    int deleteByPrimaryKey(String frozenId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table frozen_account
     *
     * @mbggenerated Fri Jul 28 15:07:17 CST 2017
     */
    int insert(Frozen_account record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table frozen_account
     *
     * @mbggenerated Fri Jul 28 15:07:17 CST 2017
     */
    int insertSelective(Frozen_account record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table frozen_account
     *
     * @mbggenerated Fri Jul 28 15:07:17 CST 2017
     */
    Frozen_account selectByPrimaryKey(String frozenId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table frozen_account
     *
     * @mbggenerated Fri Jul 28 15:07:17 CST 2017
     */
    int updateByPrimaryKeySelective(Frozen_account record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table frozen_account
     *
     * @mbggenerated Fri Jul 28 15:07:17 CST 2017
     */
    int updateByPrimaryKey(Frozen_account record);

    /**
     * @author vnbuser
     *根据ID与时间同时查找
     */
    Frozen_account selectFrozenByIdAndTime(Frozen_account record);
}
package com.teamone.dao;

import com.teamone.entity.Log;


public interface LogMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated Fri Jul 28 15:07:17 CST 2017
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated Fri Jul 28 15:07:17 CST 2017
     */
    int insert(Log record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated Fri Jul 28 15:07:17 CST 2017
     */
    int insertSelective(Log record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated Fri Jul 28 15:07:17 CST 2017
     */
    Log selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated Fri Jul 28 15:07:17 CST 2017
     */
    int updateByPrimaryKeySelective(Log record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table log
     *
     * @mbggenerated Fri Jul 28 15:07:17 CST 2017
     */
    int updateByPrimaryKey(Log record);
}
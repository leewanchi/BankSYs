package com.teamone.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamone.entity.Bigmoney;

public interface BigmoneyMapper {
    int deleteByPrimaryKey(Long billId);

    int insert(Bigmoney record);

    int insertSelective(Bigmoney record);

    Bigmoney selectByPrimaryKey(Long billId);

    int updateByPrimaryKeySelective(Bigmoney record);

    int updateByPrimaryKey(Bigmoney record);
    
    List<Bigmoney> getAllBigBills();
    
    List<Bigmoney> getAllApplies(@Param("tellerId")Integer tellerId);
}
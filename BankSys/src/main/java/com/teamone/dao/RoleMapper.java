package com.teamone.dao;

import com.teamone.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Long roleId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Long roleId);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    List<Role> getAllRoles();

    /**
     * 添加角色权限关联
     * @param roleId
     * @param permissionId
     * @return
     */
    int insertRolePermission(@Param("roleId") Long roleId,@Param("permissionId") Long permissionId);

    /**
     * 删除角色权限关联
     * @param roleId
     * @return
     */
    int deleteRolePermission(@Param("roleId") Long roleId);
    
    /**
     * 只获取role信息，不关联permission
     * @return
     */
    List<Role> getRoleNames();

}
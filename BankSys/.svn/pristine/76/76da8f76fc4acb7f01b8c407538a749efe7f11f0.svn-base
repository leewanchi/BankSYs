package com.teamone.sevice;

import com.teamone.dto.PermissionExcution;
import com.teamone.entity.Role;

import java.util.List;

/**
 * Created by kay on 2017/8/2.
 */
public interface RoleService {

    int createRole(String roleName,String description);

    int updateRole(Role role);

    int deleteRole(Long roleId);

    List<Role> queryRoles();

    Role getRoleById(Long roleId);

    /**
     * 批量建立角色关联
     * @param roleId
     * @param permissionIds
     * @return
     */
    PermissionExcution createRolePermissions(Long roleId, String permissionIds);

    /**
     * 删除角色权限关系
     * @param roleId
     * @return
     */
    int clearRolePermissions(Long roleId);

    List<Role> getRoleNames();
}

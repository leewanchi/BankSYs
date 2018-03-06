package com.teamone.service.impl;

import com.teamone.dao.RoleMapper;
import com.teamone.dto.PermissionExcution;
import com.teamone.entity.Permission;
import com.teamone.entity.Role;
import com.teamone.sevice.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by kay on 2017/8/2.
 */
@Service
public class RoleServiceImpl implements RoleService{

    @Autowired
    private RoleMapper roleMapper;


    //新建角色
    public int createRole(String roleName,String description) {
        Role role=new Role();
        role.setRoleName(roleName);
        role.setDescription(description);
        System.out.println("----------新建角色-----------");
        return roleMapper.insertSelective(role);
    }

    public int updateRole(Role role) {
        return roleMapper.updateByPrimaryKeySelective(role);
    }


    //删除角色的时候要删除  用户-角色表里的对应关系
    public int deleteRole(Long roleId) {
        int count=clearRolePermissions(roleId);
        count+=roleMapper.deleteByPrimaryKey(roleId);
        return count;
    }

    //查询所有角色，包括附带的权限
    public List<Role> queryRoles() {
        return roleMapper.getAllRoles();
    }

    public Role getRoleById(Long roleId) {
        return roleMapper.selectByPrimaryKey(roleId);
    }

    /**
     * 批量建立角色权限关联   2种情况：1.角色为新建，则分配权限时直接创建角色-权限关联
     * @param roleId              2.角色已有权限需重新分配，先删除所有关联，再建立关联
     * @param permissionIds
     * @return
     */
    @Transactional
    public PermissionExcution createRolePermissions(Long roleId, String permissionIds) {
        //清空权限
    	
    	System.out.println("-------------新建角色权限--------------");
    	
        if(permissionIds==null || permissionIds.equals("")){
        	
            clearRolePermissions(roleId);
            return new PermissionExcution(true,PermissionExcution.EMPTY);
        }


        Role role=roleMapper.selectByPrimaryKey(roleId);
        if(role!=null && role.getPermissionList()!=null){
        	System.out.println("----------------未改变-----------------");
            String pid="";
            for(Permission p:role.getPermissionList()){
                pid+=p.getId().toString().concat(",");
            }

            //权限未改变直接返回
            if(pid.equals(permissionIds)){
                return new PermissionExcution(false,PermissionExcution.REMAIN);
            }
            //否则清空
            clearRolePermissions(roleId);
        }


        permissionIds=permissionIds.substring(0,permissionIds.lastIndexOf(","));
        String[] pIds=permissionIds.split(",");
        for (int i=0;i<pIds.length;i++){
            //建立关联
        	System.out.println("------------建立关联-------------");
            roleMapper.insertRolePermission(roleId,Long.parseLong(pIds[i]));
        }

        return new PermissionExcution(true,PermissionExcution.SUCCESS);
    }

    /**
     * 删除该角色权限关联关系
     * @param roleId
     * @param permissionIds
     * @return
     */
    public int clearRolePermissions(Long roleId) {
        return roleMapper.deleteRolePermission(roleId);
    }

    public List<Role> getRoleNames() {
        return roleMapper.getRoleNames();
    }
}

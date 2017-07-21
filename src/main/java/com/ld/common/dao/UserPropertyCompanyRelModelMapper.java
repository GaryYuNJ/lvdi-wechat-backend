package com.ld.common.dao;

import com.ld.common.model.UserPropertyCompanyRelModel;

public interface UserPropertyCompanyRelModelMapper {
    int insert(UserPropertyCompanyRelModel record);

    int insertSelective(UserPropertyCompanyRelModel record);
}
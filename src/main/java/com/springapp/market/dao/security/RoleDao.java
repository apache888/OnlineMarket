package com.springapp.market.dao.security;

import com.springapp.market.model.security.Role;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created on 25.05.2017
 *
 * @author Roman Hayda
 */
public interface RoleDao extends JpaRepository<Role, Long> {

}

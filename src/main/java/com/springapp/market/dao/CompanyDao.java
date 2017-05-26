package com.springapp.market.dao;

import com.springapp.market.model.Company;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created on 25.05.2017
 *
 * @author Roman Hayda
 */
public interface CompanyDao extends JpaRepository<Company, Long> {

}

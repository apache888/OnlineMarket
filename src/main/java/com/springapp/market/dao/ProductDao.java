package com.springapp.market.dao;

import com.springapp.market.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * Created on 25.05.2017
 *
 * @author Roman Hayda
 */
public interface ProductDao extends JpaRepository<Product,Long> {
    @Override
    @Query("select p from Product p where p.id = ?1")
    Product getOne(Long id);
}

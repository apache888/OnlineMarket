package com.springapp.market.service;

import com.springapp.market.dao.CompanyDao;
import com.springapp.market.model.Company;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created on 25.05.2017
 *
 * Implementation of {@link CompanyService} interface.
 *
 * @author Roman Hayda
 */
@Service
//@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyDao companyDao;

    @Override
    @Transactional
    public Company getCompanyById(long id) {
        return companyDao.getOne(id);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void addCompany(Company company) {
        companyDao.saveAndFlush(company);
    }

    @Override
    @Transactional
    public void removeCompany(long id) {
        companyDao.delete(id);
    }

    @Override
    @Transactional
    public void updateCompany(Company company) {
        companyDao.saveAndFlush(company);
    }

    @Override
    public List<Company> listCompanies() {
        return companyDao.findAll();
    }
}

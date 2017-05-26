package com.springapp.market.controller;

import com.springapp.market.model.Company;
import com.springapp.market.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created on 25.05.2017
 *
 * Request mapping for {@link com.springapp.market.model.Company}.
 *
 * @author Roman Hayda
 */
@Controller
public class CompanyController {
    private CompanyService companyService;

    @Autowired
    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    @RequestMapping(value = "/companies", method = RequestMethod.GET)
    public String listCompanies(Model model) {
        model.addAttribute("company", new Company());
        model.addAttribute("listCompanies", this.companyService.listCompanies());

        return "companies";
    }

//    @RequestMapping(value = "companies/add", method = RequestMethod.GET)
//    public ModelAndView addCompany(@ModelAttribute("company") Company company, BindingResult result) {
//        Map<String, Object> model = new HashMap<String, Object>();
//        model.put("companies", companyService.listCompanies());
//        return new ModelAndView("redirect:/companies", model);
//    }

    @RequestMapping(value = "/save_company", method = RequestMethod.POST)
    public ModelAndView saveCompany(@ModelAttribute("company") Company company, BindingResult result) {
        this.companyService.addCompany(company);
        return new ModelAndView("redirect:/companies");
    }

    @RequestMapping("/remove_company/{id}")
    public String removeCompany(@PathVariable("id") int id) {
        this.companyService.removeCompany(id);

        return "redirect:/companies";
    }

    @RequestMapping("/edit_company/{id}")
    public String editProduct(@PathVariable("id") int id, Model model) {
        model.addAttribute("company", this.companyService.getCompanyById(id));
        model.addAttribute("listCompanies", this.companyService.listCompanies());

        return "companies";
    }

    @RequestMapping("/company_info/{id}")
    public String companyInfo(@PathVariable("id") int id, Model model) {
        model.addAttribute("company", this.companyService.getCompanyById(id));

        return "company_info";
    }
}
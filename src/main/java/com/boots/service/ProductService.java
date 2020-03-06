package com.boots.service;

import com.boots.entity.Product;
import com.boots.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;
@Service
public class ProductService {
    @PersistenceContext
    private EntityManager em;
    @Autowired
    private ProductRepository repository;

//    @GetMapping("/users")
    public List<Product> allProduct() {
        return repository.findAll();
    }

    public List<Product> filteredProduct(Date startDate,  Date endDate) {
        return repository.findAllByDateCreateBetween(startDate,endDate);
    }

}

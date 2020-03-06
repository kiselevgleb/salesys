package com.boots.repository;

import com.boots.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Long> {

    @Override
    List<Product> findAll();

//    List<Product> findAllByDateStartLessThanEqualAndDateStartGreaterThanEqual(Date startDate, Date endDate);
    List<Product> findAllByDateCreateBetween(Date startDate, Date endDate);
}
package com.magasin.service;

import com.magasin.model.entity.Offer;
import com.magasin.repository.OfferRepository;

import java.util.List;

public class OfferService {
    private final OfferRepository offerRepository = new OfferRepository();

    public List<Offer> findAll() { return offerRepository.findAll(); }
    public List<Offer> findActiveOffers() { return offerRepository.findActiveOffers(); }
    public Offer findById(Long id) { return offerRepository.findById(id); }
    public Offer save(Offer offer) { return offerRepository.save(offer); }
    public Offer update(Offer offer) { return offerRepository.update(offer); }
    public void delete(Long id) { offerRepository.delete(id); }
}


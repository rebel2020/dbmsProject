package com.brijesh.dao;

import java.util.List;

import com.brijesh.model.Offer;

public interface Offerdao {
	public Boolean isEnabled(int offerId);
	public Offer getOffer(int offerId);
	public void addOffer(Offer offer);
	public void deleteOffer(int offerId);
	public void applyOffer(String userId,int offerId);
	public List<Offer> getOffers();
	public List<Offer> getAllOffers();
	public void switchStatus(int offerId);
}

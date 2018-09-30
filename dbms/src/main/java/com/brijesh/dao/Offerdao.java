package com.brijesh.dao;

import com.brijesh.model.Offer;

public interface Offerdao {
	public Boolean isEnabled(int offerId);
	public Offer getOffer(int offerId);
	public void addOffer(Offer offer);
	public void deleteOffer(int offerId);
}

package com.brijesh.model;

import javax.validation.constraints.*;
public class Offer {
	@Min(0)
	@Max(100)
	int percentageOff;
	int offerId;
	@Size(min=1,max=30)
	String offerName;
	Boolean enabled;
	public int getPercentageOff() {
		return percentageOff;
	}
	public void setPercentageOff(int percentageOff) {
		this.percentageOff = percentageOff;
	}
	public int getOfferId() {
		return offerId;
	}
	public void setOfferId(int offerId) {
		this.offerId = offerId;
	}
	public String getOfferName() {
		return offerName;
	}
	public void setOfferName(String offerName) {
		this.offerName = offerName;
	}
	public Boolean getEnabled() {
		return enabled;
	}
	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

}

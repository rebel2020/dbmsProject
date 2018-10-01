package com.brijesh.dao;

import java.util.List;

import com.brijesh.model.OfflineRecord;

public interface Offlinedao {
	public void newRecord(OfflineRecord offlinerecord);
	public OfflineRecord getRecord(int offerId);
	public List<OfflineRecord> getAllRecords();
}

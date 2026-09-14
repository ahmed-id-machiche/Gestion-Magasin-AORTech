package com.magasin.repository;

import com.magasin.model.entity.SupportMessage;

public class SupportMessageRepository extends AbstractRepository<SupportMessage> {
    public SupportMessageRepository() {
        super(SupportMessage.class);
    }
}


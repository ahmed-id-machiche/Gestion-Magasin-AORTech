package com.magasin.service;

import com.magasin.model.entity.SupportMessage;
import com.magasin.repository.SupportMessageRepository;

public class SupportMessageService {
    private final SupportMessageRepository repository = new SupportMessageRepository();

    public SupportMessage save(SupportMessage message) {
        return repository.save(message);
    }
}


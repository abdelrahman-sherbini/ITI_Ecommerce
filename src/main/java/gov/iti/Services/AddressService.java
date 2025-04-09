package gov.iti.Services;

import gov.iti.Entities.UserAddress;
import jakarta.persistence.EntityManager;

public class AddressService {
    private EntityManager entityManager;
    private  CRUDService<UserAddress> crudService;
    // Constructor to inject EntityManager
    public AddressService(EntityManager entityManager) {
        this.entityManager = entityManager;
        crudService = new CRUDService<>(entityManager, UserAddress.class);
    }
    public boolean addAddress(UserAddress address) {
        return crudService.create(address);
    }

    public boolean updateAddress(UserAddress address) {
        return crudService.update(address);
    }
    public boolean deleteAddress(Long address_id) {
        UserAddress address = getAddressByID(address_id);
        return crudService.delete(address);
    }
    public UserAddress getAddressByID(Long address_id) {
        return crudService.find(address_id);
    }
}

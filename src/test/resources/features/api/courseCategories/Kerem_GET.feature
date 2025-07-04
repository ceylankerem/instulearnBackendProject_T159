Feature: [US_011] Bir yönetici olarak API bağlantısı üzerinden kurs kategorilerine erişebilmek istiyorum.

  Scenario: [TC_11.1] /api/pricePlans endpoint'ine geçerli authorization bilgileriyle GET request gönderildiğinde,
  dönen status code 200 ve response body remark bilgisi "başarılı" olmalı ve id(x)
  (creator_id, webinar_id, bundle_id, start_date, end_date, discount, capacity, order, created_at, updated_at,
  deleted_at, title, id, ticket_id, locale, title) bilgisi doğrulanmalıdır.
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/addPricePlan" path parametrelerini olusturur
    * Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * Api kullanicisi status codeun 200 oldugunu dogrular
    * Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin " <creator_id>, <webinar_id>, <bundle_id>, <start_date>, <end_date>, <discount>, <capacity>, <order>, <created_at>, <updated_at>, <deleted_at>, "<title>", <id>, <ticket_id>, "<locale>" " bilgilerini doğrular.


   Scenario: [TC_11.2] /api/pricePlans endpoint'ine geçersiz authorization bilgileriyle bir GET request gönderildiğinde,
   dönen status code  401 ve response body message'nin “Unauthenticated” olduğu doğrulanmalıdır.
     * Api kullanicisi "invalid" token ile base urli olusturur
     * Api kullanicisi "api/addPricePlan" path parametrelerini olusturur
     * Api kullanicisi GET request gonderir ve donen responsei kaydeder
     * Api kullanicisi status codeun 401 oldugunu dogrular
     * Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular
     * Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular
     # Eğer sonuncu adım kullanılmak zorunda kalır ise 3, 4 ve 5. adım yoruma alınacak
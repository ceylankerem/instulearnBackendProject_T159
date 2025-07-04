Feature: [US_012] Bir yönetici olarak API baglantisi üzerinden belirtilen id numarasına sahip
  course price plan'in detaylı bilgilerine erisebilmek istiyorum.

  Scenario: [TC_12.1] /api/pricePlan/{id} endpoint'ine gecerli authorization bilgileri ve dogru data (id) iceren bir
  GET request gönderildiginde dönen status code'in 200 ve response body'deki remark bilgisinin "success" oldugu dogrula
  ve response body icindeki list datalarının (id, creator_id, webinar_id, bundle_id, start_date, end_date, discount,
  capacity, order, created_at, updated_at, deleted_at, title, id, ticket_id, locale, title) içerik doğrulama testi
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/addPricePlan/<id>" path parametrelerini olusturur
    * Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * Api kullanicisi status codeun 200 oldugunu dogrular
    * Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin " <creator_id>, <webinar_id>, <bundle_id>, <start_date>, <end_date>, <discount>, <capacity>, <order>, <created_at>, <updated_at>, <deleted_at>, "<title>", <id>, <ticket_id>, "<locale>" " bilgilerini doğrular.


  Scenario:[TC_12.2] /api/pricePlan/{id} endpoint'ine gecerli authorization bilgileri ve kaydı olmayan bir (id) iceren
  bir GET request gönderildiginde dönen status code'in 203, response body'deki remark bilgisinin "failed" ve
  message bilgisinin de "There is not ticket for this id." oldugu doğrulama testi
    * Api kullanicisi "admin" token ile base urli olusturur
    * Api kullanicisi "api/addPricePlan/<id>" path parametrelerini olusturur
    * Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * Api kullanicisi status codeun 203 oldugunu dogrular
    * Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * Api kullanicisi response bodydeki message bilgisinin "There is not category for this id." oldugunu dogrular


   Scenario:[TC_12.3]  /api/pricePlan/{id} endpoint'ine gecerli authorization bilgileri ve (id) olmadan
   bir GET request gönderildiginde dönen status code'in 203, response body'deki remark bilgisinin "failed" ve
   message bilgisinin de "No id" oldugu doğrulama testi
     * Api kullanicisi "admin" token ile base urli olusturur
     * Api kullanicisi "api/addPricePlan/<id>" path parametrelerini olusturur
     * Api kullanicisi GET request gonderir ve donen responsei kaydeder
     * Api kullanicisi status codeun 203 oldugunu dogrular
     * Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
     * Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


    Scenario: [TC_12.4] /api/pricePlan/{id} endpoint'ine gecersiz (invalid token) authorization bilgileri ve dogru data
    (id) iceren bir GET req gönderildiginde dönen status code'in 401 ve response body'deki message bilgisinin
    "Unauthenticated."oldugu dogrulanma testi
      * Api kullanicisi "admin" token ile base urli olusturur
      * Api kullanicisi "api/addPricePlan/<id>" path parametrelerini olusturur
      * Api kullanicisi GET request gonderir ve donen responsei kaydeder
      * Api kullanicisi status codeun 401 oldugunu dogrular
      * Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular
      * Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular
      # Eğer sonuncu adım kullanılmak zorunda kalır ise 3, 4 ve 5. adım yoruma alınacak


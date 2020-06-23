// * info.plist
// Privacy - Contacts Usage Description : (String) Contact

// * 주의
// Xcode에서 실행해야 로그를 볼 수 있습니다


import Contacts

let store = CNContactStore()

    func getContact(){
       var contacts = [CNContact]()
       let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName), CNContactPhoneNumbersKey as CNKeyDescriptor]

       let request = CNContactFetchRequest(keysToFetch: keys)
       
       store.requestAccess(for: .contacts, completionHandler: {
           (granted , err) in
           if(granted){
               do {
                   try self.store.enumerateContacts(with: request) {
                   (contact, stop) in
                       if !contact.phoneNumbers.isEmpty {
                           contacts.append(contact)
                       }
                   }
                   for info in contacts{
                       guard let phone = info.phoneNumbers[0].value.value(forKey: "digits") else {
                           return
                       }
                       let name = info.familyName + info.givenName
                       print(phone)
                       print(name)
                       NSLog(name)
                   }
               } catch {
                   print("unable to fetch contacts")
               }
           }
           else {
               let toast = UIAlertController(title: "알림", message: "주소록 권한이 필요합니다.", preferredStyle: .alert)
               toast.addAction(UIAlertAction(title: "확인", style: .default, handler: {
                   (Action) -> Void in
                let settingsURL = NSURL(string: UIApplication.openSettingsURLString)! as URL
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                }
               }))
           }
       })
    }

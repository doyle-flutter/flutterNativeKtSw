// * permission
// <uses-permission android:name="android.permission.READ_CONTACTS" />
// <uses-permission android:name="android.permission.WRITE_CONTACTS" />

// * 주의
// 권한체크 부분이 제외되었기때문에 직접 앱에서 지정 필요
// 에뮬레이터에서 실행 할 경우 연락처를 입력해야 함

fun getContactList() {
        val uri: Uri = ContactsContract.Contacts.CONTENT_URI
        val projection = arrayOf(ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME) // 연락처 이름.
        val contactCursor: Cursor = this.contentResolver.query(uri, projection, null, null, null)
        val index = contactCursor.getColumnIndexOrThrow(ContactsContract.Contacts.DISPLAY_NAME)
        println(index)
        while (contactCursor.moveToNext()){
            println(contactCursor.getString(index))
        }
        return
    }

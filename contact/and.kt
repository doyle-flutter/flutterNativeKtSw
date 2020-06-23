// * permission
// <uses-permission android:name="android.permission.READ_CONTACTS" />
// <uses-permission android:name="android.permission.WRITE_CONTACTS" />

// * 주의
// (변경) 권한 요청 포함
// 에뮬레이터에서 실행 할 경우 연락처를 입력해야 함
// 서비스로 작업을 추천


    fun getContactPermissionCheck(){
        val PERMISSION_ALL = 1;
        val permissionCheck = android.Manifest.permission.READ_CONTACTS
        val permissionContents = Manifest.permission.READ_CONTACTS
        if(ActivityCompat.checkSelfPermission(this,permissionCheck) != PackageManager.PERMISSION_GRANTED){
            ActivityCompat.requestPermissions(this, arrayOf(permissionContents), PERMISSION_ALL)
            println("$permissionCheck : 필요")
        }
        else{
            if(thread.isAlive){
                return
            }
            else{
                thread.start()
            }
        }
    }

    inner class ThreadClass:Thread(){
        override fun run() {
            getContactList()
            super.run()
            return
        }
    }

    fun getContactList(){
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

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        println(requestCode)
        println(permissions)
        for(i in permissions){
            println(i)
        }
        for(v in grantResults){
            println(v)
        }
        if(grantResults[0] < 0){
            Toast.makeText(this@MainActivity, "권한이 필요합니다", Toast.LENGTH_LONG).show()
        }
        this.getContactPermissionCheck()
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
    }

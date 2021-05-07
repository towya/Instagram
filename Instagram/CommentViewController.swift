//
//  CommentViewController.swift
//  Instagram
//
//  Created by 稲葉任哉 on 2021/05/05.
//

import UIKit
import Firebase

class CommentViewController: UIViewController {
    @IBOutlet weak var textView: PlaceHolderTextView!
    
    // 投稿データを格納する配列
    //var postArray: [PostData] = []
    var x: PostData!
    
    @IBAction func postButton(_ sender: Any) {
        
        let commentText = textView.text!
        let commenterName = Auth.auth().currentUser!.displayName
        let commenter = "\(commenterName) : \(commentText)"
        let updateValue = FieldValue.arrayUnion([commenter])
        let Postdata = x
        let postRef = Firestore.firestore().collection(Const.PostPath).document(Postdata!.id )
        postRef.updateData(["comments": updateValue])
        self.dismiss(animated: true)
    }
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.placeHolder = "コメントを入力してください"
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

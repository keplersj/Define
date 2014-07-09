package k2b6s9j.Define

import org.scaloid.common._
import scala.language.postfixOps

class DefineActivity extends SActivity with SContext {

    /**
     * Called when the activity is first created.
     */
    onCreate {
      contentView = new SVerticalLayout {
        STextView(R.string.introduction)
        STextView(R.string.search)
        STextView(R.string.list)
        SButton("View Test Definition Activity").onClick(startActivity[DefinitionActivity])
      }.padding(20 dip)
    }

}


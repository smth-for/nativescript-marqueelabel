import { Label } from "tns-core-modules/ui/label";

declare let android: any;

export class NSMarqueeLabel extends Label {
  public initNativeView(): void {
    super.initNativeView();
    this.nativeViewProtected.setMarqueeRepeatLimit(-1);
    this.nativeViewProtected.setSingleLine(true);
    // this will constantly scroll the text
    this.nativeViewProtected.setSelected(true);
    // eslint-disable-next-line no-undef
    this.nativeViewProtected.setEllipsize(
      android.text.TextUtils.TruncateAt.MARQUEE
    );
  }
}

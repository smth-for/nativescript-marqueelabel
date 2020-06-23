import { ObservableArray } from "tns-core-modules/data/observable-array";
import { Observable } from "tns-core-modules/data/observable";

export class HomeViewModel extends Observable {
    constructor() {
        super();
        this.dataItems = new ObservableArray<DataItem>();

        setTimeout(() => {
            for (let i = 0; i < 10; i++) {
                this.dataItems.push(
                    new DataItem(
                        i,
                        "Item " + i,
                        "This is item description. It has a marquee effect because the description is very long."
                    )
                );
            }
        }, 5000);
    }

    get dataItems(): ObservableArray<DataItem> {
        return this.get("_dataItems");
    }

    set dataItems(value: ObservableArray<DataItem>) {
        this.set("_dataItems", value);
    }
}

export class DataItem {
    public id: number;
    public itemName;
    public itemDescription;

    constructor(id: number, name: string, description: string) {
        this.id = id;
        this.itemName = name;
        this.itemDescription = description;
    }
}

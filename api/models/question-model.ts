import {ResponseModel} from "./response-model";
import {InferIdType} from "mongodb";

interface QuestionModelProps {
    id: InferIdType<Document>;
    name: string;
    content: string;
    dateHourAdd?: Date;
    responses:ResponseModel[]
}

export class QuestionModel implements QuestionModelProps{
    id: InferIdType<Document>;
    name: string;
    content: string;
    dateHourAdd?: Date;
    responses:ResponseModel[]


    constructor(props: QuestionModelProps) {
        this.id = props.id;
        this.name = props.name;
        this.content = props.content;
        this.dateHourAdd = props.dateHourAdd;
        this.responses = props.responses;
    }
}

/* eslint-disable */
import { Timestamp } from "./google/protobuf/timestamp";

export const protobufPackage = "";

export interface Person {
  name: string;
  /** Unique ID number for this person. */
  id: number;
  email: string;
  phones: Person_PhoneNumber[];
  lastUpdated: Timestamp | undefined;
}

export enum Person_PhoneType {
  MOBILE = 0,
  HOME = 1,
  WORK = 2,
  UNRECOGNIZED = -1,
}

export interface Person_PhoneNumber {
  number: string;
  type: Person_PhoneType;
}

/** Our address book file is just one of these. */
export interface AddressBook {
  people: Person[];
}

export const _PACKAGE_NAME = "";

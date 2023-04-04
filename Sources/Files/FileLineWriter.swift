//
//  FileLineWriter.swift
//  HackAssembler
//
//  Created by Evgeniy Zabolotniy on 30.03.2023.
//

import Foundation

public class FileLineWriter {
  private let fileHandle: FileHandle

  private init?(path: String) {
    guard FileManager.default.createFile(
      atPath: path,
      contents: nil,
      attributes: nil),
      let fileHandle = FileHandle(forWritingAtPath: path)
    else {
      return nil
    }
    self.fileHandle = fileHandle
  }

  public func writeLine(_ line: String) {
    fileHandle.write((line + "\n").data(using: .utf8)!)
  }
}

extension FileLineWriter {
  public static func createFile(atPath path: String) -> FileLineWriter? {
    FileLineWriter(path: path)
  }
}

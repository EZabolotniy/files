//
//  FileLineReader.swift
//  HackAssembler
//
//  Created by Evgeniy Zabolotniy on 29.03.2023.
//

import Darwin

public class FileLineReader {
  private let file: UnsafeMutablePointer<FILE>

  private init?(path: String) {
    let file = fopen(path, "r")
    guard let file else {
      return nil
    }
    self.file = file
  }

  deinit {
    fclose(file)
  }
}

extension FileLineReader {
  public  static func readLines(path: String) -> AnySequence<String>? {
    FileLineReader(path: path).flatMap(AnySequence.init)
  }
}

extension FileLineReader: Sequence, IteratorProtocol {
  public func next() -> String? {
    var line: UnsafeMutablePointer<CChar>!
    var linecap: Int = 0
    defer { free(line) }
    if getline(&line, &linecap, file) > 0 {
      return String(cString: line)
    } else {
      return nil
    }
  }
}
